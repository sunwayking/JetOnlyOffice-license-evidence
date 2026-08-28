$ErrorActionPreference = "Stop"

$expected = [ordered]@{
  "uz_Latn_UZ.aff" = "dcd0490994e6ddadb444ec0808e94dbf8038de48b91b57df07af4420916e79c5"
  "uz_Latn_UZ.dic" = "0e90dfabe5366c92740dda9f80400bfc3c6c721404ac9662214bbc9102d9d247"
  "LICENSE" = "d7d9e4eccc3f46417c7ed802bc483a999c0cddebf5714320c5ed18b7b6860711"
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
if ($license -notmatch "MIT License") {
  throw "LICENSE does not contain the MIT license grant"
}
if ($license -notmatch "Copyright \(c\) 2021 Alisher Jalolov") {
  throw "LICENSE does not name the upstream author"
}
foreach ($payload in @("uz_Latn_UZ.aff", "uz_Latn_UZ.dic")) {
  $text = [System.IO.File]::ReadAllText((Join-Path $PSScriptRoot $payload), $utf8)
  if ($payload -eq "uz_Latn_UZ.aff" -and $text -notmatch "\(c\) 2019, Alisher .U2B3K. Jalolov") {
    throw "$($payload): missing author header"
  }
}

Write-Output "uz_Latn_UZ evidence verified ($root)"
