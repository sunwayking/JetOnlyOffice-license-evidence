$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

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

function Convert-ToLockedPayload([byte[]]$Source) {
  if (
    $Source.Length -ge 3 -and
    $Source[0] -eq 0xEF -and
    $Source[1] -eq 0xBB -and
    $Source[2] -eq 0xBF
  ) {
    throw "source payload must not contain a UTF-8 BOM"
  }

  foreach ($value in $Source) {
    if ($value -eq 0x0D) {
      throw "source payload must use LF-only line endings"
    }
  }

  $converted = [byte[]]::new($Source.Length + 3)
  $converted[0] = 0xEF
  $converted[1] = 0xBB
  $converted[2] = 0xBF
  [Array]::Copy($Source, 0, $converted, 3, $Source.Length)
  return $converted
}

$hashes = [ordered]@{
  "aspell6-az-0.02-0.tar.bz2" = "063176ec459d61acd59450ae49b5076e42abb1dcd54c1f934bae5fa6658044c3"
  "az_Latn_AZ.aff" = "4b9cdc2bd26c2c8e34d23f10f3e8d4d014bb0d1dc7e274fbc7e3bdc097b28bec"
  "az_Latn_AZ.dic" = "682e06189b1015d184cd65d8d68dedd6383fac9f0b8c850c17db5cd22d030761"
  "az-Latn-AZ.aff.source" = "ae28ceef851a97abeb65165a4aab8195719f2eda7aebfe35c51d448cca5da814"
  "az-Latn-AZ.dic.source" = "dd4f966711b93a27d26d26cee91ded564d5d5b67aab86e8dba689cfdb2f19f19"
  "COPYING_GPL_v2.txt" = "204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994"
  "COPYRIGHT" = "f8802a13346e5c3e4563b55b9494dd7146cc916367ac78e9757735b23ba3996f"
  "Crawler.txt" = "c6e096a7ff26ae5de158d6175b8abc542ff9860e5c8c9ba102cf6fa69cc352fd"
  "hunspell-az-0.20040827-14.fc24.noarch.rpm" = "e78edfd329d797f77b684b73e47153a884be2046d9e299e8df573289fc9cd378"
  "hunspell-az.spec" = "2f4ae6cef4f3edcd2e2946a1cd0d1fe77567564392cb1244326319d8e3561ff3"
  "README.aspell.txt" = "a95494e852c98ea8357b3dca4076f664131506a6aad8803156898996cb70254e"
  "sources" = "74326e1dfdf45137388884b921c9430f283bf9054787034db4cd7383f224905b"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

$gitBlobs = [ordered]@{
  "az_Latn_AZ.aff" = "30cf29a721bab2994913a886a25ab8a1d695a7c8"
  "az_Latn_AZ.dic" = "dd415fa85246ab1044465d838e041fc6d1b8cdf0"
  "az-Latn-AZ.aff.source" = "c330d3960e3c4276d4242b262b981c524024969b"
  "az-Latn-AZ.dic.source" = "2f3474cc90b2937013f85e18986d9dd93b0462fb"
  "COPYING_GPL_v2.txt" = "5b6e7c66c276e7610d4a73c70ec1a1f7c1003259"
  "COPYRIGHT" = "f6e2bbc6498024f151628f6af2985381181735fe"
  "hunspell-az.spec" = "268708f8f037c3229eba51603649e58f0df52685"
  "sources" = "c77b624f2d2549de5259b91335d94373353e6004"
}

foreach ($entry in $gitBlobs.GetEnumerator()) {
  Assert-GitBlob $entry.Key $entry.Value
}

foreach ($pair in @(
  @("az-Latn-AZ.aff.source", "az_Latn_AZ.aff"),
  @("az-Latn-AZ.dic.source", "az_Latn_AZ.dic")
)) {
  $converted = Convert-ToLockedPayload (Read-Bytes $pair[0])
  Assert-Bytes $converted (Read-Bytes $pair[1]) "$($pair[0]) conversion"
}

$utf8 = [Text.UTF8Encoding]::new($false, $true)
$latin1 = [Text.Encoding]::GetEncoding(
  28591,
  [Text.EncoderExceptionFallback]::new(),
  [Text.DecoderExceptionFallback]::new()
)
$copyright = $latin1.GetString((Read-Bytes "COPYRIGHT"))
foreach ($required in @(
  "Aspell dictionary for Azerbaijani",
  "Copyright 2004 Metin Amiroff",
  "either version 2 of the License, or",
  "(at your option) any later version"
)) {
  if (-not $copyright.Contains($required)) {
    throw "COPYRIGHT is missing required text: $required"
  }
}

$copying = $utf8.GetString((Read-Bytes "COPYING_GPL_v2.txt"))
if (-not $copying.Contains("GNU GENERAL PUBLIC LICENSE`n")) {
  throw "COPYING_GPL_v2.txt is missing the GPL title"
}
if (-not $copying.Contains("Version 2, June 1991")) {
  throw "COPYING_GPL_v2.txt is missing its version declaration"
}

$readme = $utf8.GetString((Read-Bytes "README.aspell.txt"))
foreach ($required in @(
  "Version 0.02-0",
  "Copyright Terms: GPL (see the file Copyright for the exact terms)"
)) {
  if (-not $readme.Contains($required)) {
    throw "README.aspell.txt is missing required text: $required"
  }
}

$spec = $utf8.GetString((Read-Bytes "hunspell-az.spec"))
foreach ($required in @(
  "Source: ftp://ftp.gnu.org/gnu/aspell/dict/az/aspell6-az-0.02-0.tar.bz2",
  "License: GPL+",
  "preunzip az.cwl",
  "wordlist2hunspell az.wl az_AZ",
  "%doc COPYING Copyright README doc/Crawler.txt",
  "%{_datadir}/myspell/*"
)) {
  if (-not $spec.Contains($required)) {
    throw "hunspell-az.spec is missing required text: $required"
  }
}

$sources = $utf8.GetString((Read-Bytes "sources"))
if (-not $sources.Contains(
  "063176ec459d61acd59450ae49b5076e42abb1dcd54c1f934bae5fa6658044c3 *aspell6-az-0.02-0.tar.bz2"
)) {
  throw "sources does not bind the official Aspell archive SHA-256"
}

Write-Output "az_Latn_AZ evidence verified"
