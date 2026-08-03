# Evidence Provenance

## Payload source

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
