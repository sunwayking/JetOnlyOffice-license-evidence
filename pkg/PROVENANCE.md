# pkg toolchain and pkg-fetch base cache

- pkg-toolchain.tar: npm install --prefix of @yao-pkg/pkg@6.11.0 with the
  locked Node v20.20.2 (21,043,200 bytes),
  SHA-256 5f9197c119dd410b9ceedc0789e93bd5f25cbe3959589f59cca2b4e1d3116dd3.
  Layout: node_modules/ + package.json/package-lock.json + bin/pkg
  wrapper (exec node /work/toolchain-root/usr/local/node_modules/
  @yao-pkg/pkg/lib-es5/bin.js).
  License census: pkg-license-census.json - 115 packages, 8 distinct
  SPDX values, none unresolved.

- pkg-fetch-cache.tar: PKG_CACHE_PATH collected by running pkg 6.11.0
  once for linux-x64 (54,814,720 bytes),
  SHA-256 2b644ece82b6b2bcd3b79dd79fb1549ef8508e8ebe8684e12cf76ff011dc9ebe.
  Layout: v3.5/ (the fetched Node base binaries) at the archive root.
  License: MIT (yao-pkg/pkg-fetch project license; the contained
  binaries are the upstream Node.js builds).
