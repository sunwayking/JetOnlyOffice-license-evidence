# Qt 5.9.9 gcc_64 binary (tar.xz re-pack)

- Source bytes: qt/qt_binary_5.9.9_gcc_64.7z (33,556,497 bytes),
  SHA-256 84181f983a5e76c2f8a63f8bf06d5ce27675f543c45febe014514633a1289f0e
  (the locked build-tools-data LFS payload, license-reviewed as the qt
  component).
- Transformation: 7z extracted with py7zr, re-packed with GNU tar
  (WSL Ubuntu) as 'tar -cJf' - xz-compressed pax tar, gcc_64/ at the
  archive root, 7,622 entries, symlinks preserved.
- Result: qt/qt_binary_5.9.9_gcc_64.tar.xz (33,281,840 bytes),
  SHA-256 ae28c14084154f9075dab3b9f17a5b3415a0be036f5a8abff27cada3dcc234b4.
- Reason: the toolchain materializer supports deb/tar/tar-gzip/tar-xz;
  the tar.xz container carries the identical extracted tree the upstream
  qt_binary_fetch.py produces under qt_build/Qt-5.9.9/gcc_64.
