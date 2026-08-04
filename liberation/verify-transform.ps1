$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$expected = @{
  "LiberationMono-Bold.ttf" = "1e81c74bfaf93ce724e3c2118f085c84ee9f9aa7a56bfe4e87d7746863c4ab95"
  "LiberationMono-BoldItalic.ttf" = "319157f5d824ede8ce397e46d65d1fbd4d01c3699a903fff73c5a17ec120f5d9"
  "LiberationMono-Italic.ttf" = "00b76b2717491709a2c7f8dfacfebeeee12cdce06fb8a95b0dd8836033a432af"
  "LiberationMono-Regular.ttf" = "5738bfd34fac3e9454281b3ebdff6ba64f0558fac3dad4c7da22aae21a05fc1e"
  "LiberationSans-Bold.ttf" = "e32256f280c7ffeb29f9b8da6ceb64781c440ccd683b5fcc9c22646ffec019c5"
  "LiberationSans-BoldItalic.ttf" = "a3dbf57c98a0a6ec8fc7a10301f2f4440dbb171c90a3b5ab48b05622469bb9ce"
  "LiberationSans-Italic.ttf" = "0f9b08355791c08e7e704063d56971f72b31fde0bffe63a57f5683779ff9db8b"
  "LiberationSans-Regular.ttf" = "d44ef4341131f4f9bc7d336e0d5c479fe6ecf15a183e6b5a4e88289dd2d333d6"
  "LiberationSansNarrow-Bold.ttf" = "5ff9217a6a7cd6cccdca8fd436e3d8a7bbb075e7f6c009f8809480dc5349e2e6"
  "LiberationSansNarrow-BoldItalic.ttf" = "ceac79459f017d19275118fc27fbffb2924c2dd6645d362b0afece16026d98ec"
  "LiberationSansNarrow-Italic.ttf" = "f1d1465feb4ab621b9eadc42a722b5895944debd0aab96ef197e9ae3ab609c55"
  "LiberationSansNarrow-Regular.ttf" = "31de1a7adf5eb3e01a3d2319cae80ede2379a09cbbf692eb56f7024bfb0c8237"
  "LiberationSerif-Bold.ttf" = "0755523e1bf3f40612a563c0f5f4ce2e97110a9f5900b15b3dd598185f138ecb"
  "LiberationSerif-BoldItalic.ttf" = "a9ddeee9ca1ec9138d9fef5e6103f84e9113d1f1f34f97db61e1cd034150f722"
  "LiberationSerif-Italic.ttf" = "758024be56a69ac7222e41ea441c4a3bc2fef8386c27506afa0e52473a5df19d"
  "LiberationSerif-Regular.ttf" = "44c68d8acbf7314226592d30b50caf3832aaa81ab63b40f60cd11369618a613a"
}

foreach ($name in $expected.Keys) {
  $path = Join-Path $PSScriptRoot $name
  if (-not (Test-Path -LiteralPath $path)) { throw "missing payload: $name" }
  $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash.ToLowerInvariant()
  if ($actual -ne $expected[$name]) { throw "payload digest mismatch: $name" }
  $blob = (git -C $root hash-object -- $path).Trim()
  if ($blob -notmatch '^[0-9a-f]{40}$') { throw "not a regular Git blob: $name" }
}

$evidenceHashes = @{
  "License.txt" = "c40dd6adebad817defd68c7edad151d9c13d2ac3b4e1790ce2b727b024438b6d"
  "LicenseRef-Liberation.toml" = "11e4dd5a35e5f2640a68e2153b272ecc9e1b7e70fa0c5ef99a74ff2e6aeb0582"
  "attestations/debian-copyright" = "6d45ece44b5d855ec08440a48761e3266e2521e2c24c814404218e91d6d72442"
  "attestations/fedora-data-CC0-1.0.txt" = "f4e7f373b9b996950337e8d41a4a2939c2d90b7725e9baf3d5084a22717ad328"
  "attestations/fedora-data-dep5" = "f636cccbc5319c81915dd84349c4aafcc4c6810b990c8f285795c36c1899c9ef"
  "attestations/fedora-data-LicenseRef-License-of-Licenses.txt" = "3a3aac5c43d4d9178d1e9a5f5193bd04b0c26cfc443a53b64c0978151ac5915f"
  "attestations/fonts-liberation_1.07.4-2_all.deb" = "b342d0382aaf8d64a61c347b6e83f84c1ad50aa4ed3df661ece9010fce3ee72a"
  "attestations/fonts-liberation_1.07.4-2.dsc" = "d51db467a65d67ede5f6cace49946dd869f3ee3c8f264ee45e7b1c60eacdea5c"
  "attestations/fonts-liberation_1.07.4.orig.tar.gz" = "ad98b7498dc2992f7f0868f79b65ce4a720a3acdb63ab3f1f1cb6881117a5406"
}
foreach ($relativePath in $evidenceHashes.Keys) {
  $path = Join-Path $PSScriptRoot $relativePath
  $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash.ToLowerInvariant()
  if ($actual -ne $evidenceHashes[$relativePath]) {
    throw "evidence digest mismatch: $relativePath"
  }
}

$license = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot "License.txt")
foreach ($needle in @("GNU General Public License v.2", "use, modify, copy, and distribute", "document", "physical product", "LIBERATION")) {
  if ($license -notmatch [regex]::Escape($needle)) { throw "License.txt missing required term: $needle" }
}

$fedora = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot "LicenseRef-Liberation.toml")
if ($fedora -notmatch 'expression\s*=\s*"LicenseRef-Liberation"' -or
    $fedora -notmatch 'allowed-fonts') { throw "Fedora classification is not LicenseRef-Liberation/allowed-fonts" }

$dsc = Get-Content -Raw -LiteralPath (Join-Path $PSScriptRoot "attestations/fonts-liberation_1.07.4-2.dsc")
if ($dsc -notmatch 'Version: 1:1\.07\.4-2' -or
    $dsc -notmatch 'ad98b7498dc2992f7f0868f79b65ce4a720a3acdb63ab3f1f1cb6881117a5406\s+2937949\s+fonts-liberation_1\.07\.4\.orig\.tar\.gz') {
  throw "Debian source record does not bind Liberation 1.07.4"
}

Write-Output "Liberation evidence verified: $($expected.Count) payloads"
