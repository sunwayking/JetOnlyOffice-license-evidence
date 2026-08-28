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
| `liberation` | `LicenseRef-Liberation` | `liberation/License.txt`, `liberation/LicenseRef-Liberation.toml` |
| `az_Latn_AZ` | `GPL-2.0-or-later` | `az_Latn_AZ/COPYRIGHT`, `az_Latn_AZ/COPYING_GPL_v2.txt`, `az_Latn_AZ/hunspell-az.spec` |
| `da_DK` | `(GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1) AND LGPL-2.1-or-later AND LPPL-1.3c` | `da_DK/da_DK_Danish.txt`, `da_DK/README_hyph_da_DK.txt`, `da_DK/hyphen-da.spec`, `da_DK/dkhyph.tex` |
| `en_AU` | `LGPL-3.0-only AND LicenseRef-SCOWL-2020-12-07` | `en_AU/README_en_AU.txt`, `en_AU/extension-makefile.mk`, `en_AU/COPYING_LGPL_v3.txt` |
| `en_GB` | `LGPL-3.0-only AND LicenseRef-Hyphen-en-GB-2011-10-07` | `en_GB/lgpl-3.0.txt`, `en_GB/README_hyph_en_GB.txt` |
| `de_AT` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_AT/README_de_DE_frami.txt`, `de_AT/README_hyph_de.txt`, `de_AT/dehyphn.tex` |
| `de_CH` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_CH/README_de_DE_frami.txt`, `de_CH/README_hyph_de.txt`, `de_CH/dehyphn.tex` |
| `de_DE` | `(GPL-2.0-only OR GPL-3.0-only) AND LGPL-2.0-or-later AND LPPL-1.0` | `de_DE/README_de_DE_frami.txt`, `de_DE/README_hyph_de.txt`, `de_DE/dehyphn.tex` |
| `el_GR` | `LGPL-2.1-or-later` | `el_GR/el_GR_Greek.txt`, `el_GR/hyphen-el.spec`, `el_GR/COPYING_LGPL_v2.1.txt` |
| `hr_HR` | `LGPL-3.0-only AND LPPL-1.0` | `hr_HR/registration-license_hr.txt`, `hr_HR/README_hyph_hr_HR.txt`, `hr_HR/hyph-hr.tex`, `hr_HR/LPPL-1.0.txt` |
| `id_ID` | `LGPL-3.0-only` | `id_ID/LICENSE-dict`, `id_ID/README_id_ID.txt`, `id_ID/description.xml` |
| `it_IT` | `GPL-3.0-only AND LGPL-2.1-or-later` | `it_IT/README_it_IT.txt`, `it_IT/README_hyph_it_IT.txt`, `it_IT/hyph-it.README` |
| `kk_KZ` | `GPL-2.0-or-later OR LGPL-2.1-or-later OR MPL-1.1` | `kk_KZ/COPYRIGHT` |
| `lt_LT` | `BSD-3-Clause` | `lt_LT/COPYING` |
| `mn_MN` | `LPPL-1.3c` | `mn_MN/LICENSE` |
| `pt_BR` | `LGPL-2.1-only AND LGPL-3.0-only` | `pt_BR/README_pt_BR.TXT`, `pt_BR/README_hyph_pt_BR.txt`, `pt_BR/hyphen-pt.spec` |
| `pt_PT` | `GPL-2.0-only` | `pt_PT/COPYRIGHT`, `pt_PT/COPYING_GPLv2` |
| `ru_RU` | `LicenseRef-Russian-Dictionaries-Lebedev-1997-2008` | `ru_RU/README_ru_RU.libreoffice.txt`, `ru_RU/COPYRIGHT`, `ru_RU/LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt` |
| `sl_SI` | `LGPL-2.1-only AND LPPL-1.0` | `sl_SI/Readme_sl_SI.txt`, `sl_SI/README_hyph_sl_SI.txt`, `sl_SI/hyph-sl.tex` |
| `uk_UA` | `GPL-2.0-or-later` | `uk_UA/COPYRIGHT`, `uk_UA/COPYING_GPLv2` |
| `uz_Cyrl_UZ` | `MIT` | `uz_Cyrl_UZ/LICENSE` |
| `uz_Latn_UZ` | `MIT` | `uz_Latn_UZ/LICENSE` |

The `LICENSE.GPL-2.0` copies supplement the Debian copyright mappings with the
complete GPL version 2 text. Supplementary `COPYRIGHT` files retain the
package-to-file provenance for the KACST components.

The `az_Latn_AZ` payloads are reproduced from an immutable Hunspell snapshot
that carries the Azerbaijani Aspell package copyright notice. Adding a UTF-8
BOM while preserving LF line endings reproduces both locked Git blobs byte for
byte. The official Aspell 0.02-0 archive, a digest-bound Fedora spec, and a
Fedora 24 binary RPM retain the original word-list provenance, the GPL version
2 or later grant, and the complete GPL version 2 text.

The `en_GB` spelling and hyphenation payloads are exact Git blobs from the
locked dictionaries commit. `README_en_GB.txt` retains the spelling-dictionary
provenance, while the two evidence locators provide the complete LGPL 3.0 and
versioned hyphenation terms used by the reviewed component mapping.

The `en_AU` spelling payloads and SCOWL 2020.12.07 notice are exact blobs from
the locked dictionaries commit. Its hyphenation payload is the historical
OpenOffice `dict-en` source blob with only the first-line encoding declaration
changed from `ISO8859-1` to `UTF-8`. The extension build manifest packages that
exact source blob, keeps the default OpenOffice license, and declares LGPL
version 3 only. The reviewed expression retains the distinct spelling and
hyphenation grants.

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

The `mn_MN` spelling payloads are exact blobs from the author's annotated
`2022.07.28` tag. That tag carries the complete LPPL 1.3c text at repository
root, and both payloads directly grant LPPL version 1.3 or later in their file
headers. The locked hyphenation payload has the same direct grant. The
localized README is retained for provenance but is not used as the license
locator; the reviewed mapping does not infer license terms from its prose.

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

The `hr_HR` hyphenation payload is reproduced from the versioned Croatian
LibreOffice extension. Decoding its ISO-8859-2 source, replacing only the
leading charset declaration, and encoding as BOM-free UTF-8 reproduces the
locked payload byte for byte. The byte-identical README identifies the
OpenOffice.org adaptation, while the extension registration license explicitly
places the product under GNU LGPL version 3. The original Croatian patterns
separately grant LPPL version 1 or later; this snapshot selects LPPL 1.0 and
retains both cumulative grants.

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

The `pt_BR` spelling payloads are exact blobs from an immutable LibreOffice
commit and retain the locked LGPL 2.1 notice. The hyphenation payload is
reproduced from Fedora's digest-bound `hyphptBR-213.zip`: decode ISO-8859-1,
normalize line endings, update the encoding declaration, and apply the single
upstream README cleanup. Fedora's `%files BR` package mapping binds those two
source members to the versioned LGPL 3.0 branch. The reviewed expression keeps
the spelling and hyphenation grants separate and cumulative.

The `uk_UA` thesaurus data is an exact blob from `arysin/spell-uk`; its index
is deterministically generated by the mirrored upstream script. The same
immutable commit grants the program under GPL or LGPL version 2 or later. This
snapshot selects GPL 2 or later for the thesaurus payloads; locked in-tree
notices cover spelling and hyphenation under the same branch.

The `uz_Cyrl_UZ` and `uz_Latn_UZ` payloads are exact blobs from the locked
dictionaries commit, imported by ONLYOFFICE on 2022-01-20 from
`u2b3k/uz-hunspell`. The same bytes are present unchanged in the author's
commit that adds the MIT `LICENSE` (copyright 2021 Alisher Jalolov, the sole
author named in both payload headers), so the grant covers exactly the locked
bytes. The author's later GPL v3 switch accompanies the replacement payloads,
not the locked ones; the reviewed expression is `MIT`.

The `ru_RU` snapshot mirrors all five locked payloads. The three current
payloads are exact blobs from an immutable LibreOffice commit whose README
retains the custom Lebedev terms; Debian's signed source record independently
maps the complete `ru_RU` directory to those terms. The two `ru_RU_oo3`
payloads reproducibly round-trip to Apache OpenOffice Russian Dictionary 0.6.
Required upstream and historical modification markings are consolidated in
`ru_RU/MODIFICATION_NOTICE.txt`.

The `liberation` component mirrors all sixteen locked 1.07.4 font payloads and
the complete upstream custom terms. Fedora Legal's immutable license-data
record classifies `LicenseRef-Liberation` as `allowed-fonts`; its reuse terms,
the versioned source archive, and the signed Debian source record are retained
as offline attestations. The expression intentionally preserves the complete
custom terms instead of rewriting them as a standard SPDX font exception.

`ASC.ttf` is intentionally absent because no redistribution grant was found.
Its name table identifies it as ASCW3 by Ascensio System SIA with an
all-rights-reserved copyright line.

Git LFS is forbidden in this repository. Consumers must select an immutable
tag and verify every payload path, Git blob ID, and SHA-256 before use.

See [PROVENANCE.md](PROVENANCE.md) for upstream versions and evidence digests.
