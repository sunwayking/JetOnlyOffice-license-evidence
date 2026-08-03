$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$latin2 = [Text.Encoding]::GetEncoding(
  28592,
  [Text.EncoderExceptionFallback]::new(),
  [Text.DecoderExceptionFallback]::new()
)
$utf8 = [Text.UTF8Encoding]::new($false, $true)

function Read-Bytes([string]$Name) {
  return [IO.File]::ReadAllBytes((Join-Path $componentRoot $Name))
}

function Get-Sha256([byte[]]$Bytes) {
  return [Convert]::ToHexString(
    [Security.Cryptography.SHA256]::HashData($Bytes)
  ).ToLowerInvariant()
}

function Get-GitBlobId([byte[]]$Bytes) {
  $header = [Text.Encoding]::ASCII.GetBytes("blob $($Bytes.Length)`0")
  $gitObject = [byte[]]::new($header.Length + $Bytes.Length)
  [Array]::Copy($header, 0, $gitObject, 0, $header.Length)
  [Array]::Copy($Bytes, 0, $gitObject, $header.Length, $Bytes.Length)
  return [Convert]::ToHexString(
    [Security.Cryptography.SHA1]::HashData($gitObject)
  ).ToLowerInvariant()
}

function Assert-Hash([string]$Name, [string]$Expected) {
  $actual = Get-Sha256 (Read-Bytes $Name)
  if ($actual -ne $Expected) {
    throw "$Name SHA-256 mismatch: expected $Expected, got $actual"
  }
}

function Assert-GitBlob([string]$Name, [string]$Expected) {
  $actual = Get-GitBlobId (Read-Bytes $Name)
  if ($actual -ne $Expected) {
    throw "$Name Git blob mismatch: expected $Expected, got $actual"
  }
}

function Assert-Bytes(
  [byte[]]$Actual,
  [byte[]]$Expected,
  [string]$Description
) {
  if ($Actual.Length -ne $Expected.Length) {
    throw "$Description length mismatch"
  }

  for ($index = 0; $index -lt $Expected.Length; $index++) {
    if ($Actual[$index] -ne $Expected[$index]) {
      throw "$Description differs at byte $index"
    }
  }
}

function Read-ZipEntry(
  [IO.Compression.ZipArchive]$Archive,
  [string]$Name
) {
  $entries = @($Archive.Entries | Where-Object FullName -ceq $Name)
  if ($entries.Count -ne 1) {
    throw "OXT must contain exactly one $Name entry"
  }

  $stream = $entries[0].Open()
  $memory = [IO.MemoryStream]::new()
  try {
    $stream.CopyTo($memory)
    return $memory.ToArray()
  } finally {
    $memory.Dispose()
    $stream.Dispose()
  }
}

function Convert-HyphenationSource([byte[]]$Bytes) {
  if (
    $Bytes.Length -ge 3 -and
    $Bytes[0] -eq 0xEF -and
    $Bytes[1] -eq 0xBB -and
    $Bytes[2] -eq 0xBF
  ) {
    throw "hyphenation source must not contain a UTF-8 BOM"
  }

  $text = $latin2.GetString($Bytes)
  $sourceHeader = "ISO8859-2`n"
  if (-not $text.StartsWith($sourceHeader)) {
    throw "hyphenation source has an unexpected encoding declaration"
  }
  if ($text.Contains("`r")) {
    throw "hyphenation source must retain LF line endings"
  }

  $converted = "UTF-8`n" + $text.Substring($sourceHeader.Length)
  return $utf8.GetBytes($converted)
}

$hashes = [ordered]@{
  "description.xml" = "8462ca9eacc24d7f321fe6ebe700f3d522eeb9dc6b42d850cd2e7c3216b43c15"
  "HR-dict.oxt" = "93a2fbddbad44cefc3ab2684a95320a9b83dfa1c5458e6c33a60809bb9e4e10d"
  "hyph-hr.tex" = "53fd09c47832a7c35df05090cd3c87d88212d2abc5e2a475f860986392c3ba24"
  "hyph_hr_HR.dic" = "88667f0810b4f25b72a3fc7f5db7a046981114fa6e0252e099b8286deb4614d6"
  "hyph_hr_HR.iso-8859-2.source.dic" = "77613ff6e907d2e9ffd93d45bfb16873aa9182e2215df276dbf850d1b0e28f65"
  "LPPL-1.0.txt" = "7790736e17a15a9e30f8adaacb3951c7b3a9e102c2cf48b9ac9a51bdf26297a0"
  "README_hyph_hr_HR.txt" = "2ba15b47f64eba01489d2962a8c04c6e457a33bba418d6384bda30dfe9e23b65"
  "registration-license_hr.txt" = "c4071157f028fb936bf974872572806415dabdeabdf4fd357a87847148ce7101"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

$gitBlobs = [ordered]@{
  "description.xml" = "21e8da442164a7fde58482769f8fdfb869b3588c"
  "HR-dict.oxt" = "543a14ec0c53bc09cc9d1a09d8c8877081e02c8f"
  "hyph-hr.tex" = "e269419d961ae63dd6b2546b115dfd8dd280be1d"
  "hyph_hr_HR.dic" = "8064cb087e5a7c69ae6e8e8f178efb6e32e6b827"
  "hyph_hr_HR.iso-8859-2.source.dic" = "04880ea64249fcd2abfb86f38467c18802cc8cb6"
  "LPPL-1.0.txt" = "1472b174eee6bbf052ec9dbd4cdeef66368bc35a"
  "README_hyph_hr_HR.txt" = "278ce6dbbb17de5384a99a245ec19bcbf6122fa0"
  "registration-license_hr.txt" = "ce09c5521b84ca82a6343ffb0cd6af6dd6992ffe"
}

foreach ($entry in $gitBlobs.GetEnumerator()) {
  Assert-GitBlob $entry.Key $entry.Value
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::OpenRead(
  (Join-Path $componentRoot "HR-dict.oxt")
)
try {
  $archiveFiles = [ordered]@{
    "description.xml" = "description.xml"
    "hyph_hr_HR.dic" = "hyph_hr_HR.iso-8859-2.source.dic"
    "README_hyph_hr_HR.txt" = "README_hyph_hr_HR.txt"
    "registration/license_hr.txt" = "registration-license_hr.txt"
  }

  foreach ($entry in $archiveFiles.GetEnumerator()) {
    Assert-Bytes (
      Read-ZipEntry $archive $entry.Key
    ) (Read-Bytes $entry.Value) "OXT $($entry.Key)"
  }

  $converted = Convert-HyphenationSource (
    Read-ZipEntry $archive "hyph_hr_HR.dic"
  )
  Assert-Bytes $converted (Read-Bytes "hyph_hr_HR.dic") (
    "ISO-8859-2 to UTF-8 conversion"
  )
} finally {
  $archive.Dispose()
}

$description = $utf8.GetString((Read-Bytes "description.xml"))
foreach ($required in @(
  '<version value="2023.09.07" />',
  '<identifier value="org.openoffice.hr.hunspell.dictionaries" />'
)) {
  if (-not $description.Contains($required)) {
    throw "description.xml is missing required text: $required"
  }
}

$license = $utf8.GetString((Read-Bytes "registration-license_hr.txt"))
foreach ($required in @(
  "GNU Lesser General Public License Version 3",
  "GNU LESSER GENERAL PUBLIC LICENSE`r`n                       Version 3",
  "Third Party Code. Additional copyright notices and license terms"
)) {
  if (-not $license.Contains($required)) {
    throw "registration license is missing required text: $required"
  }
}

$patterns = $utf8.GetString((Read-Bytes "hyph-hr.tex"))
foreach ($required in @(
  "Copyright (C) 1994, 1996, 2011 Igor Marinović",
  "LaTeX Project Public License",
  "version 1 of the License, or any later version"
)) {
  if (-not $patterns.Contains($required)) {
    throw "original patterns are missing required text: $required"
  }
}

$lppl = $utf8.GetString((Read-Bytes "LPPL-1.0.txt"))
if (-not $lppl.Contains("LPPL Version 1.0 1999-03-01")) {
  throw "LPPL-1.0.txt is missing its version declaration"
}

$readme = $utf8.GetString((Read-Bytes "README_hyph_hr_HR.txt"))
foreach ($required in @(
  "License: OpenOffice.org adaption of this file is licensed under the GNU LGPL license.",
  "Source: hrhyph.tex (1996-04-10)"
)) {
  if (-not $readme.Contains($required)) {
    throw "hyphenation README is missing required text: $required"
  }
}

Write-Output "hr_HR evidence verified"
