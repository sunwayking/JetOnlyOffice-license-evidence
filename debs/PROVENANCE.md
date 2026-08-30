# Compiler toolchain .deb closure (Ubuntu noble, amd64)

48 binary packages forming the offline C/C++ toolchain closure for
linux-amd64 builds. Downloaded from archive.ubuntu.com (Ubuntu 24.04
noble), byte sizes verified on download, SHA-256 computed locally.

## Method

1. Resolved the closure with `apt-get --print-uris` on the locked
   ubuntu:24.04 base image (build-essential + g++-13 + locales).
2. Downloaded every .deb directly from archive.ubuntu.com and
   verified each file size against the apt record.
3. Extracted `usr/share/doc/<pkg>/copyright` from every package with
   `dpkg-deb -x`; where the doc directory is a symlink to a sibling
   package, the copyright was resolved through the target package.
4. Machine-tier license mapping (DEP-5 License fields and traditional
   copyright text), then reviewed package by package against the
   actual installed file lists (`dpkg -c`), so licenses of files not
   shipped in a binary package are excluded.

## Packages

| id | version | sha256 (first 16) | size | license (SPDX) |
|---|---|---|---|---|
| binutils-common | 2.42-4ubuntu2.10 | d136073f5e2153f3 | 240286 | GPL-3.0-or-later |
| binutils-x86-64-linux-gnu | 2.42-4ubuntu2.10 | 1e510a15f30208d3 | 2462744 | GPL-3.0-or-later |
| binutils | 2.42-4ubuntu2.10 | b3b5a84181a38fd1 | 18154 | GPL-3.0-or-later |
| cpp-13-x86-64-linux-gnu | 13.3.0-6ubuntu2~24.04.1 | 2ca48bf0c2d6465b | 10714542 | GPL-3.0-or-later |
| cpp-13 | 13.3.0-6ubuntu2~24.04.1 | c7535331fbb183c8 | 1042 | GPL-3.0-or-later |
| cpp-defaults-x86-64-linux-gnu | 4:13.2.0-7ubuntu1 | 85059b30960de358 | 5326 | GPL-2.0-or-later |
| cpp-defaults | 4:13.2.0-7ubuntu1 | b51f8094760f7b41 | 22442 | GPL-2.0-or-later |
| gxxxx-13-x86-64-linux-gnu | 13.3.0-6ubuntu2~24.04.1 | 0bd6af6164252d4e | 12161938 | GPL-3.0-or-later |
| gxxxx-13 | 13.3.0-6ubuntu2~24.04.1 | 0f3ef964b8a91a9c | 16048 | GPL-3.0-or-later |
| gxxxx-x86-64-linux-gnu | 4:13.2.0-7ubuntu1 | 145b027a542db5b2 | 964 | GPL-2.0-or-later |
| gxxxx | 4:13.2.0-7ubuntu1 | 800a84b369c64b18 | 1100 | GPL-2.0-or-later |
| gcc-13-base | 13.3.0-6ubuntu2~24.04.1 | e859aca26585bb91 | 51616 | GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.1 AND LGPL-2.1-or-later |
| gcc-13-x86-64-linux-gnu | 13.3.0-6ubuntu2~24.04.1 | a134b0319a82d145 | 21084546 | GPL-3.0-or-later |
| gcc-13 | 13.3.0-6ubuntu2~24.04.1 | 7438ff160b020a74 | 494262 | GPL-3.0-or-later |
| gcc-14-base | 14.2.0-4ubuntu2~24.04.1 | b95c172411a7fdae | 51014 | GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.1 AND LGPL-2.1-or-later |
| gcc-defaults-x86-64-linux-gnu | 4:13.2.0-7ubuntu1 | 72e79089a10e3813 | 1212 | GPL-2.0-or-later |
| gcc-defaults | 4:13.2.0-7ubuntu1 | 0e0bb8b25153ed1c | 5018 | GPL-2.0-or-later |
| libasan8 | 14.2.0-4ubuntu2~24.04.1 | 8321aac6230fa1da | 3026656 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libatomic1 | 14.2.0-4ubuntu2~24.04.1 | fe49cbbc7be75352 | 10466 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libbinutils | 2.42-4ubuntu2.10 | 064dce00ce94e1fc | 576834 | GPL-3.0-or-later |
| libc-bin | 2.39-0ubuntu8.8 | 64625a2e1b51e736 | 681710 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| libc-dev-bin | 2.39-0ubuntu8.8 | c894e5a5f1374296 | 20418 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| libc-devtools | 2.39-0ubuntu8.8 | c0a2294cac9b422b | 29336 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| libc6-dev | 2.39-0ubuntu8.8 | bb8741966e7c1d2e | 2125374 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| libc6 | 2.39-0ubuntu8.8 | 3b8d5391b6b484a4 | 3262434 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| libcc1-0 | 14.2.0-4ubuntu2~24.04.1 | 454456436ca76781 | 48002 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libctf-nobfd0 | 2.42-4ubuntu2.10 | da352eb7fa6c4369 | 98012 | GPL-3.0-or-later |
| libctf0 | 2.42-4ubuntu2.10 | 7ec86d697c366850 | 94474 | GPL-3.0-or-later |
| libgcc-13-dev | 13.3.0-6ubuntu2~24.04.1 | cd689db2691edaa1 | 2680642 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libgcc-s1 | 14.2.0-4ubuntu2~24.04.1 | aa7fadbe33b78bcf | 78392 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libgmp10 | 2:6.3.0+dfsg-2ubuntu6.1 | 285f8a505dfa8e1b | 253460 | GPL-2.0-or-later OR LGPL-3.0-or-later |
| libgomp1 | 14.2.0-4ubuntu2~24.04.1 | e8a95ec58125b493 | 148062 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libgprofng0 | 2.42-4ubuntu2.10 | 1b7e3c2fc162e835 | 848684 | GPL-3.0-or-later |
| libhwasan0 | 14.2.0-4ubuntu2~24.04.1 | 2195318cfe68fe16 | 1640706 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libisl23 | 0.26-3build1.1 | 4e040926e50fb961 | 679812 | MIT AND LGPL-2.1-or-later |
| libitm1 | 14.2.0-4ubuntu2~24.04.1 | 1fca498129dd3510 | 29702 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libjansson4 | 2.14-2build2 | 0cf79113f5d193ce | 32830 | MIT |
| liblsan0 | 14.2.0-4ubuntu2~24.04.1 | dc0c2a1a053e833b | 1321652 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libquadmath0 | 14.2.0-4ubuntu2~24.04.1 | dc8f0ca542e09d66 | 153316 | GPL-3.0-or-later WITH GCC-exception-3.1 AND LGPL-2.1-or-later |
| libsframe1 | 2.42-4ubuntu2.10 | 72093fb456864db5 | 15724 | GPL-3.0-or-later |
| libstdcxxxx-13-dev | 13.3.0-6ubuntu2~24.04.1 | ee5633e863e19c33 | 2419834 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libstdcxxxx6 | 14.2.0-4ubuntu2~24.04.1 | a51f8de7829211db | 792064 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libtsan2 | 14.2.0-4ubuntu2~24.04.1 | 8cbcc9b3ae5ef23b | 2771910 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libubsan1 | 14.2.0-4ubuntu2~24.04.1 | a16dea3abe2dcac9 | 1183812 | GPL-3.0-or-later WITH GCC-exception-3.1 |
| libzstd1 | 1.5.5+dfsg2-2build1.1 | dfcf25061e07aad7 | 299472 | (BSD-3-Clause OR GPL-2.0-only) AND MIT |
| locales | 2.39-0ubuntu8.8 | cdd2d347a357da6b | 4231022 | LGPL-2.1-or-later AND GPL-2.0-or-later |
| make | 4.3-4.1build2 | 1fe6a815b56c7b6e | 179752 | GPL-3.0-or-later |
| rpcsvc-proto | 1.4.2-0ubuntu7 | 7eb710fe148d224c | 67446 | BSD-3-Clause |

## Review notes

- binutils family: GPL-3.0-or-later (binutils is GPL-3+).
- gcc/g++/cpp metapackages (4:13.2.0): the gcc-defaults source
  package is GPL-2.0-or-later.
- gcc-13 compiler packages: GPL-3.0-or-later.
- gcc runtime libraries (libgcc-s1, libstdc++6, sanitizer runtimes,
  libgomp1, libatomic1, libitm1, libcc1-0, libquadmath0, dev
  variants): GPL-3.0-or-later WITH GCC-exception-3.1, as stated in
  the package copyright (GCC Runtime Library Exception, Version 3.1,
  31 March 2009). libquadmath0 additionally contains LGPL-2.1-or-later
  files (Moshier math code).
- gcc-13-base/gcc-14-base ship only the source-tree copyright
  statement; recorded as GPL-3.0-or-later AND the runtime-library
  exception grant AND LGPL-2.1-or-later.
- glibc family: LGPL-2.1-or-later (main) AND GPL-2.0-or-later
  (a few files).
- libgmp10: the Files: * license is GPL-2.0-or-later OR LGPL-3.0-or-later;
  GPL-3.0-or-later/Bison-exception parts live in demos/ and are not
  shipped in libgmp10.
- libisl23: MIT (main) AND LGPL-2.1-or-later (isl_qsort.c); the
  BSD-2-clause files are the python interface, not shipped.
- libjansson4: MIT.
- libzstd1: (BSD-3-Clause OR GPL-2.0-only) for the library AND MIT
  for divsufsort; the zlib files belong to zlibWrapper examples,
  not shipped in libzstd1.
- make: GPL-3.0-or-later.
- rpcsvc-proto: BSD-3-Clause; the autoconf-exception files are build
  scripts, not shipped in the binary package.

Each package's copyright file is archived under `debs/copyrights/`.
The byte-level identity of every .deb (SHA-256 and size) is pinned in
locks/toolchain.lock.json of the build_tools repository.
