# zstd verifier binary

- Source: zstd 1.5.7 official release tarball
  zstd-1.5.7.tar.gz (2,434,947 bytes),
  SHA-256 eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3
  (matches the official zstd-1.5.7.tar.gz.sha256).
- Build: make -j4 zstd on Ubuntu 20.04 (WSL2), gcc 9.4.0, glibc 2.31;
  libzstd is linked statically, libc dynamically (minimum glibc 2.31;
  the locked ubuntu:24.04 builder ships glibc 2.39 and runs the binary -
  verified with zstd --version inside the locked image).
- Binary: 1,304,088 bytes, SHA-256
  1c385004523815485355a1f44a58bba36d8c5fe7d827c1326316eba2f8de6d70.
- License: BSD-3-Clause (zstd upstream).
- Note: the Ubuntu-24.04 container build was attempted first (network to
  archive.ubuntu.com unavailable at authoring time) and an alpine musl
  static build was attempted (registry index fetch unavailable); the
  WSL build above is the verified fallback with this provenance.
