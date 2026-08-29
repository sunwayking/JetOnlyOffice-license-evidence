# npm offline cache (web-apps build closure)

- Collection: npm install/npm ci run with the locked Node.js v20.20.2
  against https://registry.npmjs.org/ through the reviewed gateway,
  npm_config_cache pointing at the collected cacache layout (npm 10.8.2).
- Projects: web-apps/build (npm install), web-apps/build/sprites (npm ci),
  web-apps/vendor/framework7-react (npm ci), locked by their committed
  package-lock.json files (web-apps develop 496f098a).
- Override: glob-to-regexp is pinned to 0.4.1 (BSD-2-Clause, license text
  shipped) because the 0.3.0 release carries a bare BSD field with no
  grant text and its upstream repository was deleted.
- Archive: npm-offline-cache.tar (81,438,720 bytes),
  SHA-256 4975be16bfebd658a7380995d44a165d6885b5748689d822f1f8afd182f46a51,
  plain GNU tar with the cache contents at the archive root.
- License census: npm-license-census.json maps all 1,408 packages to
  their resolved SPDX expressions (20 distinct values); the 24 legacy
  packages without a registry license field were resolved from upstream
  repository licenses, shipped license texts, or the project-local
  file:sprites source (AGPL-3.0).
