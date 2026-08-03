$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$windows1251 = [Text.Encoding]::GetEncoding(1251)
$utf8 = [Text.UTF8Encoding]::new($false, $true)

function Get-Sha256([byte[]]$Bytes) {
  return [Convert]::ToHexString(
    [Security.Cryptography.SHA256]::HashData($Bytes)
  ).ToLowerInvariant()
}

function Read-Bytes([string]$Name) {
  return [IO.File]::ReadAllBytes((Join-Path $componentRoot $Name))
}

function Assert-Hash([string]$Name, [string]$Expected) {
  $actual = Get-Sha256 (Read-Bytes $Name)
  if ($actual -ne $Expected) {
    throw "$Name SHA-256 mismatch: expected $Expected, got $actual"
  }
}

function Restore-Source([byte[]]$Locked, [string]$Name) {
  if (
    $Locked.Length -lt 3 -or
    $Locked[0] -ne 0xEF -or
    $Locked[1] -ne 0xBB -or
    $Locked[2] -ne 0xBF
  ) {
    throw "$Name does not start with the required UTF-8 BOM"
  }

  $text = $utf8.GetString($Locked, 3, $Locked.Length - 3)
  return $windows1251.GetBytes($text)
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

function Assert-TransformedSource(
  [string]$LockedName,
  [string]$SourceName
) {
  $restored = Restore-Source (Read-Bytes $LockedName) $LockedName
  Assert-Bytes $restored (Read-Bytes $SourceName) "$LockedName -> $SourceName"
}

function Read-ZipEntry(
  [IO.Compression.ZipArchive]$Archive,
  [string]$Name
) {
  $entry = $Archive.GetEntry($Name)
  if ($null -eq $entry) {
    throw "OXT entry is missing: $Name"
  }

  $stream = $entry.Open()
  $memory = [IO.MemoryStream]::new()
  try {
    $stream.CopyTo($memory)
    return $memory.ToArray()
  } finally {
    $memory.Dispose()
    $stream.Dispose()
  }
}

$hashes = [ordered]@{
  "dict_ru_ru-0.6.oxt" = "92dbd078637c087ff2a86bf45fcccf7cfd5a21af0e36767e760a39192a3d5e1a"
  "description.oxt.xml" = "e40b8d1290062e7af6cc43b1a35d3ba55a9c1c9ffa8fe339150d053933fbb335"
  "LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt" = "6327fa3b084fd87abf8f8779af3a7143da0ffbcc92498dcbd95f1d23b3d82bf7"
  "README_ru_RU.chromium.txt" = "ab0a15a2977d17936f8361c0644834aaa286aa0f76ff4a707e9435212b1387b2"
  "README.koi8-r.oxt.source" = "3dce83813948da2278c2668472dd394b7b240805196cc1c60ed10b5e6f2712dc"
  "README.oxt.source" = "636c0166c1df05c747580a905a1314009d39c46881bcd0ab93b8336e316062c4"
  "ru_RU.aff.koi8-r.source" = "f868ff4913af498d342fd9423d5a5295720aa2d66d0d9e7a05fc18fa0eb5e236"
  "ru_RU.dic.koi8-r.source" = "12b781ad1c8305cde4cb737a78d1aafa755fe16e2615c4584c4b14b86e2f02cd"
  "ru_RU_oo3.aff" = "abedafc2284041150125ae27e268fbe5cf8f43719f510c2becbd7b45d0fa7256"
  "ru_RU_oo3.dic" = "8e2d063a53ee36d7985d8380cc61e13da5d1c6d61e313e60e6a858f2fdfb2a8b"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

Assert-TransformedSource "ru_RU_oo3.aff" "ru_RU.aff.koi8-r.source"
Assert-TransformedSource "ru_RU_oo3.dic" "ru_RU.dic.koi8-r.source"

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archivePath = Join-Path $componentRoot "dict_ru_ru-0.6.oxt"
$archive = [IO.Compression.ZipFile]::OpenRead($archivePath)
try {
  $archiveEntries = [ordered]@{
    "description.xml" = "description.oxt.xml"
    "LICENSE" = "LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt"
    "README" = "README.oxt.source"
    "README.koi" = "README.koi8-r.oxt.source"
    "ru_RU.aff" = "ru_RU.aff.koi8-r.source"
    "ru_RU.dic" = "ru_RU.dic.koi8-r.source"
  }

  foreach ($entry in $archiveEntries.GetEnumerator()) {
    $archiveBytes = Read-ZipEntry $archive $entry.Key
    $mirroredBytes = Read-Bytes $entry.Value
    Assert-Bytes $archiveBytes $mirroredBytes "OXT $($entry.Key)"
  }
} finally {
  $archive.Dispose()
}

Write-Output "ru_RU_oo3 evidence verified"
