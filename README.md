# JetOnlyOffice License Evidence

This repository is an immutable build input for JetOnlyOffice 9.4.0. It mirrors
byte-identical font payloads from ONLYOFFICE `core-fonts` commit
`7030c6681fb5bbed560675cb42422f91df15d5c9` together with versioned license
evidence required for offline source-license verification.

This is not a repository-wide license grant. Each top-level component has its
own reviewed SPDX expression and evidence locator:

| Component | SPDX | Evidence locator |
| --- | --- | --- |
| `fonts-beng-extra` | `GPL-2.0-or-later` | `fonts-beng-extra/LICENSE` |
| `fonts-gujr-extra` | `GPL-2.0-or-later` | `fonts-gujr-extra/LICENSE` |
| `kacst` | `GPL-2.0-only` | `kacst/LICENSE` |
| `kacst-one` | `GPL-2.0-only` | `kacst-one/LICENSE` |

The `LICENSE.GPL-2.0` copies supplement the Debian copyright mappings with the
complete GPL version 2 text. Supplementary `COPYRIGHT` files retain the
package-to-file provenance for the KACST components.

`ASC.ttf` is intentionally absent because no redistribution grant was found.
The `liberation` component is intentionally absent because its 1.07.4 custom
terms, especially Sans Narrow, still require explicit legal review.

Git LFS is forbidden in this repository. Consumers must select an immutable
tag and verify every payload path, Git blob ID, and SHA-256 before use.

See [PROVENANCE.md](PROVENANCE.md) for upstream versions and evidence digests.
