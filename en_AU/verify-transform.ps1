$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
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

function Convert-HyphenationSource([byte[]]$Bytes) {
  if (
    $Bytes.Length -ge 3 -and
    $Bytes[0] -eq 0xEF -and
    $Bytes[1] -eq 0xBB -and
    $Bytes[2] -eq 0xBF
  ) {
    throw "hyphenation source must not contain a UTF-8 BOM"
  }

  $text = $utf8.GetString($Bytes)
  $sourceHeader = "ISO8859-1`n"
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
  "COPYING_LGPL_v3.txt" = "e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118"
  "description.xml" = "f99d84220d3733f147b651ec006b4fef91bdd274fbaab8ced7ddc7d25537664b"
  "en_AU.aff" = "e746c882dd6f303c2c46e7452804b9201115a6942cfeb15f18f8edf774d2e24e"
  "en_AU.dic" = "aa07c46571f306b79fc1bc534357ed357af15687381b26f891ba66e8a2caed89"
  "extension-makefile.mk" = "0d34cc6efaebbfb8260a33ea27309df5b470da69af9a7b1c7fdd91ee148ce609"
  "hyph_en_AU.dic" = "2d2598c7660a44d2e05fae3d1a443f9a71ac5450de3b9a14a9db0f457006ac59"
  "hyph_en_GB.iso-8859-1.source.dic" = "fce7eb71e1385d18f297c2d0b98902b92329f1255c37a2a224d2dd93f229c5fe"
  "manifest.xml" = "323f38618f7e7dcdab2c3a6fc2e0bf800c79359b9df800b29959045b533fd075"
  "package-dictionaries.xcu" = "0e700a7ca4a1cf434c5a0ec870007d78e05cbbd99c58d7a0c0805ab4cdc2deee"
  "README_en_AU.txt" = "f0897dcfdf058bcfc93fbc8e7e1b5da4c27ae9e175ee3a9242e887f02eb84a8b"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

$gitBlobs = [ordered]@{
  "COPYING_LGPL_v3.txt" = "0a041280bd00a9d068f503b8ee7ce35214bd24a1"
  "description.xml" = "f143c187a4abd45a165144dfad4aa28bb7152cb6"
  "en_AU.aff" = "290acfe87caf0f7ef44cf04dba4cd3b3cf2dbc58"
  "en_AU.dic" = "c7e8ccb71535d1c854ee0ba71cf27cfc93ac48ba"
  "extension-makefile.mk" = "cb6aecebba79afef12fa264ae4ba650bd7df3417"
  "hyph_en_AU.dic" = "3df13df6503a037d262187772abfd7ce37d4a607"
  "hyph_en_GB.iso-8859-1.source.dic" = "c2c5f8e2f7afa8259e0aeded6a859d8026fde1c0"
  "manifest.xml" = "f54199bc6520dc042eb8dd6d9dda4a098b58d519"
  "package-dictionaries.xcu" = "7d571f70552f767c1e11a5b0d435fc7176873a12"
  "README_en_AU.txt" = "8e870199249d37ea240fd723f5723858ee8d1ea3"
}

foreach ($entry in $gitBlobs.GetEnumerator()) {
  Assert-GitBlob $entry.Key $entry.Value
}

$converted = Convert-HyphenationSource (
  Read-Bytes "hyph_en_GB.iso-8859-1.source.dic"
)
Assert-Bytes $converted (Read-Bytes "hyph_en_AU.dic") (
  "encoding-declaration conversion"
)

$readme = $utf8.GetString((Read-Bytes "README_en_AU.txt"))
foreach ($required in @(
  "en_AU Hunspell Dictionary`nVersion 2020.12.07",
  "Permission to use, copy, modify, distribute and sell these word",
  "lists, the associated scripts, the output created from the scripts"
)) {
  if (-not $readme.Contains($required)) {
    throw "README_en_AU.txt is missing required text: $required"
  }
}

$makefile = $utf8.GetString((Read-Bytes "extension-makefile.mk"))
foreach ($required in @(
  "GNU Lesser General Public License version 3`n# only",
  'EXTENSION_ZIPNAME:=dict-en',
  '$(EXTENSIONDIR)$/hyph_en_GB.dic',
  "# disable fetching default OOo license text"
)) {
  if (-not $makefile.Contains($required)) {
    throw "extension-makefile.mk is missing required text: $required"
  }
}

$description = $utf8.GetString((Read-Bytes "description.xml"))
foreach ($required in @(
  '<identifier value="org.openoffice.en.hunspell.dictionaries" />',
  '<name lang="en">English spelling and hyphenation dictionaries and thesaurus</name>'
)) {
  if (-not $description.Contains($required)) {
    throw "description.xml is missing required text: $required"
  }
}

$configuration = $utf8.GetString((Read-Bytes "package-dictionaries.xcu"))
foreach ($required in @(
  '<value>%origin%/hyph_en_GB.dic</value>',
  '<value>DICT_HYPH</value>'
)) {
  if (-not $configuration.Contains($required)) {
    throw "package-dictionaries.xcu is missing required text: $required"
  }
}

$license = $utf8.GetString((Read-Bytes "COPYING_LGPL_v3.txt"))
if (-not $license.Contains("GNU LESSER GENERAL PUBLIC LICENSE`n                       Version 3")) {
  throw "COPYING_LGPL_v3.txt is missing its version declaration"
}

Write-Output "en_AU evidence verified"
