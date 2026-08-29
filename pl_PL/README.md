# pl_PL Polish dictionary evidence

The three payload files are byte-identical copies of the locked
ONLYOFFICE/dictionaries blobs (commit
d3223bbb777883db66ac3cd249f71c6ebdc992c7). They belong to the
pl.openoffice.org 2008.12.06 standalone UTF-8 release of the Polish
dictionary family maintained by Marek Futrega; the locked
pl_PL_Polish.txt is the verbatim 2008.12.06 Polish README from that
package.

## License grants

Spelling payloads (pl_PL.aff, pl_PL.dic): the locked notice grants them
under GPL, LGPL, MPL, and Creative Commons ShareAlike with the URL
http://creativecommons.org/licenses/sa/1.0, which pins the CC branch to
CC-SA-1.0.

Version pinning for GPL/LGPL/MPL comes from three agreeing sources:

1. Debian ipolish 20090225-1 debian/copyright (era-matched, snapshot
   2009-02-27): GNU GPL version 2, CC ShareAlike version 1.0, MPL
   version 1.1 (LGPL unversioned). Mirrored in
   pl_PL/debian-copyright-ipolish-20090225.txt, which also carries the
   complete CC-SA-1.0 and MPL-1.1 texts.
2. The maintainer's own page https://sjp.pl/sl/en/ (fetched
   2026-08-28, mirrored as pl_PL/sjp-license-page.html): GPL 2,
   LGPL 2.1, MPL 1.1 (plus later-added CC BY 4.0 and Apache 2.0,
   which postdate the 2008 payloads).
3. LibreOffice/dictionaries commit c78220a2 README_pl_PL.txt
   (2026-05-11 dictionary release): GPL 2, LGPL 2.1, MPL 1.1.

Hyphenation payload (hyph_pl_PL.dic): the locked notice grants the
OpenOffice.org adaptation under LGPL 2.1 with the original plhyph.tex
3.0a patterns in the public domain (the plhyph.tex file header confirms
the public-domain status under the TeX author's conditions).

## Reviewed SPDX expression

The lock records one component-level expression. The hyphenation grant
LGPL-2.1-only is already contained in the spelling choice, so the
union expression is:

    GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1 OR CC-SA-1.0

Evidence locators: pl_PL/pl_PL_Polish.txt (the 2008.12.06 notice,
payload-self grant), pl_PL/COPYING_GPLv2, pl_PL/COPYING_LGPL_v2.1.txt,
pl_PL/MPL-1.1.txt, pl_PL/CC-SA-1.0.txt (complete texts),
pl_PL/debian-copyright-ipolish-20090225.txt and
pl_PL/sjp-license-page.html (version pinning).
