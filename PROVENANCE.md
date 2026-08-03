# Evidence Provenance

## Core font payload source

All TTF files are ordinary Git blobs copied without modification from
`ONLYOFFICE/core-fonts` commit
`7030c6681fb5bbed560675cb42422f91df15d5c9`. They were independently compared
with the distribution packages listed below. The consuming source lock records
the per-file Git blob IDs and SHA-256 values.

The supplemental `LICENSE.GPL-2.0` files are byte-identical copies of the GNU
GPL version 2 text published at
<https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt>, SHA-256
`edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6`.

## fonts-beng-extra

- Version: Debian `fonts-beng-extra 1.0-5`.
- Package SHA-256: `a909350b82912cf377d8e5cc803596b71b8beed87032788115c6766ac6f06082`.
- Evidence: `debian/copyright` from Debian Sources.
- Evidence SHA-256: `0906ca9525efa072ec67a37ed19c94cd0d37dea60c6707076cdfa66bdef7bc3c`.
- Source: <https://sources.debian.org/src/fonts-beng-extra/1.0-5/>.

## fonts-gujr-extra

- Version: Debian `fonts-gujr-extra 1.0-5`.
- Package SHA-256: `a6aacb23516f768c934af03f09cc0f6f6e059582430a7e4b5e2b8ad73e84216f`.
- Evidence: `debian/copyright` from Debian Sources.
- Evidence SHA-256: `3bb9e458484c1403105e72e6653fd5af0dffa91bdc60042bd395584b77f7bd60`.
- Source: <https://sources.debian.org/src/fonts-gujr-extra/1.0-5/>.

The unrelated `fonts-gujr-extra/LICENSE.txt` found in `core-fonts` is excluded.
It covers George Douros fonts, not Rekha or Padmaa.

## kacst

- Version: Debian `fonts-kacst 2.01+mry-12`; payloads also match Ubuntu
  `fonts-kacst 2.01+mry-14`.
- Ubuntu package SHA-256: `a39255b7b6c39bc1ee027111b091cdbd47fe9ac80bd99de8cf81331557e782d5`.
- GPL v2 text SHA-256: `296b69823ccb33e5785d7871e4dc05ac78426ae59873a258c5180556fe72782a`.
- Debian copyright SHA-256: `1f0d02a4efa1b7095e2cf8a2c2ad6c57dfabdf444c0b7abede69cb9ce6226c8b`.
- Source: <https://sources.debian.org/src/fonts-kacst/2.01%2Bmry-12/>.

## kacst-one

- Version: Ubuntu `fonts-kacst-one 5.0+svn11846-9`.
- Package SHA-256: `c2a7fdef3d7658c4f50941b976c9f2422b8e58496d8e72ae07310dd364fa63b5`.
- Ubuntu Debian tar SHA-256: `e8bb07a89f47bf2383f9c4f6a31ea1bd79a9c0e637a07a96a97fd2d135a5b0ce`.
- GPL v2 text SHA-256: `296b69823ccb33e5785d7871e4dc05ac78426ae59873a258c5180556fe72782a`.
- Ubuntu copyright SHA-256: `5d12ca7c5fba6bd2c8bbe9f0a079befa8311d98300345e48aaa9dde28a0257cc`.
- Source: <https://launchpad.net/ubuntu/+source/fonts-kacst-one/5.0%2Bsvn11846-9>.

## en_GB

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent upstream source: `LibreOffice/dictionaries` commit
  `08a2fe2451477d8d08ad2879ed1184a6dce468c5`.
- Original spelling source: `marcoagpinto/aoo-mozilla-en-dict` commit
  `daba3f53e134017bfb5bd034a306cafe957f321a`.
- `en_GB.aff`: Git blob `8816feced4bd05b3854600f102b111095ebcf2c6`,
  SHA-256 `04755f317851defd8b9f77fd7e5d60f495221fad926d0df346cd9b61b646bfc2`.
- `en_GB.dic`: Git blob `9cde7182ef1b855e6277342bf233d10711f26dc7`,
  SHA-256 `e070c64007d0f6a3423d028a53da099934b5f967dc0ef6d01b631ec2119659d4`.
- `hyph_en_GB.dic`: Git blob `e19d0ea7508c59d767933e954345534bd33aa163`,
  SHA-256 `9fdc97f7faabcda30c15a9d53bc7fbf21daec795fb3c9a9588f7bdb30c563f41`.
- Spelling provenance: `README_en_GB.txt`, Git blob
  `7dd301e401dfec9d84f322ca606687b1d01ad539`, SHA-256
  `8a736381614885b601c20168d0fbb2df7564fa43a239dca3723cb0a4cce60eef`.
- Hyphenation evidence: `README_hyph_en_GB.txt`, Git blob
  `4afac7b60bad9d8ba42b964706837834201ec321`, SHA-256
  `6f3d1dddcf62d2d452801bd86289ad5826a30d15a502c0825f5c73715372db50`.
- LGPL 3.0 text: <https://www.gnu.org/licenses/lgpl-3.0.txt>, SHA-256
  `e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118`.
