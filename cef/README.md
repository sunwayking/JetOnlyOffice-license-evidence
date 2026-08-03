# CEF 5414 Linux License Evidence

The evidence was extracted from the locked build-tools-data payload at commit
`743e8e55f0431523248d16b7521e01aa11744ffc`. The payload SHA-256 is
`dff9aa53c147fd0c6a03f57e17aef10b0cee3fe7c4dc18b3b1a8a7a20bf0a145`.

The archive identifies CEF `109.1.18+gf1c41e4`, Chromium
`109.0.5414.120`, CEF commit
`f1c41e4b1392ef8816171c4d51a2fca308db5501`, and Chromium commit
`168eebf2055fd26ca8c71787b7b3f9fe7c90d13d` in `libcef.so`.

`extract-evidence.mjs` deterministically extracts two resources embedded in
the exact payload:

- CEF `LICENSE.txt`, DataPack resource `63001`, SHA-256
  `058c3827ffb827ff3edda471ae7e1bb1d1aa5931985f0126043ccd33409e792f`.
- Chromium generated credits, DataPack resource `31061`, SHA-256
  `4323092783bb888b8cacdd0f4e6173a69eedc29b747015376f17d337bbe304ef`.

The credits document contains 357 product, homepage, and non-empty license
blocks, including the bundled Chromium, V8, ICU, ANGLE, Vulkan, and
SwiftShader dependencies. The source resolver re-extracts both resources from
the exact locked payload and compares them byte-for-byte with this evidence.

Run `node cef/extract-evidence.mjs <path-to-cef_binary.7z>` with Node.js and
7-Zip to reproduce and verify the extracted files.
