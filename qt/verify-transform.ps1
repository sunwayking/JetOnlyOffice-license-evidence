$ErrorActionPreference = "Stop"

$expected = [ordered]@{
  "qt_binary_5.9.9_gcc_64.7z" = "84181f983a5e76c2f8a63f8bf06d5ce27675f543c45febe014514633a1289f0e"
  "LICENSE.GPLv3" = "245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17"
  "LICENSE.LGPLv3" = "5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52"
  "LICENSE.GPLv2" = "edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253"
  "LGPL_EXCEPTION.txt" = "438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084"
  "charts-LICENSE.GPL3.txt" = "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903"
  "datavis3d-LICENSE.GPL3.txt" = "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903"
  "virtualkeyboard-LICENSE.GPL3.txt" = "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903"
  "networkauth-LICENSE.GPL3.txt" = "8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903"
  "networkauth-LICENSE.GPL3-EXCEPT.txt" = "0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652"
  "zlib.h" = "51657b6b7c08966958e6f2ee325c04e17e1d0a9e9cc9da97363000b8e31707df"
  "png.h" = "f8e248049a97831f5e9fb24ec0c7c6b7cacb3b3ba7303300b4f5b2b90bae3c40"
  "libjpeg-8c-README.txt" = "a746ea327c2edb33a5a1800dc968c41a40af4ec0daee4810a0622e9c9373d1b7"
  "libtiff-4.1.0-COPYRIGHT.txt" = "fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7"
  "libwebp-COPYING.txt" = "5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf"
  "pcre2-LICENCE.txt" = "c4a8b89cd38d6a7501d5b11a472fa15e71a051b66d6331c6cda364101389d6ee"
  "double-conversion-LICENSE.txt" = "4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca"
  "harfbuzz-MIT.txt" = "2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216"
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
$gpl3 = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "LICENSE.GPLv3"), $utf8)
if ($gpl3 -notmatch "GNU GENERAL PUBLIC LICENSE") { throw "LICENSE.GPLv3 mismatch" }
$zlib = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "zlib.h"), $utf8)
if ($zlib -notmatch "version 1\.2\.11") { throw "zlib.h does not declare 1.2.11" }
$png = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "png.h"), $utf8)
if ($png -notmatch "libpng version 1\.6\.37") { throw "png.h does not declare 1.6.37" }

Write-Output "qt evidence verified ($root)"
