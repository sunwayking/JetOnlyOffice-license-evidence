# ru_RU Payload Reproduction

## Current payloads

`hyph_ru_RU.dic`, `ru_RU.aff`, and `ru_RU.dic` are byte-identical Git blobs
in the locked ONLYOFFICE commit and LibreOffice commit
`30dd499a102c930b6386d9b0b44ed13e9d4cf8d2`. No transform is applied.

## Historical OpenOffice 3 payloads

The locked ONLYOFFICE files are historical encoding-transformed copies of the
KOI8-R payloads in Apache OpenOffice Russian Dictionary 0.6.

For each pair, let `source` be the raw OXT entry:

```text
locked = EF BB BF || UTF8.encode(Windows1251.decode(source))
source = Windows1251.encode(UTF8.decode(locked after EF BB BF))
```

The transformation preserves every source byte through the Windows-1251
round trip. It does not decode the source as KOI8-R, rewrite the `SET KOI8-R`
declaration, or normalize line endings. This intentionally reproduces the
historical mojibake stored by ONLYOFFICE.

Run the offline verifier from this directory:

```powershell
pwsh -NoProfile -File .\verify-transform.ps1
```

The verifier checks all five payloads and their Git blob IDs, current license
evidence, extraction of Debian `debian/copyright`, the OXT, both historical
source entries, and the byte-for-byte inverse transformation.
