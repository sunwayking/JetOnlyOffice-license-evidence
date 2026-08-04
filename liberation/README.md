# Liberation 1.07.4 evidence

This directory maps the sixteen `liberation/*.ttf` payloads from the locked
ONLYOFFICE `core-fonts` commit to the Liberation Fonts license. The payload
bytes are copied from that Git tree without conversion.

## License decision

The complete upstream terms are in `License.txt` (SHA-256
`c40dd6adebad817defd68c7edad151d9c13d2ac3b4e1790ce2b727b024438b6d`). They
grant use, modification, copying, and distribution under GPL version 2 with
the document-embedding and physical-product source exceptions, and retain the
Red Hat trademark restriction. Fedora Legal's immutable data commit
`f56793a144b02e58458cb1556b85b1db32a45ab4` classifies the exact custom
expression `LicenseRef-Liberation` as `allowed-fonts`; its mirrored TOML is
`LicenseRef-Liberation.toml` (SHA-256
`11e4dd5a35e5f2640a68e2153b272ecc9e1b7e70fa0c5ef99a74ff2e6aeb0582`).
Fedora's `data/*` reuse declaration and the complete CC0 and
License-of-Licenses texts are mirrored under `attestations/`.

The reviewed expression is therefore `LicenseRef-Liberation`. The Fedora
classification is a legal-data corroboration, not a replacement for the
complete upstream terms.

## Version and provenance

- Locked consumer: `ONLYOFFICE/core-fonts` commit
  `7030c6681fb5bbed560675cb42422f91df15d5c9`.
- Upstream Liberation source: `liberation-fonts-1.07.4.tar.gz`, SHA-256
  `ad98b7498dc2992f7f0868f79b65ce4a720a3acdb63ab3f1f1cb6881117a5406`.
- Debian corroboration: signed `fonts-liberation_1.07.4-2.dsc`, SHA-256
  `d51db467a65d67ede5f6cace49946dd869f3ee3c8f264ee45e7b1c60eacdea5c`, and
  `fonts-liberation_1.07.4-2_all.deb`, SHA-256
  `b342d0382aaf8d64a61c347b6e83f84c1ad50aa4ed3df661ece9010fce3ee72a`.
  The DSC names the same 2,937,949-byte orig archive and its SHA-256.
- `attestations/debian-copyright` is retained as a second package-side copy of
  the terms (SHA-256 `6d45ece44b5d855ec08440a48761e3266e2521e2c24c814404218e91d6d72442`).

## Locked payloads

The following SHA-256 values are the entity digests of the sixteen regular Git
blobs; the corresponding Git blob IDs are recorded in the build-tools lock.

| Payload | SHA-256 |
| --- | --- |
| `LiberationMono-Bold.ttf` | `1e81c74bfaf93ce724e3c2118f085c84ee9f9aa7a56bfe4e87d7746863c4ab95` |
| `LiberationMono-BoldItalic.ttf` | `319157f5d824ede8ce397e46d65d1fbd4d01c3699a903fff73c5a17ec120f5d9` |
| `LiberationMono-Italic.ttf` | `00b76b2717491709a2c7f8dfacfebeeee12cdce06fb8a95b0dd8836033a432af` |
| `LiberationMono-Regular.ttf` | `5738bfd34fac3e9454281b3ebdff6ba64f0558fac3dad4c7da22aae21a05fc1e` |
| `LiberationSans-Bold.ttf` | `e32256f280c7ffeb29f9b8da6ceb64781c440ccd683b5fcc9c22646ffec019c5` |
| `LiberationSans-BoldItalic.ttf` | `a3dbf57c98a0a6ec8fc7a10301f2f4440dbb171c90a3b5ab48b05622469bb9ce` |
| `LiberationSans-Italic.ttf` | `0f9b08355791c08e7e704063d56971f72b31fde0bffe63a57f5683779ff9db8b` |
| `LiberationSans-Regular.ttf` | `d44ef4341131f4f9bc7d336e0d5c479fe6ecf15a183e6b5a4e88289dd2d333d6` |
| `LiberationSansNarrow-Bold.ttf` | `5ff9217a6a7cd6cccdca8fd436e3d8a7bbb075e7f6c009f8809480dc5349e2e6` |
| `LiberationSansNarrow-BoldItalic.ttf` | `ceac79459f017d19275118fc27fbffb2924c2dd6645d362b0afece16026d98ec` |
| `LiberationSansNarrow-Italic.ttf` | `f1d1465feb4ab621b9eadc42a722b5895944debd0aab96ef197e9ae3ab609c55` |
| `LiberationSansNarrow-Regular.ttf` | `31de1a7adf5eb3e01a3d2319cae80ede2379a09cbbf692eb56f7024bfb0c8237` |
| `LiberationSerif-Bold.ttf` | `0755523e1bf3f40612a563c0f5f4ce2e97110a9f5900b15b3dd598185f138ecb` |
| `LiberationSerif-BoldItalic.ttf` | `a9ddeee9ca1ec9138d9fef5e6103f84e9113d1f1f34f97db61e1cd034150f722` |
| `LiberationSerif-Italic.ttf` | `758024be56a69ac7222e41ea441c4a3bc2fef8386c27506afa0e52473a5df19d` |
| `LiberationSerif-Regular.ttf` | `44c68d8acbf7314226592d30b50caf3832aaa81ab63b40f60cd11369618a613a` |

Run `verify-transform.ps1` before publishing a new evidence tag. It checks the
payload and evidence digests, regular Git blobs, the Fedora classification,
and the versioned Debian source record without network access.
