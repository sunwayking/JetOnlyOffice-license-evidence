$ErrorActionPreference = "Stop"

$expected = [ordered]@{
  "mn_MN.aff" = "87efe2c6e537a90e17be372428e4dfeb2bba015b8b55621b5c21c68b4910e84d"
  "mn_MN.dic" = "2a54ec6fc032b6ec6fc5e825c2fcfa92ffb355553bab641a2c2b5e05ffec6fa0"
  "hyph_mn_MN.dic" = "1a84d6b69fef22efdbee6e2f53e45b2aabfbfc7789b1dabc54950d7d3cd29ebe"
  "LICENSE" = "27597ab18210ecf1285ec984cb153df71cf17119347a3fb5ca52b15eccba53f6"
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
$license = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot "LICENSE"), $utf8)
if ($license -notmatch "LPPL Version 1\.3c") {
  throw "LICENSE does not contain LPPL 1.3c"
}
foreach ($payload in @("mn_MN.aff", "mn_MN.dic", "hyph_mn_MN.dic")) {
  $text = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot $payload), $utf8)
  if ($text -notmatch "LaTeX Project Public License, either version 1\.3") {
    throw "${payload}: missing LPPL 1.3-or-later header"
  }
}

Write-Output "mn_MN evidence verified ($root)"
