$ErrorActionPreference = "Stop"

$expected = [ordered]@{
  "pl_PL.aff" = "70495f9442d6b00f32ac101f4d01c2b058db17f46c6d2e7330d8429e7605e005"
  "pl_PL.dic" = "bd6173146cf54ff4781ee77479902766fe51ce4a1c866d418f4e4636a980359b"
  "hyph_pl_PL.dic" = "3ff33f47958b01a20f1468ee902ca1319a497f9dc79f266e5028e183bac2476a"
  "pl_PL_Polish.txt" = "9cf53ac8bbf47857f55e259430008e05ed9f987e10ad01abd14bb1ad22e5c6e2"
  "COPYING_GPLv2" = "edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6"
  "COPYING_LGPL_v2.1.txt" = "dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551"
  "MPL-1.1.txt" = "e039e3253cafabeea1aeabc4d0d14b28a56c470ecd3394c7f16ff23130c28860"
  "CC-SA-1.0.txt" = "fae7ba01de33fd09bef880f2265d71690247a024945d474b44a54ec0571a4228"
  "debian-copyright-ipolish-20090225.txt" = "27c531391a284a1e7b05d5d95cbba26c186e3361bd2b0aaaa9f9f7952fd502ff"
  "sjp-license-page.html" = "c2c3cf8260d34262287bf1cfc505cb8a2aa5aa75411e750affb6c06e5e9ee9b8"
}

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
foreach ($entry in $expected.GetEnumerator()) {
  $path = Join-Path $PSScriptRoot $entry.Key
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    throw "missing evidence file: $($entry.Key)"
  }
  $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
  if ($actual -ne $entry.Value) {
    throw "$($entry.Key): SHA-256 mismatch ($actual)"
  }
}

$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
$notice = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "pl_PL_Polish.txt"), $utf8)
if ($notice -notmatch "2008\.12\.06") { throw "notice missing 2008.12.06 version" }
if ($notice -notmatch "creativecommons\.org/licenses/sa/1\.0") { throw "notice missing CC-SA-1.0 URL" }
if ($notice -notmatch "LGPL 2\.1") { throw "notice missing hyphenation LGPL 2.1 grant" }
$cc = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "CC-SA-1.0.txt"), $utf8)
if ($cc -notmatch "ShareAlike 1\.0") { throw "CC text is not ShareAlike 1.0" }
$mpl = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "MPL-1.1.txt"), $utf8)
if ($mpl -notmatch "Version 1\.1") { throw "MPL text is not version 1.1" }
$debian = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "debian-copyright-ipolish-20090225.txt"), $utf8)
if ($debian -notmatch "GNU General Public License version 2") { throw "Debian copyright missing GPL v2 pin" }
if ($debian -notmatch "Mozilla Public License version 1\.1") { throw "Debian copyright missing MPL 1.1 pin" }
if ($debian -notmatch "Creative Commons Share Alike version 1\.0") { throw "Debian copyright missing CC-SA 1.0 pin" }
$sjp = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "sjp-license-page.html"), $utf8)
if ($sjp -notmatch "GPL 2") { throw "sjp page missing GPL 2" }
if ($sjp -notmatch "LGPL 2\.1") { throw "sjp page missing LGPL 2.1" }
if ($sjp -notmatch "MPL 1\.1") { throw "sjp page missing MPL 1.1" }

Write-Output "pl_PL evidence verified ($root)"
