# ru_RU_oo3 Reproduction

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

The verifier checks the OXT, license, Chromium README, both source entries,
both locked payloads, and the byte-for-byte inverse transformation.
