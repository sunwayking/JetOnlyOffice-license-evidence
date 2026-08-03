$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$latin1 = [Text.Encoding]::GetEncoding(
  28591,
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

function Get-Sha512([byte[]]$Bytes) {
  return [Convert]::ToHexString(
    [Security.Cryptography.SHA512]::HashData($Bytes)
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
    throw "ZIP must contain exactly one $Name entry"
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

function Convert-SourceText([byte[]]$Bytes) {
  $text = $latin1.GetString($Bytes)
  return $text.Replace("`r`n", "`n").Replace("`r", "`n")
}

$hashes = [ordered]@{
  "COPYING_LGPL_v2.1.txt" = "dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551"
  "COPYING_LGPL_v3.txt" = "e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118"
  "hyph_pt_BR.dic" = "a8eb1a64e4af4649c739211b397fa37b01f9d5774cf558fe3895fc3f26fd33a4"
  "hyphen-pt.spec" = "2c4f426155f7db9eadaaef77781c1e19f72cfac2e8a4e8f4889ebeb83bfde384"
  "hyphptBR-213.zip" = "ace7c36fc5c9147bc9e782a93c89ffee46dc868486d7991fbf1bcd9c2942fe6a"
  "pt_BR.aff" = "21d8ad2a769a60e17e2b5ea4ef11d4d593a58b9e2a82d642ef82d6a4c5523865"
  "pt_BR.dic" = "a38bfb26b68ece2834e79fe83e48d5792652970ace12db89d1b9674bf9933183"
  "README_hyph_pt_BR.txt" = "07400608865ce4c964cc443a9f354c733ca7f3f7d31f4463222b927cb7c54b87"
  "README_pt_BR.TXT" = "f687b608ecf02c57fc37ea81efa9bbdeef023cbf8eafc7a60467ab3417a1f29b"
  "sources" = "1d1ddea42c73e0bfe18aa96a030e04e6ef321c45319ca4e4a3d17e7f06459307"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

$gitBlobs = [ordered]@{
  "hyph_pt_BR.dic" = "d86e8a786a451882237aeaca153101dfc58062d9"
  "pt_BR.aff" = "4664ad6fc893e5683c1140eab8c1e1faeca802d3"
  "pt_BR.dic" = "849c1dcaf873e72e364f7a64b6f1f2a679bbb097"
  "README_hyph_pt_BR.txt" = "d1f762980cdc663db905b878ea0aa730ba55d207"
  "README_pt_BR.TXT" = "e74380f01af05c4bf58122f482639d50107ef364"
}

foreach ($entry in $gitBlobs.GetEnumerator()) {
  Assert-GitBlob $entry.Key $entry.Value
}

$sourceArchive = Read-Bytes "hyphptBR-213.zip"
$sourceSha512 =
  "dfcd0d1ae9e757891c319a1ff457172b4bf37c84421ab35ecd1d7079fc08b0da" +
  "18c72c0cd29bffb5b247c652dcf0725de85f5389d7462663032a3965456bdc01"
if ((Get-Sha512 $sourceArchive) -ne $sourceSha512) {
  throw "hyphptBR-213.zip SHA-512 mismatch"
}

$sourcesText = $utf8.GetString((Read-Bytes "sources"))
if (-not $sourcesText.Contains("SHA512 (hyphptBR-213.zip) = $sourceSha512")) {
  throw "sources does not bind the ZIP SHA-512"
}

$specText = $utf8.GetString((Read-Bytes "hyphen-pt.spec"))
$requiredSpecText = @(
  "Source0: https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/hyphptBR-213.zip",
  "License: LGPL-3.0-only AND GPL-1.0-or-later",
  "%package BR",
  "%files BR",
  "%doc README_hyph_pt_BR.txt",
  "%{_datadir}/hyphen/hyph_pt_BR.dic"
)
foreach ($required in $requiredSpecText) {
  if (-not $specText.Contains($required)) {
    throw "hyphen-pt.spec is missing required text: $required"
  }
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [IO.Compression.ZipFile]::OpenRead(
  (Join-Path $componentRoot "hyphptBR-213.zip")
)
try {
  $hyphenSource = Convert-SourceText (
    Read-ZipEntry $archive "hyph_pt_BR.dic"
  )
  if (-not $hyphenSource.StartsWith("ISO8859-1`n")) {
    throw "hyphenation source has an unexpected encoding declaration"
  }
  $hyphenTarget = "UTF-8`n" + $hyphenSource.Substring(10)
  Assert-Bytes (
    $utf8.GetBytes($hyphenTarget)
  ) (Read-Bytes "hyph_pt_BR.dic") "hyphenation conversion"

  $readmeSource = Convert-SourceText (
    Read-ZipEntry $archive "README_hyph_pt_BR.txt"
  )
  $cleanupMarker = "  $([char]0x96)  "
  $markerCount = ($readmeSource.Length -
    $readmeSource.Replace($cleanupMarker, "").Length) / $cleanupMarker.Length
  if ($markerCount -ne 1) {
    throw "README source must contain exactly one legacy separator"
  }
  $readmeTarget = $readmeSource.Replace($cleanupMarker, " ")
  Assert-Bytes (
    $utf8.GetBytes($readmeTarget)
  ) (Read-Bytes "README_hyph_pt_BR.txt") "README conversion"
} finally {
  $archive.Dispose()
}

Write-Output "pt_BR evidence verified"
