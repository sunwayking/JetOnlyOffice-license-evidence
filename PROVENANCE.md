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

## az_Latn_AZ

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Original word-list package: GNU Aspell Azerbaijani dictionary `0.02-0`,
  published 2004-08-27 at
  <https://ftp.gnu.org/gnu/aspell/dict/az/aspell6-az-0.02-0.tar.bz2>.
- Aspell archive SHA-256:
  `063176ec459d61acd59450ae49b5076e42abb1dcd54c1f934bae5fa6658044c3`.
- Fedora packaging snapshot: `gooselinux/hunspell-az` commit
  `3f3a8ea1188d9557b30cea74c0a888b2183f1aa6`; spec Git blob
  `268708f8f037c3229eba51603649e58f0df52685`, SHA-256
  `2f4ae6cef4f3edcd2e2946a1cd0d1fe77567564392cb1244326319d8e3561ff3`.
- Fedora 24 binary RPM:
  <https://kojipkgs.fedoraproject.org/packages/hunspell-az/0.20040827/14.fc24/noarch/hunspell-az-0.20040827-14.fc24.noarch.rpm>,
  SHA-256
  `e78edfd329d797f77b684b73e47153a884be2046d9e299e8df573289fc9cd378`.
- Exact Hunspell source snapshot: `MatiasConTilde/TheFuckTelegram` commit
  `e95bc1a198b97b343b5503612ffa112ff9b00a15`, directory
  `dicts/az_AZ-latin`.
- Reviewed SPDX expression: `GPL-2.0-or-later`.

| Mirrored payload | Locked blob | SHA-256 | Source blob | Source SHA-256 |
| --- | --- | --- | --- | --- |
| `az_Latn_AZ/az_Latn_AZ.aff` | `a4cf374625ee63c72d46acc0dd907757a3b28fda` | `4d09c657a59cf5266c897ddb23033cb7eccc36b97036ec76627af97a4b8df25a` | `c330d3960e3c4276d4242b262b981c524024969b` | `ae28ceef851a97abeb65165a4aab8195719f2eda7aebfe35c51d448cca5da814` |
| `az_Latn_AZ/az_Latn_AZ.dic` | `ea6b0c21890af52b8ec9cf395f814cf1fe350709` | `7e1ced8fadfc2368d1af81f09f0a58d70d0e7beb28c86d667f98e9cb238787d8` | `2f3474cc90b2937013f85e18986d9dd93b0462fb` | `dd4f966711b93a27d26d26cee91ded564d5d5b67aab86e8dba689cfdb2f19f19` |

Both source payloads are BOM-free UTF-8 with LF line endings. Prepend the
three UTF-8 BOM bytes and insert CR before every LF; the results are the locked
payloads byte for byte. The source dictionary is also byte-identical to the
Fedora 24 RPM member `/usr/share/myspell/az_AZ.dic`.

`COPYRIGHT` is Git blob `f6e2bbc6498024f151628f6af2985381181735fe`,
SHA-256 `f8802a13346e5c3e4563b55b9494dd7146cc916367ac78e9757735b23ba3996f`.
It is byte-identical to the official Aspell archive member, identifies the
three word-list authors, and grants redistribution or modification under GPL
version 2 or later. `COPYING_GPL_v2.txt` retains the complete version 2 text,
SHA-256 `204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994`.
The Fedora spec binds that same archive digest, declares `GPL+`, runs
`preunzip` and `wordlist2hunspell`, and packages the generated `.aff` and
`.dic` together with the copyright and license files. The RPM was published
before the locked files entered the ONLYOFFICE repository.
`az_Latn_AZ/verify-transform.ps1` verifies all evidence digests, source and
locked Git blob IDs, required license text, and the deterministic byte
conversion offline.

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

## en_AU

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent hyphenation and package source: `LibreOffice/dictionaries`
  historical commit `5703447784205e94278ef3d724ba1f89fce1dae1`.
- Original introduction commit: `4d79a4c76d14fed8ceb329573caaa224764fea93`,
  whose message identifies the imported English dictionary as LGPL.
- Reviewed SPDX expression:
  `LGPL-3.0-only AND LicenseRef-SCOWL-2020-12-07`.

| Mirrored payload | Locked blob | SHA-256 | Independent source |
| --- | --- | --- | --- |
| `en_AU/en_AU.aff` | `290acfe87caf0f7ef44cf04dba4cd3b3cf2dbc58` | `e746c882dd6f303c2c46e7452804b9201115a6942cfeb15f18f8edf774d2e24e` | SCOWL 2020.12.07 notice |
| `en_AU/en_AU.dic` | `c7e8ccb71535d1c854ee0ba71cf27cfc93ac48ba` | `aa07c46571f306b79fc1bc534357ed357af15687381b26f891ba66e8a2caed89` | SCOWL 2020.12.07 notice |
| `en_AU/hyph_en_AU.dic` | `3df13df6503a037d262187772abfd7ce37d4a607` | `2d2598c7660a44d2e05fae3d1a443f9a71ac5450de3b9a14a9db0f457006ac59` | blob `c2c5f8e2f7afa8259e0aeded6a859d8026fde1c0` |

`README_en_AU.txt` is the locked Git blob
`8e870199249d37ea240fd723f5723858ee8d1ea3`, SHA-256
`f0897dcfdf058bcfc93fbc8e7e1b5da4c27ae9e175ee3a9242e887f02eb84a8b`.
It identifies SCOWL version 2020.12.07 and retains the complete permission
notices for the spelling payloads.

The independent `dict-en` extension build manifest is Git blob
`cb6aecebba79afef12fa264ae4ba650bd7df3417`, SHA-256
`0d34cc6efaebbfb8260a33ea27309df5b470da69af9a7b1c7fdd91ee148ce609`.
It lists the exact `hyph_en_GB.dic` source blob in `COMPONENT_FILES`, leaves the
default OpenOffice license enabled, and declares GNU LGPL version 3 only. The
locked `description.xml` and `package-dictionaries.xcu` identify the English
spelling and hyphenation extension and register that payload as `DICT_HYPH`.
`COPYING_LGPL_v3.txt` retains the complete LGPL version 3 text, SHA-256
`e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118`.

The source blob starts with `ISO8859-1` and has LF line endings. Replace only
that first-line declaration with `UTF-8`; the resulting bytes reproduce the
locked `hyph_en_AU.dic` exactly. `en_AU/verify-transform.ps1` verifies every
digest and Git blob, the package-to-payload and versioned-license statements,
and the deterministic conversion offline.

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

## da_DK

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent payload and notice source: `LibreOffice/dictionaries` commit
  `13f714a0e7bbef5f274405240c95f38f417e9324`.
- Versioned hyphenation package: Fedora `hyphen-da` commit
  `28f9812848f20ed71481f228a36308f30e0cf329`; spec blob
  `9e30528c80291a3a3baeaee34bea4a38cf86d4ca`, SHA-256
  `4340a04bbb9133797662ab8e3436da94604388de372105eeb0417d493f80af81`.
- Original pattern source: `hyphenation/tex-hyphen` commit
  `d69cf46eea4d92f944c764386efdd1b7db7ea331`, path `old/hyphen/dkhyph.tex`,
  blob `b5c9b4bde8d5ebb51275d6fa17b8c4d2bd677c2b`, SHA-256
  `be9678c13462d2a277602c48e0a422c0bf3b79e89f601fb20fc2deb1dfbf9363`.
- Reviewed SPDX expression: `(GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1) AND
  LGPL-2.1-or-later AND LPPL-1.3c`.

| Mirrored payload | Locked blob | SHA-256 | Independent payload blob |
| --- | --- | --- | --- |
| `da_DK/da_DK.aff` | `93fd7893ea6f3740c8a24b5cb6c0c2d6a0eb41a0` | `e8da338675a6ddc85bdcff62e7cbdbb49fe27ce8d89c1f92950f6f9d448996ed` | LibreOffice `da_DK/da_DK.aff` at the same blob |
| `da_DK/da_DK.dic` | `61de83b2198ec11e4934d8eb8be298014c62db0b` | `dc7fd12bb56ef7a25a33ea7091e0f91617d74e7aee3ae6604fce52cf727f7370` | LibreOffice `da_DK/da_DK.dic` at the same blob |
| `da_DK/hyph_da_DK.dic` | `58689f169456edd8ad41650b8478c3f602f5cad1` | `98305a04d75e20d4f5482f1ae62df5111ab42296c1030284f6dc7f18990e5d80` | LibreOffice `da_DK/hyph_da_DK.dic` at `77d0666f54cd7ebcfdd259e561a6530a1669ac88` |

The spelling README blob is `69fbc0d0f55c07ee24c4db4b88bad80375666bd9`,
SHA-256 `c65431a4aa94ed2200139e7f4e8e74e4e5e468366e5fbc7d2af2a32a671db647`.
The locked hyphenation README blob is `591938cb1fc1f12605ce70a88b6971edca293f6c`,
SHA-256 `600759b9f68b57a8432b9647bb132bb00a91953cf52b35c5daf65b7956b06501`.
The Fedora source payload blob is `77d0666f54cd7ebcfdd259e561a6530a1669ac88`,
SHA-256 `44d0dd1d85bcdb1e63003c97cd08924f10a8a8127380b1b07ac2e75a950c216b`.
Decoding it as ISO-8859-1, changing the leading encoding declaration to UTF-8,
and encoding without a BOM reproduces the locked hyphenation payload.
`dkhyph.tex` explicitly grants LPPL version 1.3 or later; this snapshot selects
the SPDX `LPPL-1.3c` branch and retains the canonical `LPPL-1.3c.txt` text.

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

## hr_HR

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Versioned extension: Croatian spelling dictionary, hyphenation rules and
  thesaurus `2023.09.07`, identifier
  `org.openoffice.hr.hunspell.dictionaries`.
- Extension page: <https://extensions.libreoffice.org/en/extensions/show/70053>.
- Fixed download URL:
  <https://extensions.libreoffice.org/assets/downloads/5926/1711999223/HR-dict.oxt>.
- OXT SHA-256:
  `93a2fbddbad44cefc3ab2684a95320a9b83dfa1c5458e6c33a60809bb9e4e10d`.
- Original patterns and versioned LPPL grant: `hyphenation/tex-hyphen` commit
  `bb5190596971b7f40766c0cf55d837b49df0b954`, path
  `hyph-utf8/tex/generic/hyph-utf8/patterns/tex/hyph-hr.tex`, Git blob
  `e269419d961ae63dd6b2546b115dfd8dd280be1d`, SHA-256
  `53fd09c47832a7c35df05090cd3c87d88212d2abc5e2a475f860986392c3ba24`.
- Reviewed SPDX expression: `LGPL-3.0-only AND LPPL-1.0`.

| Mirrored payload | Locked blob | SHA-256 | OXT source SHA-256 |
| --- | --- | --- | --- |
| `hr_HR/hyph_hr_HR.dic` | `8064cb087e5a7c69ae6e8e8f178efb6e32e6b827` | `88667f0810b4f25b72a3fc7f5db7a046981114fa6e0252e099b8286deb4614d6` | `77613ff6e907d2e9ffd93d45bfb16873aa9182e2215df276dbf850d1b0e28f65` |

The OXT member `hyph_hr_HR.dic` is encoded as ISO-8859-2 and starts with
`ISO8859-2`. Decode it strictly as ISO-8859-2, replace only that first-line
declaration with `UTF-8`, and encode as BOM-free UTF-8 while preserving LF
line endings. The result is the locked payload byte for byte.

`README_hyph_hr_HR.txt` is byte-identical between the locked commit and the
OXT: Git blob `278ce6dbbb17de5384a99a245ec19bcbf6122fa0`, SHA-256
`2ba15b47f64eba01489d2962a8c04c6e457a33bba418d6384bda30dfe9e23b65`.
It states that the OpenOffice.org adaptation is licensed under GNU LGPL. The
OXT's `registration/license_hr.txt`, mirrored as
`registration-license_hr.txt`, explicitly identifies GNU LGPL Version 3 and
contains the complete version 3 license text; its SHA-256 is
`c4071157f028fb936bf974872572806415dabdeabdf4fd357a87847148ce7101`.
The registration license retains additional third-party terms. The original
Croatian patterns in `hyph-hr.tex` grant LPPL version 1 or later, and this
snapshot selects the mirrored LPPL version 1.0 text, SHA-256
`7790736e17a15a9e30f8adaacb3951c7b3a9e102c2cf48b9ac9a51bdf26297a0`.
`hr_HR/verify-transform.ps1` verifies the archive members, evidence digests,
Git blob IDs, license scope text, and deterministic conversion offline.

## it_IT

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent payload and extension-license source: `LibreOffice/dictionaries`
  commit `43a746e2dcbdea7b89172024a14e6c6f1738c95c`.
- Original hyphenation-license source: `hyphenation/tex-hyphen` commit
  `d69cf46eea4d92f944c764386efdd1b7db7ea331`.
- Reviewed SPDX expression: `GPL-3.0-only AND LGPL-2.1-or-later`.

| Mirrored payload | Locked and LibreOffice blob | SHA-256 |
| --- | --- | --- |
| `it_IT/it_IT.aff` | `33baffde761b2e2ca2fe9b3bcf54d928b29f3cd4` | `951afaa19272f13555b8823e8bcf9ccf78f8fe1a07835bdfb912ab3e4d537c2b` |
| `it_IT/it_IT.dic` | `bb7549a2819ffd722ea7ff3509c56e7316ae84f0` | `bae1e3501dcd2a923669592493b3fde6c02aae7c7aab83bf5e5b49077e73dd64` |
| `it_IT/hyph_it_IT.dic` | `cc39080221c44fa7844a8bfca13a6f6470212346` | `8c25b6fb62c2fb97586c6f7c6fb48f29f49e90a5c33c09ac9112dba6942b50cd` |

All three payloads are byte-identical across the two immutable repositories;
no charset or line-ending transformation is applied. `README_it_IT.txt` blob
`60a8a1600c788661753bb3a810c5100b084dd9eb`, SHA-256
`34c3e93595cf3cf5f3afc9bc0d98eea12593750383f1e82ed1d3ca29f9681283`,
licenses the complete extension and explicitly identifies its hyphenation
function under GPL version 3. The locked `README_hyph_it_IT.txt` blob
`5965123bc91905894f013323683adbb635f10ff9`, SHA-256
`e6f356c3c49bc6016b6a635c20b468468eef6d011953a7051bbdfd56e17f0d3b`,
identifies the original Claudio Beccari patterns and conversion provenance.
The original `hyph-it.README` blob
`f6a45094c1338485e53b441d9dbe9e1e6ceb3e69`, SHA-256
`d9c56c0f7ffe2c94b28d0b50d88150b5f8d214feeec9c42611e0e26a9c5f8a16`,
grants LGPL version 2.1 or later. The complete LGPL 2.1 text is retained as
`COPYING_LGPL_v2.1.txt`, SHA-256
`dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551`.

## el_GR

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent hyphenation source: Fedora 11 archive source RPM
  `hyphen-el-0.20051018-2.fc11.src.rpm`, SHA-256
  `fd90823697986c07cef82cd2ae9a660b348a80eeed1d1e2aca805b28011e5824`.
- Source ZIP: MD5 `73c0d55de8ad750557b0703c5004279e`, SHA-256
  `8609bd1f835839b2b44ebd3587a2c4fc25327fb22f7de02a7528cae39d9d17d5`.
- Fedora license metadata: `el_GR/hyphen-el.spec`, SHA-256
  `076c586f8ca3a4f7b5c62c0f815e3570c14bbc8a598baae3e0b013cea34c86ea`,
  declares `License: LGPLv2+` for the packaged dictionary.
- Reviewed SPDX expression: `LGPL-2.1-or-later`.

| Mirrored payload | Locked blob | SHA-256 | Independent source |
| --- | --- | --- | --- |
| `el_GR/el_GR.aff` | `aad0574a85627584cb335fb700f961dee86e76e8` | `3f3188c71b9d1f640c9e680bc890b22249b83b640ec46f305b6a2257974bfa3f` | locked `el_GR_Greek.txt` selects LGPL 2.1 or later |
| `el_GR/el_GR.dic` | `e490e628150303209f174d806f74708d46b7ca2a` | `f08daefb302600beb1b345e4fd77f4ecf6617aa080a72efe6ae7eec0ad5b2ac7` | locked `el_GR_Greek.txt` selects LGPL 2.1 or later |
| `el_GR/hyph_el_GR.dic` | `6fa72d1fc43ab65a4ce31fd8762f8d7dbeb47dd5` | `58c1a8c6172d278128e8a0dfe251327a8478e839b4ffa5e99b4ef9968aea4a55` | Fedora source blob `7e7bb497a325cbf3f897d5f6b23b98bb1895b59b`, SHA-256 `f2284153c3f9a809b959dcaeb349e00d90b4c4cf37c3d3a338b371c32f10e89d` |

The Fedora source starts with `ISO8859-7`. Decode the remaining content as
ISO-8859-7, replace only that first line with `UTF-8`, and encode as BOM-free
UTF-8 with LF endings. The result is byte-identical to the locked payload. The
complete LGPL 2.1 text is retained as `COPYING_LGPL_v2.1.txt`, SHA-256
`dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551`.

## pt_PT

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent source: Debian `libreoffice-dictionaries 1:7.2.0-1`.
- Signed source record: `libreoffice-dictionaries_7.2.0-1.dsc`, SHA-256
  `e4d1ac6f71bfe219b8c26bf5719ad6adcdbf369d764ea90972015f7b7ef40e73`.
- Debian copyright mapping: `pt_PT/COPYRIGHT`, SHA-256
  `15092e924d00de1c127e75f08089fac9579808d47ccd64dd661f5fac428fd4ab`.
- Reviewed SPDX expression: `GPL-2.0-only`.

| Mirrored payload | Locked blob | SHA-256 | Debian source SHA-256 |
| --- | --- | --- | --- |
| `pt_PT/pt_PT.aff` | `ef6aaf55ccc2cfba2948cf5a92eb5f4849634c12` | `975a209fcc892cb382fa5f34a28c391a39668661ce373ae071287809c5fcae24` | byte-identical |
| `pt_PT/pt_PT.dic` | `fddc72f208101ae20e104a4e0ba91ef02a46bf2c` | `9d90cfd9fb15312db71fbe46c11f871df67684dae7c218ab270142e7ae68c377` | byte-identical |
| `pt_PT/hyph_pt_PT.dic` | `175866df94a7c1f7fc80500256cbeeea039d5185` | `aea78ca4e52f3f17f49a9009dc77b55e30e27dd72bae40f2ff71d8e36d244fca` | `6f18ee89de6db21d9b06120a5527ec41d8132514fc112ccfe7d289ba91649840` |

The Debian spelling bytes are exact. For hyphenation, decode the source as
ISO-8859-1, replace only the leading `ISO8859-1` declaration with `UTF-8`, and
encode as BOM-free UTF-8 with LF endings. The result reproduces the locked
payload. `COPYING_GPLv2` is the complete GPL 2 text, SHA-256
`edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6`.

## pt_BR

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent spelling source: `LibreOffice/dictionaries` commit
  `5cf23af85b47be6e398add826da1a02175be4238`.
- Independent hyphenation source: Fedora lookaside archive
  `hyphptBR-213.zip`, SHA-256
  `ace7c36fc5c9147bc9e782a93c89ffee46dc868486d7991fbf1bcd9c2942fe6a`,
  SHA-512
  `dfcd0d1ae9e757891c319a1ff457172b4bf37c84421ab35ecd1d7079fc08b0da18c72c0cd29bffb5b247c652dcf0725de85f5389d7462663032a3965456bdc01`.
- Versioned package mapping: `microsoft/azurelinux` commit
  `c5afbc66eece443fccce86bc325859a044eaa72f`, files
  `specs/h/hyphen-pt/hyphen-pt.spec` and `specs/h/hyphen-pt/sources`.
- Reviewed SPDX expression: `LGPL-2.1-only AND LGPL-3.0-only`.

| Mirrored payload | Locked and source blob | SHA-256 | Evidence |
| --- | --- | --- | --- |
| `pt_BR/pt_BR.aff` | `4664ad6fc893e5683c1140eab8c1e1faeca802d3` | `21d8ad2a769a60e17e2b5ea4ef11d4d593a58b9e2a82d642ef82d6a4c5523865` | `README_pt_BR.TXT`, SHA-256 `f687b608ecf02c57fc37ea81efa9bbdeef023cbf8eafc7a60467ab3417a1f29b` |
| `pt_BR/pt_BR.dic` | `849c1dcaf873e72e364f7a64b6f1f2a679bbb097` | `a38bfb26b68ece2834e79fe83e48d5792652970ace12db89d1b9674bf9933183` | `README_pt_BR.TXT`, SHA-256 `f687b608ecf02c57fc37ea81efa9bbdeef023cbf8eafc7a60467ab3417a1f29b` |
| `pt_BR/hyph_pt_BR.dic` | `d86e8a786a451882237aeaca153101dfc58062d9` | `a8eb1a64e4af4649c739211b397fa37b01f9d5774cf558fe3895fc3f26fd33a4` | `README_hyph_pt_BR.txt`, `hyphen-pt.spec` |

The spelling payloads are byte-identical across the locked and independent Git
commits. The locked `README_pt_BR.TXT` selects LGPL version 2.1 for the spelling
dictionary. The Fedora `sources` record binds the source ZIP SHA-512, while the
spec selects `LGPL-3.0-only` for the Brazilian hyphenation source and places
`README_hyph_pt_BR.txt` plus `hyph_pt_BR.dic` in `%files BR`; its separate
`GPL-1.0-or-later` term belongs to the Portuguese source packaged outside that
subpackage.

The ZIP members are the exact parent blobs of LibreOffice commit
`2bfbaa38e1acd6984a3745c1668ad78096c3fa00`. Decode both as ISO-8859-1 and
normalize CRLF to LF. For the dictionary, replace only the first-line charset
declaration `ISO8859-1` with `UTF-8`. For the README, remove the single legacy
ISO control separator on line 1320. Those operations reproduce the locked Git
blobs byte for byte. `pt_BR/verify-transform.ps1` verifies the archive, package
metadata, source members, transformations, evidence digests, and Git blob IDs
offline. Complete LGPL 2.1 and LGPL 3.0 texts are retained alongside the grants.

## uk_UA

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent source: `arysin/spell-uk` commit
  `224e59f701c6db89df2dbbdaf1a079657b8cdf7f`.
- Program license evidence: `uk_UA/COPYRIGHT`, source blob
  `7121bb91b121f43f4c1351d0b9682ef156efbba7`, SHA-256
  `d4ae120c2b0559043aaa6f92f586316e9cbd3cd62fcd3c2d605c82476a022dff`.
- Reviewed SPDX expression: `GPL-2.0-or-later`.

| Mirrored payload | Locked and source blob | SHA-256 |
| --- | --- | --- |
| `uk_UA/th_uk_UA.dat` | `93fc9e6e032d7bf5f46b7be8eb4185978ac2a4cf` | `1eebe8fc0c178b6e9c00c35abd79688f160039f38a74fdbf3afa368a016d3b06` |
| `uk_UA/th_uk_UA.idx` | `a679b504b7f7edea2af4546ec91a5c12878fb324` | `35e96ce9efab98958b99fe02668a516f59e51950179f805a082e039f10ce5cf2` |

`th_uk_UA.dat` is byte-identical to the independent source. Feeding it to
`th_gen_idx.pl` blob `0b649fcaea34498a0df920d3cad1e0695fd43499`
produces the locked index byte for byte. `COPYING_GPLv2` retains the complete
GPL 2 text, SHA-256
`edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6`.

## ru_RU current LibreOffice payloads

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Independent payload and license source: `LibreOffice/dictionaries` commit
  `30dd499a102c930b6386d9b0b44ed13e9d4cf8d2`.
- Independent path-license mapping: Debian `libreoffice-dictionaries
  1:7.2.0-1`.
- PGP-signed Debian source record:
  `ru_RU/libreoffice-dictionaries_7.2.0-1.dsc`, Git blob
  `65d651cc5ef1b93b95f229667f4e27df82aba0f9`, SHA-256
  `e4d1ac6f71bfe219b8c26bf5719ad6adcdbf369d764ea90972015f7b7ef40e73`.
- Debian packaging archive:
  `ru_RU/libreoffice-dictionaries_7.2.0-1.debian.tar.xz`, Git blob
  `9df739017833abdd28fafd15c1ca8e36ce84056e`, SHA-256
  `884d43ec0c208d40a8e323e82b05352ec99acb42031303cffba1620ccadfa8cc`.
- Debian copyright mapping: `ru_RU/COPYRIGHT`, Git blob
  `59b861c1529a9292a1edb5ac690d784b15fe0093`, SHA-256
  `15092e924d00de1c127e75f08089fac9579808d47ccd64dd661f5fac428fd4ab`.
- Reviewed SPDX expression:
  `LicenseRef-Russian-Dictionaries-Lebedev-1997-2008`.

| Mirrored payload | Locked and LibreOffice blob | SHA-256 |
| --- | --- | --- |
| `ru_RU/hyph_ru_RU.dic` | `1d82ffc3b4044e8d587751a368a4850c9cc6bad7` | `e9a6ae92765fc7e63d879f2ccf3f50f2b95bc8ed7618a6f31c34ce7d39844c83` |
| `ru_RU/ru_RU.aff` | `b6bef6d261914c579542b59c89dd03b83ae5927c` | `38ce7d4af78e211e9bafe4bf7e3d6a2c420591136cb738ec6648f8fdf6524cd7` |
| `ru_RU/ru_RU.dic` | `e5cfd3614c2303be12da481198b5d914e592da9c` | `f6047416a0204adbecf3a451b874ec8a97ee37e2cbc714466ef04d8dbcc0d6fc` |

All three payloads are byte-identical across the locked and independent Git
commits; no charset or line-ending transformation is applied. LibreOffice
`README_ru_RU.txt`, mirrored as `ru_RU/README_ru_RU.libreoffice.txt`, has Git
blob `4620b48a8a37d8f3f29dda667ea0aacc992bd26c` and SHA-256
`262af2f6ad70a61e5ee1332ff44fa8ee50edca819cf33207d8ad6ba6a0c9be52`.
It retains the complete custom terms and marks the 2012 `ru_RU.aff` change.
The exact `ru_RU.dic` source commit marks its 2021 removal of 14 spurious CR
bytes. Debian's copyright file explicitly maps `dictionaries/ru_RU/*` to
`custom-bsd-4-clauses`, including the three mirrored payload paths. The Debian
record corroborates license scope only; byte equality is established against
the immutable LibreOffice Git commit. The verifier checks that the archive
digest is listed in the `.dsc` and that its `debian/copyright` entry is
byte-identical to the mirrored `COPYRIGHT`. The `.dsc` signature bytes are
retained, but signer trust is not established by this component verifier.

## ru_RU historical OpenOffice 3 payloads

- Locked payload source: `ONLYOFFICE/dictionaries` commit
  `d3223bbb777883db66ac3cd249f71c6ebdc992c7`.
- Original package: Apache OpenOffice Russian Dictionary 0.6, released
  2009-06-03 at
  <https://extensions.openoffice.org/en/projectrelease/russian-dictionary-06.html>.
- Package download: <https://sourceforge.net/projects/aoo-extensions/files/936/9/dict_ru_ru-0.6.oxt/download>.
- Mirrored OXT: `ru_RU/dict_ru_ru-0.6.oxt`, 526,297 bytes, SHA-256
  `92dbd078637c087ff2a86bf45fcccf7cfd5a21af0e36767e760a39192a3d5e1a`.
- Independent Git source: Chromium hunspell dictionaries commit
  `62e19ad256c9b53f5f7e4c67e2e9779c4cc3ac40`.
- Reviewed SPDX expression:
  `LicenseRef-Russian-Dictionaries-Lebedev-1997-2008`.

| Mirrored payload | Locked blob | SHA-256 | OXT source blob | OXT source SHA-256 |
| --- | --- | --- | --- | --- |
| `ru_RU/ru_RU_oo3.aff` | `dc7bf1523582bf2960774ec52cfcffcc1e7e5651` | `abedafc2284041150125ae27e268fbe5cf8f43719f510c2becbd7b45d0fa7256` | `cf92c941563e11f06a88cf2790397a70887d3a23` | `f868ff4913af498d342fd9423d5a5295720aa2d66d0d9e7a05fc18fa0eb5e236` |
| `ru_RU/ru_RU_oo3.dic` | `57e14338dd70a139605712e2b70ca97a3c967051` | `8e2d063a53ee36d7985d8380cc61e13da5d1c6d61e313e60e6a858f2fdfb2a8b` | `aa9ea7a84e95ef2255b6fef13205c87e6796ce05` | `12b781ad1c8305cde4cb737a78d1aafa755fe16e2615c4584c4b14b86e2f02cd` |

The OXT contains `ru_RU.aff` and `ru_RU.dic` as KOI8-R bytes. For each locked
payload, remove the leading bytes `EF BB BF`, decode the remainder as UTF-8,
then encode the resulting Unicode characters as Windows-1251. The output is
byte-identical to the corresponding OXT entry; no newline or content
normalization is applied. `ru_RU/verify-transform.ps1` verifies the archive,
source, evidence, and transformation digests offline.

The OXT `LICENSE` is mirrored as
`LICENSERef-Russian-Dictionaries-Lebedev-1997-2008.txt`, Git blob
`0ded5e1495072d6a413837128ba1b9d358b92254`, SHA-256
`6327fa3b084fd87abf8f8779af3a7143da0ffbcc92498dcbd95f1d23b3d82bf7`.
It grants redistribution and modification under four custom BSD-like
conditions and is not equivalent to a standard SPDX BSD identifier. Chromium
`README_ru_RU.txt`, mirrored at Git blob
`d251d6feabb0c66987f6c629d03465b3282c29f2`, SHA-256
`ab0a15a2977d17936f8361c0644834aaa286aa0f76ff4a707e9435212b1387b2`,
independently identifies the OpenOffice source and reproduces the complete
license and package README. `MODIFICATION_NOTICE.txt` satisfies the license's
requirement that modified versions be clearly marked.
