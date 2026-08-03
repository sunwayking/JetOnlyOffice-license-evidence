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
| `da_DK` | `(GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1) AND LGPL-2.1-or-later AND LPPL-1.3c` | `da_DK/da_DK_Danish.txt`, `da_DK/README_hyph_da_DK.txt`, `da_DK/hyphen-da.spec`, `da_DK/dkhyph.tex` |
| `en_GB` | `LGPL-3.0-only AND LicenseRef-Hyphen-en-GB-2011-10-07` | `en_GB/lgpl-3.0.txt`, `en_GB/README_hyph_en_GB.txt` |
| `de_AT` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_AT/README_de_DE_frami.txt`, `de_AT/README_hyph_de.txt`, `de_AT/dehyphn.tex` |
| `de_CH` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_CH/README_de_DE_frami.txt`, `de_CH/README_hyph_de.txt`, `de_CH/dehyphn.tex` |
| `de_DE` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_DE/README_de_DE_frami.txt`, `de_DE/README_hyph_de.txt`, `de_DE/dehyphn.tex` |
| `el_GR` | `LGPL-2.1-or-later` | `el_GR/el_GR_Greek.txt`, `el_GR/hyphen-el.spec`, `el_GR/COPYING_LGPL_v2.1.txt` |
| `id_ID` | `LGPL-3.0-only` | `id_ID/LICENSE-dict`, `id_ID/README_id_ID.txt`, `id_ID/description.xml` |
| `it_IT` | `GPL-3.0-only AND LGPL-2.1-or-later` | `it_IT/README_it_IT.txt`, `it_IT/README_hyph_it_IT.txt`, `it_IT/hyph-it.README` |
| `kk_KZ` | `GPL-2.0-or-later OR LGPL-2.1-or-later OR MPL-1.1` | `kk_KZ/COPYRIGHT` |
| `lt_LT` | `BSD-3-Clause` | `lt_LT/COPYING` |
| `pt_PT` | `GPL-2.0-only` | `pt_PT/COPYRIGHT`, `pt_PT/COPYING_GPLv2` |
| `ru_RU` | `LicenseRef-Russian-Dictionaries-Lebedev-1997-2008` | `ru_RU/LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt`, `ru_RU/README_ru_RU.chromium.txt` |
| `sl_SI` | `LGPL-2.1-only AND LPPL-1.0` | `sl_SI/Readme_sl_SI.txt`, `sl_SI/README_hyph_sl_SI.txt`, `sl_SI/hyph-sl.tex` |
| `uk_UA` | `GPL-2.0-or-later` | `uk_UA/COPYRIGHT`, `uk_UA/COPYING_GPLv2` |

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

The `da_DK` spelling payload is an exact LibreOffice blob with an explicit
GPL 2.0, LGPL 2.1, and MPL 1.1 choice. Its hyphenation payload is reproduced
from the Fedora `hyphen-da` source and is covered by the versioned LGPL 2.1-or-
later adaptation grant plus the original LPPL 1.3c patterns.

The `kk_KZ` payloads are exact blobs from the locked dictionaries commit. The
Debian copyright record from the independently versioned `hunspell-kk` source
package establishes that GPL 2 or later, LGPL 2.1 or later, and MPL 1.1 are
alternative license choices. Removing the UTF-8 BOM and normalizing CRLF to LF
reproduces the locked payloads from that source commit byte for byte.

The `lt_LT` payloads are exact blobs from the locked dictionaries commit. They
are reproducibly derived from the LibreOffice import of `ispell-lt` release
`rel-1.3`: decode ISO-8859-13, change the affix `SET` declaration to UTF-8,
and encode with a UTF-8 BOM while preserving LF line endings. The upstream
`COPYING` file supplies the complete BSD 3-Clause terms.

The `sl_SI` payloads are exact blobs from the locked dictionaries commit.
Re-encoding the LibreOffice source payloads from ISO-8859-2 to BOM-free UTF-8,
and updating only their charset declarations, reproduces the locked bytes. The
reviewed branch combines the explicitly selected LGPL 2.1 spelling and
adaptation terms with the original hyphenation patterns' LPPL 1.0 terms.

The `id_ID` payloads are exact blobs from the locked dictionaries commit.
Re-encoding the matching LibreOffice source payloads from ISO-8859-1 to
BOM-free UTF-8 and updating the affix and hyphenation charset declarations
reproduces the locked bytes. The extension description explicitly places the
spelling and hyphenation payloads in the dictionary package; the separate
`LICENSE-dict` and `LICENSE-thes` files distinguish its LGPL 3.0 dictionary
terms from the unrelated thesaurus terms. This snapshot consistently selects
the LGPL 3.0 branch also offered for the spelling files.

The `it_IT` payloads are exact blobs from both the locked dictionaries commit
and an immutable LibreOffice source commit. That source commit licenses the
complete Italian Writing Aids extension, including its hyphenation function,
under GPL version 3. The original hyphenation notice independently grants LGPL
version 2.1 or later; both grants are retained in the cumulative expression.

The `el_GR` spelling payloads and their versioned notice are exact locked Git
blobs. The Fedora 11 source RPM binds the matching original hyphenation payload
to `LGPLv2+`; selecting LGPL 2.1 or later is compatible with both sources. A
deterministic ISO-8859-7-to-UTF-8 conversion reproduces the locked hyphenation
bytes.

The `pt_PT` payloads match Debian `libreoffice-dictionaries 1:7.2.0-1`.
Its signed source record maps the spelling files to GPL 2, LGPL 2.1, or MPL 1.1
and maps the hyphenation file specifically to GPL 2. This snapshot selects GPL
2 for every payload and retains the complete license text.

The `uk_UA` thesaurus data is an exact blob from `arysin/spell-uk`; its index
is deterministically generated by the mirrored upstream script. The same
immutable commit grants the program under GPL or LGPL version 2 or later. This
snapshot selects GPL 2 or later for the thesaurus payloads; locked in-tree
notices cover spelling and hyphenation under the same branch.

The `ru_RU` snapshot mirrors the two locked `ru_RU_oo3` payloads. Removing
their UTF-8 BOM, decoding the remaining bytes as UTF-8, and encoding the
resulting characters as Windows-1251 reproduces the KOI8-R entries in Apache
OpenOffice Russian Dictionary 0.6 byte for byte. The custom Lebedev license
permits modification but requires modified versions to be marked; the
historical encoding transformation and this unmodified JetOnlyOffice mirror
are identified in `ru_RU/MODIFICATION_NOTICE.txt`.

`ASC.ttf` is intentionally absent because no redistribution grant was found.
The `liberation` component is intentionally absent because its 1.07.4 custom
terms, especially Sans Narrow, still require explicit legal review.

Git LFS is forbidden in this repository. Consumers must select an immutable
tag and verify every payload path, Git blob ID, and SHA-256 before use.

See [PROVENANCE.md](PROVENANCE.md) for upstream versions and evidence digests.
