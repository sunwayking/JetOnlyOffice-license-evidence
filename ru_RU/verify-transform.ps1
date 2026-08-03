$ErrorActionPreference = "Stop"

$componentRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$windows1251 = [Text.Encoding]::GetEncoding(1251)
$utf8 = [Text.UTF8Encoding]::new($false, $true)

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

function Read-Bytes([string]$Name) {
  return [IO.File]::ReadAllBytes((Join-Path $componentRoot $Name))
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

function Read-TarEntry([string]$ArchiveName, [string]$EntryName) {
  $startInfo = [Diagnostics.ProcessStartInfo]::new()
  $startInfo.FileName = "tar"
  $startInfo.ArgumentList.Add("-xOf")
  $startInfo.ArgumentList.Add((Join-Path $componentRoot $ArchiveName))
  $startInfo.ArgumentList.Add($EntryName)
  $startInfo.RedirectStandardOutput = $true
  $startInfo.RedirectStandardError = $true
  $startInfo.UseShellExecute = $false

  $process = [Diagnostics.Process]::new()
  $process.StartInfo = $startInfo
  $memory = [IO.MemoryStream]::new()
  try {
    if (-not $process.Start()) {
      throw "failed to start tar"
    }
    $errorTask = $process.StandardError.ReadToEndAsync()
    $process.StandardOutput.BaseStream.CopyTo($memory)
    $process.WaitForExit()
    $errorText = $errorTask.GetAwaiter().GetResult()
    if ($process.ExitCode -ne 0) {
      throw "tar failed for $EntryName`: $errorText"
    }
    return $memory.ToArray()
  } finally {
    $memory.Dispose()
    $process.Dispose()
  }
}

$hashes = [ordered]@{
  "COPYRIGHT" = "15092e924d00de1c127e75f08089fac9579808d47ccd64dd661f5fac428fd4ab"
  "dict_ru_ru-0.6.oxt" = "92dbd078637c087ff2a86bf45fcccf7cfd5a21af0e36767e760a39192a3d5e1a"
  "description.oxt.xml" = "e40b8d1290062e7af6cc43b1a35d3ba55a9c1c9ffa8fe339150d053933fbb335"
  "hyph_ru_RU.dic" = "e9a6ae92765fc7e63d879f2ccf3f50f2b95bc8ed7618a6f31c34ce7d39844c83"
  "LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt" = "6327fa3b084fd87abf8f8779af3a7143da0ffbcc92498dcbd95f1d23b3d82bf7"
  "libreoffice-dictionaries_7.2.0-1.debian.tar.xz" = "884d43ec0c208d40a8e323e82b05352ec99acb42031303cffba1620ccadfa8cc"
  "libreoffice-dictionaries_7.2.0-1.dsc" = "e4d1ac6f71bfe219b8c26bf5719ad6adcdbf369d764ea90972015f7b7ef40e73"
  "README_ru_RU.chromium.txt" = "ab0a15a2977d17936f8361c0644834aaa286aa0f76ff4a707e9435212b1387b2"
  "README_ru_RU.libreoffice.txt" = "262af2f6ad70a61e5ee1332ff44fa8ee50edca819cf33207d8ad6ba6a0c9be52"
  "README.koi8-r.oxt.source" = "3dce83813948da2278c2668472dd394b7b240805196cc1c60ed10b5e6f2712dc"
  "README.oxt.source" = "636c0166c1df05c747580a905a1314009d39c46881bcd0ab93b8336e316062c4"
  "ru_RU.aff" = "38ce7d4af78e211e9bafe4bf7e3d6a2c420591136cb738ec6648f8fdf6524cd7"
  "ru_RU.aff.koi8-r.source" = "f868ff4913af498d342fd9423d5a5295720aa2d66d0d9e7a05fc18fa0eb5e236"
  "ru_RU.dic" = "f6047416a0204adbecf3a451b874ec8a97ee37e2cbc714466ef04d8dbcc0d6fc"
  "ru_RU.dic.koi8-r.source" = "12b781ad1c8305cde4cb737a78d1aafa755fe16e2615c4584c4b14b86e2f02cd"
  "ru_RU_oo3.aff" = "abedafc2284041150125ae27e268fbe5cf8f43719f510c2becbd7b45d0fa7256"
  "ru_RU_oo3.dic" = "8e2d063a53ee36d7985d8380cc61e13da5d1c6d61e313e60e6a858f2fdfb2a8b"
}

foreach ($entry in $hashes.GetEnumerator()) {
  Assert-Hash $entry.Key $entry.Value
}

$gitBlobs = [ordered]@{
  "COPYRIGHT" = "59b861c1529a9292a1edb5ac690d784b15fe0093"
  "hyph_ru_RU.dic" = "1d82ffc3b4044e8d587751a368a4850c9cc6bad7"
  "libreoffice-dictionaries_7.2.0-1.debian.tar.xz" = "9df739017833abdd28fafd15c1ca8e36ce84056e"
  "libreoffice-dictionaries_7.2.0-1.dsc" = "65d651cc5ef1b93b95f229667f4e27df82aba0f9"
  "README_ru_RU.libreoffice.txt" = "4620b48a8a37d8f3f29dda667ea0aacc992bd26c"
  "ru_RU.aff" = "b6bef6d261914c579542b59c89dd03b83ae5927c"
  "ru_RU.dic" = "e5cfd3614c2303be12da481198b5d914e592da9c"
  "ru_RU_oo3.aff" = "dc7bf1523582bf2960774ec52cfcffcc1e7e5651"
  "ru_RU_oo3.dic" = "57e14338dd70a139605712e2b70ca97a3c967051"
}

foreach ($entry in $gitBlobs.GetEnumerator()) {
  Assert-GitBlob $entry.Key $entry.Value
}

$debianArchive = "libreoffice-dictionaries_7.2.0-1.debian.tar.xz"
$debianArchiveSha256 =
  "884d43ec0c208d40a8e323e82b05352ec99acb42031303cffba1620ccadfa8cc"
$dscRecord = " $debianArchiveSha256 67108 $debianArchive"
$dscText = [Text.Encoding]::UTF8.GetString(
  (Read-Bytes "libreoffice-dictionaries_7.2.0-1.dsc")
)
if (-not $dscText.Contains($dscRecord)) {
  throw "Debian archive digest is not listed in the signed .dsc"
}

$debianCopyright = Read-TarEntry $debianArchive "debian/copyright"
Assert-Bytes $debianCopyright (Read-Bytes "COPYRIGHT") "Debian copyright"

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

Write-Output "ru_RU evidence verified"
