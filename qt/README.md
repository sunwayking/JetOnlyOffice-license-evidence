# qt bundle evidence (qt/qt_binary_5.9.9_gcc_64.7z)

The mirrored 7z archive is byte-identical to the locked build-tools-data
LFS payload (materialized SHA-256
84181f983a5e76c2f8a63f8bf06d5ce27675f543c45febe014514633a1289f0e),
locked at commit 743e8e55f0431523248d16b7521e01aa11744ffc.

## License decision

The bundle contains GPLv3-only Qt modules (Charts, Data Visualization,
NetworkAuth, VirtualKeyboard), so the conservative reviewed expression
treats the whole Qt payload as GPL-3.0-only and ANDs the compatible
third-party licenses of the statically integrated components.

The Qt 5.9.9 open-source options (LGPL v3 / GPL v2 / GPL v3) and the
per-module license files are mirrored from the
qt-everywhere-opensource-src-5.9.9 source archive.

## Third-party inventory (statically integrated, version-pinned)

- zlib 1.2.11 (Zlib): binary version string, Qt attribution, mirrored
  zlib.h header with the complete license text.
- libpng 1.6.37 (Libpng AND libpng-2.0): binary version string, Qt
  attribution, png.h 1.6.37 with both license texts.
- libjpeg 8c (IJG): Qt source jversion.h and README with the IJG terms.
- libtiff 4.1.0 (libtiff): binary version string and mirrored COPYRIGHT.
- libwebp 1.0.3 (BSD-3-Clause): Qt attribution and mirrored COPYING.
- PCRE2 10.32 (BSD-3-Clause, sljit BSD-2-Clause): Qt attribution and
  mirrored LICENCE.
- double-conversion 2.0.1 (BSD-3-Clause): Qt attribution and mirrored
  LICENSE.
- old HarfBuzz (MIT): Qt attribution and mirrored 1.9.0 COPYING.
- easing, forkfd, FreeBSD strtoll/strtoull, RFC6234 (BSD-3-Clause / MIT):
  mirrored Qt attribution records.
- MD4 / MD5 / SHA-1 (public domain) and SHA-3 brg_endian/Keccak
  (BSD-3-Clause / CC0-1.0): mirrored Qt attribution records.

External runtime dependencies (ICU, OpenSSL via dlopen, FreeType,
fontconfig, xcb, GLib, GStreamer, ALSA, PulseAudio, CUPS, GTK, D-Bus,
Wayland) are not packaged inside the 7z and are audited separately for
the runtime image.

## Reviewed SPDX expression

    GPL-3.0-only AND MIT AND BSD-3-Clause AND BSD-2-Clause AND Zlib
    AND Libpng AND libpng-2.0 AND IJG AND libtiff AND CC0-1.0
    AND LicenseRef-Public-Domain

LicenseRef-Public-Domain is bound by the MD4, MD5, and SHA-1 attribution
records.
