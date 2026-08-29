$ErrorActionPreference = "Stop"

$expected = [ordered]@{
  "python3.tar.gz" = "c251fd88959ad83a64711d37d7897d0bf7a3ed272f23b6ef6216e0eed0bf9360"
  "PSF-LICENSE.txt" = "d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b"
  "pip-20.3.4-MIT.txt" = "81d012fe03f24d49014efbe0a0d3651bd32fd4a1434e283a5b525d78c0f611f8"
  "setuptools-44.1.1-MIT.txt" = "c32a3ac395af6321efd28be73d06a00f0db6ab887d1c21d4fec46128d2056d5a"
  "wheel-0.37.1-MIT.txt" = "cca9e20c6af1fcfbf69408f377769286cbeebcded336100c9b4a3f35fbe635e4"
  "Apache-2.0.txt" = "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30"
  "MPL-2.0.txt" = "fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85"
  "chardet-3.0.4-LGPL.txt" = "6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3"
  "colorama-0.4.4-BSD3.txt" = "cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318"
  "pygments-2.12.0-BSD2.txt" = "a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17"
  "progress-1.5-ISC.txt" = "71a13496c621f01b454f9aa54fa608a712f58eb253e6dd2c91027fe78340c773"
  "packaging-20.8-LICENSE.BSD.txt" = "b70e7e9b742f1cc6f948b34c16aa39ffece94196364bc88ff0d2180f0028fac5"
  "packaging-20.8-LICENSE.APACHE.txt" = "0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594"
  "OpenSSL-1.1.1j-LICENSE.txt" = "c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c"
  "expat-2.4.9-COPYING.txt" = "122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534"
  "libmpdec-1.70-LICENSE.txt" = "b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a"
  "zlib-1.2.12-LICENSE.txt" = "045cf777c6c9109b28ddcf3a413c5ca15e39fc513c13ef87bd9a3132a59d1b51"
  "bzip2-1.0.6-LICENSE.txt" = "4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204"
  "xz-5.2.4-COPYING.txt" = "bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c"
  "SQLite-3.19.3-PublicDomain.txt" = "44ca9f793055c8e32fc65f65a4f5bcf813a33f5bdaaa084067dd617a4ed3cc70"
  "libffi-LICENSE.txt" = "deaf3a42effb551a5b140fa9afefed183a27f1341c6d1bf430d106a5e6931fc0"
  "libedit-BSD3.txt" = "a25e06619067279a72664c5763746c3493d41a8d47018552c6fe5d0bd2df52da"
  "ncurses-COPYING.txt" = "a85ca5bef8ce71f013bc5f4306c681881b248450f3b63722589891f0b69ea52d"
  "libuuid-BSD3.txt" = "9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d"
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
$psf = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "PSF-LICENSE.txt"), $utf8)
if ($psf -notmatch "PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2") { throw "PSF text is not PSF-2.0" }
$openssl = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "OpenSSL-1.1.1j-LICENSE.txt"), $utf8)
if ($openssl -notmatch "OpenSSL License") { throw "OpenSSL license text mismatch" }
$zlib = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "zlib-1.2.12-LICENSE.txt"), $utf8)
if ($zlib -notmatch "version 1\.2\.12, March 11th, 2022") { throw "zlib.h does not declare 1.2.12" }
$sqlite = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "SQLite-3.19.3-PublicDomain.txt"), $utf8)
if ($sqlite -notmatch "public domain") { throw "SQLite text is not public domain" }
$xz = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "xz-5.2.4-COPYING.txt"), $utf8)
if ($xz -notmatch "public domain") { throw "XZ text is not public domain" }

Write-Output "python evidence verified ($root)"
