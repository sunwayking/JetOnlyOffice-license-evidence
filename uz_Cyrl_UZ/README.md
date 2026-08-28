# uz_Cyrl_UZ Hunspell dictionary evidence

The two payload files are byte-identical copies of the locked
ONLYOFFICE/dictionaries blobs (commit
d3223bbb777883db66ac3cd249f71c6ebdc992c7). They were imported by
ONLYOFFICE in commit 214fddb29680161b244fa8c1ea0ce1138b05a005
(2022-01-20, PR #43), which names u2b3k/uz-hunspell as the source.

The same payload bytes were uploaded by their sole author, Alisher Jalolov
(u2b3k), to u2b3k/uz-hunspell in commit
9321fd6a874022dc05c49606343854b51b13d5ef (2020-04-03, "Add files via
upload"), then carried unchanged into commit
6de653236bf03144ff9803b15a92bd6bde45670b (2021-10-23, "Create
LICENSE"), which adds LICENSE:

    MIT License
    Copyright (c) 2021 Alisher Jalolov

At the time of the ONLYOFFICE import (2022-01-20), the upstream
repository therefore carried the author's MIT grant over exactly these
payload bytes; the author replaced the payloads with a new version only on
2022-08-05 (bdd8a996db9f323b8f78bc1e4154086ac642f79a) and later switched
the project license to GPL v3 (2025-06-04,
d5b47918cb585617e9e3ab9ea1ef4941b062cc32), which accompanies the
replacement payloads, not the locked ones.

Reviewed SPDX expression: MIT. Evidence locator: uz_Cyrl_UZ/LICENSE
(mirrored MIT text, upstream Git blob
3a1f0808576996ab51971ed0a7cbf1f7c38ef6e1).
