# python bundle evidence (python/python3.tar.gz)

The mirrored tarball is byte-identical to the locked build-tools-data
payload (SHA-256
c251fd88959ad83a64711d37d7897d0bf7a3ed272f23b6ef6216e0eed0bf9360),
locked at commit 743e8e55f0431523248d16b7521e01aa11744ffc. The bundle
is the Chromium infra CIPD package infra/3pp/tools/cpython3/linux-amd64
build with patch_version chromium.2, built from python/cpython v3.10.8
with static modules.

## Component inventory

Top-level: CPython 3.10.8 (PSF-2.0, LICENSE.txt byte-identical to the
v3.10.8 release tag), pip 20.3.4 (MIT), setuptools 44.1.1 (MIT), wheel
0.37.1 (MIT), and the ensurepip bundled wheels pip 22.2.2 (MIT) and
setuptools 63.2.0 (MIT) with their vendored dependencies.

Vendored package licenses (deduplicated): MIT (pip, setuptools, wheel,
appdirs, html5lib, pep517, pyparsing, six, toml/tomli, urllib3,
platformdirs, rich, zipp, jaraco.*, more-itertools, ordered-set),
Apache-2.0 (CacheControl, distro, msgpack, requests, retrying, tenacity,
importlib_metadata, importlib_resources), MPL-2.0 (certifi),
LGPL-2.1-only (chardet), BSD-3-Clause (colorama, idna, webencodings),
BSD-2-Clause (pygments), ISC (progress, resolvelib), and
(BSD-2-Clause OR Apache-2.0) (packaging). PSF-2.0 also covers
contextlib2, distlib, ipaddress, and typing_extensions.

Statically linked libraries inside the python3.10 binary (ELF DT_NEEDED
lists only glibc): OpenSSL 1.1.1j (OpenSSL license), expat 2.4.9 (MIT),
libmpdec 1.70 (BSD-2-Clause), zlib 1.2.12 (Zlib), bzip2 1.0.6
(bzip2-1.0.6), XZ/liblzma 5.2.4 (public domain), SQLite 3.19.3 (public
domain), libffi (MIT), libedit (BSD-3-Clause), ncurses 6.0 (MIT), and
libuuid (BSD-3-Clause). Each is version-pinned from the binary's own
version strings plus the matching upstream license text mirrored here.

## Reviewed SPDX expression

    PSF-2.0 AND MIT AND Apache-2.0 AND MPL-2.0 AND LGPL-2.1-only
    AND BSD-3-Clause AND BSD-2-Clause AND ISC
    AND (BSD-2-Clause OR Apache-2.0) AND OpenSSL AND Zlib
    AND bzip2-1.0.6 AND LicenseRef-Public-Domain

LicenseRef-Public-Domain is bound by the SQLite copyright statement and
the XZ Utils COPYING text.
