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

## de_AT, de_CH, and de_DE

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent payload and notice source: `LibreOffice/dictionaries` commit
  `13f714a0e7bbef5f274405240c95f38f417e9324`.
- Original revision 31 hyphenation source: `hyphenation/tex-hyphen` commit
  `d69cf46eea4d92f944c764386efdd1b7db7ea331`.
- LPPL text source: `spdx/license-list-data` commit
  `c4a7237ec8f4654e867546f9f409749300f1bf4c`.
- Reviewed SPDX expression: `(GPL-2.0-only OR GPL-3.0-only) AND
  LGPL-2.0-or-later AND LPPL-1.0`.

The LibreOffice payloads use ISO-8859-1. Decoding that charset, replacing the
`ISO8859-1` declaration with `UTF-8`, and encoding as BOM-free UTF-8 produces
the locked payloads byte for byte. No other payload transformation is applied.

| Mirrored payload | Locked blob | SHA-256 | LibreOffice source blob |
| --- | --- | --- | --- |
| `de_AT/de_AT.aff` | `31e818e543569c026700d3d63be8343cedf475eb` | `ff26b4ecc487673c232674a8f058cb21875856af83eefa8f784a4145b1a87b9e` | `de/de_AT_frami.aff` at `9be547c4587d5c9dedd606d3c220ead41f786575` |
| `de_AT/de_AT.dic` | `d3895ad095b71dfcb121dff625d3b7372a2a7f69` | `dfad9c278603d40027c9cea44ed684f00219ff92c6fb6622dfe78ee378a90cee` | `de/de_AT_frami.dic` at `af01bc7fb157197a70a687e02dbd854c760ba198` |
| `de_AT/hyph_de_AT.dic` | `0931a95a53224888306012158e7b064ec5a78d0e` | `5305d3282cd47eb80e1b0abfc468ea26ae477f71e59092848de74627a2ba16e3` | `de/hyph_de_AT.dic` at `72a97b15b047646df951a30ac81254393fcdfd4b` |
| `de_CH/de_CH.aff` | `843b8fe028bcef29e96d19adbd2edb1c28787690` | `dc312eb01c299b489aa384af2cc1f521af06be38c950ba7c5e75e549c6fbbc09` | `de/de_CH_frami.aff` at `1bccc156ea871ad7529906f2061f09747769672e` |
| `de_CH/de_CH.dic` | `06c3adf3959ec27851e50a57b5d5c88adda0bcf9` | `31c7e7696916bf7f0a163a3185df38887d6087883421241777f5704aaf542147` | `de/de_CH_frami.dic` at `ea103c61bf42b5239e9ba824d962c491a5181a00` |
| `de_CH/hyph_de_CH.dic` | `fb038205c7de24c9e8458c60edee17674610dfab` | `59d570ba7f5f6765ea44430308dda17182dffbdf992fa7d9a89ab7709e591f51` | `de/hyph_de_CH.dic` at `4f1b826088fc2d5c6908d3d9cf7fd5adb066951b` |
| `de_DE/de_DE.aff` | `cc91ff9a455735ceedf476d499a4d1a9ee7d5c51` | `c7a7d49f73394c8ffd189e9ebec065ad63f6a3feb15417dbf90b2dc68760227e` | `de/de_DE_frami.aff` at `12b9b584bd0806589bb499ae2967ae42b5cf87a6` |
| `de_DE/de_DE.dic` | `3c54ff093585e1c7aef4b78b40896c8a27e26a48` | `d053e46aab7d36784ed0911ddd8fe1df9836d9d78e3a9c2093145eb5c3c611dd` | `de/de_DE_frami.dic` at `7e08137118abcf3bb746a6c526a476e6a49f4a4e` |
| `de_DE/hyph_de_DE.dic` | `4efd80cb71e815fa7f043ed3a9aa7fc58f594eef` | `28f351c646894cac0eabd57a86edb718b815705e3fd233df417647415fc49304` | `de/hyph_de_DE.dic` at `100dde01304ae8f071830dcdf352b6642fa92442` |

Each component directory mirrors the same supporting evidence:

| Evidence | Git blob | SHA-256 |
| --- | --- | --- |
| `README_de_DE_frami.txt` | `43d6c6c45ea75016b8b912d87a29e99a90a38635` | `c141f4f79c428b7348b5012836f4ad3db4d124f288f15effc22696dc876512ae` |
| `README_hyph_de.txt` | `8921caef8669a6da5df523fa3491dde3624db5ea` | `be7b3c67a66ea7185a69a3ce3b1e712cd6bb904dce8ac0eecdefd2f1a948baf3` |
| `COPYING_GPLv2` | `a8cab0356b0b9656dd1a988d524772166016c4ec` | `e7431ac20e815b6797369e802f9e4bb1b0082485060d8b096235f035d741bd89` |
| `COPYING_GPLv3` | `94a9ed024d3859793618152ea559a168bbcbb5e2` | `8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903` |
| `COPYING_LGPL_v2.0.txt` | `5bc8fb2c8f757e34a0d8f4644f589d57609e213f` | `b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c` |
| `COPYING_LGPL_v2.1.txt` | `4362b49151d7b34ef83b3067a8f9c9f877d72a0e` | `dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551` |
| `COPYING_OASIS.txt` | `47c1c2bb4384852191c28a47685f2b59e08dadd3` | `2d9d81e88ecd0e837122f4688ca7a6a5bd7bb41bff6e21ff5d4663eb43372db3` |
| `dehyphn.tex` | `804135789d0c3ec0cc89311b713b5100e526d6ad` | `0bf281fd020e40ec2ae81a6bf819f2451e8cfd027e04f99c101c3da5c97b9300` |
| `LPPL-1.0.txt` | `1472b174eee6bbf052ec9dbd4cdeef66368bc35a` | `7790736e17a15a9e30f8adaacb3951c7b3a9e102c2cf48b9ac9a51bdf26297a0` |

`COPYING_OASIS.txt` is retained only for complete upstream provenance. Its
conditional ODF-primary alternative is not part of the selected SPDX branch.

## kk_KZ

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent package source: `deepin-community/hunspell-kk` commit
  `16e05bfb723b0290a3f0d67d4909fc5f948f58e9`.
- Debian copyright blob: `059048c620f63f8b4cdb5309f6f10fd09424b8af`,
  SHA-256 `005abba37d3fd43f3703ecc3da1820a5f401832d32d476cfdf41de4a7ec2c027`.
- Reviewed SPDX expression:
  `GPL-2.0-or-later OR LGPL-2.1-or-later OR MPL-1.1`.

| Mirrored payload | Locked blob | SHA-256 | Independent source blob |
| --- | --- | --- | --- |
| `kk_KZ/kk_KZ.aff` | `190f9e89fa8256751abfb497fa7af70f89bfa9b5` | `36a468797842522027b6e12ae8aacd26ae53288322c43a84af8b205b8a06eb6b` | `a93feb7e56283fb06a404ec69940e074c03ab4f0` |
| `kk_KZ/kk_KZ.dic` | `4118be1ac4d0551e47f285e7da414ecaaac4f4c0` | `3e51ac567453c603312de1ec85f0637a723bed6e597ea1f6c8248e33eddd242c` | `3e0b7d56623787fed2637c73dfa55eefdcb44001` |

The independent source blobs use a UTF-8 BOM and CRLF line endings. Removing
the BOM and normalizing CRLF to LF yields the locked payloads byte for byte;
the evidence repository retains the locked ONLYOFFICE bytes without applying
checkout-time conversion.

## lt_LT

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Original source release: `ispell-lt/ispell-lt` tag `rel-1.3`, commit
  `28d2ca550b1a35ae17a780d9e5da95d3577187ed`.
- LibreOffice import source: `LibreOffice/dictionaries` commit
  `143afd75257fd4c4b44f09ee402ec8caa09011ba`.
- Reviewed SPDX expression: `BSD-3-Clause`.
- License evidence: `lt_LT/COPYING`, Git blob
  `5bf5024e7a3df8f84f204b6d85bfc2122f8db7d5`, SHA-256
  `97c7647bb681f70233ba9698daf7d7837764796cb98ca88abfed38ca03af47a5`.

| Mirrored payload | Locked blob | SHA-256 | LibreOffice source blob |
| --- | --- | --- | --- |
| `lt_LT/lt_LT.aff` | `867647faa37b1f6b24bd181d67c18ac6a098c6e1` | `97805d6f3c3caa1e7a2e2d45ceee0e1d350bee620f67b50f3fa082c9ce833436` | `lt_LT/lt.aff` at `ca3302380ae7f0cc0b9a9818d390c754a34e1d92`, SHA-256 `01ec7b4edc369f696c39918aa9b33e5e738005983f3a76ce4817af2ed361b060` |
| `lt_LT/lt_LT.dic` | `d277159a4819cbb2beefb3f5cc54f0f6eaae655e` | `8be8c6784700fa148fddd0339b3149b5abaae2a49e46c5179d0a6f849d418463` | `lt_LT/lt.dic` at `17e81f671679bc6b48ade05a33d2af308efbaf4e`, SHA-256 `1714f38f7b80f35799ab6abb8ff4a40fa1de805e1adc1d4d30c0b5a179887469` |

The LibreOffice source payloads use ISO-8859-13 and LF line endings. Decode
that charset and encode as UTF-8 with a BOM; for the affix payload, also change
the first line from `SET ISO8859-13` to `SET UTF-8`. These transformations
produce the locked payloads byte for byte, with no other normalization.

## sl_SI

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent payload and notice source: `LibreOffice/dictionaries` commit
  `411b531d4c2c83e66008e0d2782baa455e2731e3`.
- Original hyphenation source: `hyphenation/tex-hyphen` commit
  `bb15dbad332f4cbcea9f5284ef469629dcdd79ea`.
- Reviewed SPDX expression: `LGPL-2.1-only AND LPPL-1.0`.

| Mirrored payload | Locked blob | SHA-256 | LibreOffice source blob |
| --- | --- | --- | --- |
| `sl_SI/sl_SI.aff` | `add26403e7515cdffe86f64fbf0dec15fa6859c9` | `f6404c6004cd4a218d687b223b9f584c19802e494a583efe7bf6eccf26b55d84` | `dictionaries/sl_SI/sl_SI.aff` at `9f2397ee45c3343d2da8a973490cf2bbb6848a1a`, SHA-256 `3cb3e84824959928c8004e07b37b9d2bcb84176095f514e134f006dbb14a0beb` |
| `sl_SI/sl_SI.dic` | `af84c2cfafdc0c6239c90b6d4df9730e04d1c96c` | `5bac615dbd301ddbefbdaafdae242a89e46605916d77958df22778e770a95b9e` | `dictionaries/sl_SI/sl_SI.dic` at `6a3ce6bd62cd017a731c47492fb5cd81fb136e38`, SHA-256 `e157aabf1a20d21f639d04cf79f019ff1a3eb623c6780a726ffa4293787fa0ab` |
| `sl_SI/hyph_sl_SI.dic` | `49f6ccca86d9af2a6e65e40794a37396609366e6` | `365c2dbfcf446e5dca7c75488389f6811aef498ad4e7125844b0182627ab7e33` | `dictionaries/sl_SI/hyph_sl_SI.dic` at `8a506283f3fd8698d22def5b48dc0767a25418a9`, SHA-256 `3d9026755aa0936e9331595a08bb65c295ccac84acefe58cb6c9fe2ff11ceef8` |

The two locked README files are byte-identical to the LibreOffice notices.
`Readme_sl_SI.txt` selects LGPL 2.1 for the spelling payloads. The hyphenation
README applies the same LGPL 2.1 choice to the OpenOffice adaptation, while
`hyph-sl.tex` blob `f353194b1090189a728cb582821ca6dab195e6e6`, SHA-256
`dd50791eb083ed7a163cd883bf7175fc914cc01e41f3b5b7b94d2106d5beb1da`,
licenses the original patterns under LPPL version 1 or later. This snapshot
selects LPPL 1.0 and retains the complete `LPPL-1.0.txt` and
`COPYING_LGPL_v2.1.txt` texts.

The LibreOffice payloads use ISO-8859-2 and LF line endings. Decode that
charset and encode as BOM-free UTF-8; change `SET ISO8859-2` to `SET UTF-8` in
the affix file and the leading `ISO8859-2` to `UTF-8` in the hyphenation file.
These transformations produce the locked payloads byte for byte.

## id_ID

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent spelling source: `LibreOffice/dictionaries` commit
  `75f5dff8c972fff4a32e4ea8434722c277f02a3f`.
- Hyphenation payload introduction: `LibreOffice/dictionaries` commit
  `2180c26eabeda8ed3315bc04acd0dd4fc3246736`.
- Package scope evidence: `LibreOffice/dictionaries` commit
  `43f9b34b3bf68f252a68827adf59a7f9a4b4d935`.
- Reviewed SPDX expression: `LGPL-3.0-only`.
- License evidence: `id_ID/LICENSE-dict`, Git blob
  `341c30bda4457610db4829294e5d7e526d4c835b`, SHA-256
  `97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b`.
- Package scope evidence: `id_ID/description.xml`, Git blob
  `2b364549516e5e15e37775fbc72d033cef67f44c`, SHA-256
  `2b11e5a84b0f48fa79698149bb22827ca72eac4902dfa3390c444c735f10b16f`.

| Mirrored payload | Locked blob | SHA-256 | LibreOffice source blob |
| --- | --- | --- | --- |
| `id_ID/id_ID.aff` | `2d3fdf904943531919762db439e144427a045ab4` | `1f7d58cebb3aa37fde368f68d9000c8d1269c7bbcb9cccfc8e90f8c9e8828727` | `id/id_ID.aff` at `6b1b68cdc83246434c2c87358dbd56470c26b17a` |
| `id_ID/id_ID.dic` | `f806c6a258062ae6a066a97c4174a32c36d4e993` | `968accd36169e7e28d09b267974196db0a2c28049d7237aa55dcf3f2cc657123` | `id/id_ID.dic` at `b7dbe8e70d11262536d56d710a9072b6e186084a` |
| `id_ID/hyph_id_ID.dic` | `9ca9ab11e082b32f2d6336da019be582ea4aa1fd` | `61f2b88bda4cb0e6848f27ee0850c666c874b78229e48f49ac44ac0a17788cb8` | `id/hyph_id_ID.dic` at `097799942d36cc79dcc377f7b247c6aa191da4ab` |

The LibreOffice payloads declare ISO-8859-1. Decode that charset and encode as
BOM-free UTF-8; change `SET ISO8859-1` to `SET UTF-8` in the affix file and the
leading `ISO8859-1` to `UTF-8` in the hyphenation file. This exact historical
conversion also expands the spelling file's existing UTF-8 smart-quote bytes
as ISO-8859-1 characters. The resulting bytes reproduce all three locked
payloads without any further normalization.

`README_id_ID.txt` offers MPL 2.0 or LGPL 3.0 for the spelling payloads. The
package-level `description.xml` explicitly identifies spelling, hyphenation,
and thesaurus, while the source tree carries distinct `LICENSE-dict` and
`LICENSE-thes` files. The reviewed component selects LGPL 3.0 consistently for
the spelling and hyphenation payloads; no thesaurus payload is mirrored here.
