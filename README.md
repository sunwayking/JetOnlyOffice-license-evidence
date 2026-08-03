# JetOnlyOffice License Evidence

This repository is an immutable build input for JetOnlyOffice 9.4.0. It mirrors
byte-identical release payloads from locked ONLYOFFICE source commits together
with versioned license evidence required for offline source-license
verification.

This is not a repository-wide license grant. Each top-level component has its
own reviewed SPDX expression and evidence locator:

| Component | SPDX | Evidence locator |
| --- | --- | --- |
| `fonts-beng-extra` | `GPL-2.0-or-later` | `fonts-beng-extra/LICENSE` |
| `fonts-gujr-extra` | `GPL-2.0-or-later` | `fonts-gujr-extra/LICENSE` |
| `kacst` | `GPL-2.0-only` | `kacst/LICENSE` |
| `kacst-one` | `GPL-2.0-only` | `kacst-one/LICENSE` |
| `en_GB` | `LGPL-3.0-only AND LicenseRef-Hyphen-en-GB-2011-10-07` | `en_GB/lgpl-3.0.txt`, `en_GB/README_hyph_en_GB.txt` |
| `de_AT` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_AT/README_de_DE_frami.txt`, `de_AT/README_hyph_de.txt`, `de_AT/dehyphn.tex` |
| `de_CH` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_CH/README_de_DE_frami.txt`, `de_CH/README_hyph_de.txt`, `de_CH/dehyphn.tex` |
| `de_DE` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_DE/README_de_DE_frami.txt`, `de_DE/README_hyph_de.txt`, `de_DE/dehyphn.tex` |
| `kk_KZ` | `GPL-2.0-or-later OR LGPL-2.1-or-later OR MPL-1.1` | `kk_KZ/COPYRIGHT` |

The `LICENSE.GPL-2.0` copies supplement the Debian copyright mappings with the
complete GPL version 2 text. Supplementary `COPYRIGHT` files retain the
package-to-file provenance for the KACST components.

The `en_GB` spelling and hyphenation payloads are exact Git blobs from the
locked dictionaries commit. `README_en_GB.txt` retains the spelling-dictionary
provenance, while the two evidence locators provide the complete LGPL 3.0 and
versioned hyphenation terms used by the reviewed component mapping.

The three German components are also exact blobs from the locked dictionaries
commit. Their LibreOffice source payloads are reproducibly converted from
ISO-8859-1 to BOM-free UTF-8. The mirrored notices and original TeX source bind
the spelling, hyphenation adaptation, and LPPL terms to those payloads.

The `kk_KZ` payloads are exact blobs from the locked dictionaries commit. The
Debian copyright record from the independently versioned `hunspell-kk` source
package establishes that GPL 2 or later, LGPL 2.1 or later, and MPL 1.1 are
alternative license choices. Removing the UTF-8 BOM and normalizing CRLF to LF
reproduces the locked payloads from that source commit byte for byte.

`ASC.ttf` is intentionally absent because no redistribution grant was found.
The `liberation` component is intentionally absent because its 1.07.4 custom
terms, especially Sans Narrow, still require explicit legal review.

Git LFS is forbidden in this repository. Consumers must select an immutable
tag and verify every payload path, Git blob ID, and SHA-256 before use.

See [PROVENANCE.md](PROVENANCE.md) for upstream versions and evidence digests.
