import { createHash } from "node:crypto";
import { spawnSync } from "node:child_process";
import { mkdirSync, writeFileSync } from "node:fs";
import { brotliDecompressSync } from "node:zlib";
import path from "node:path";

const archive = process.argv[2];
if (!archive) {
  throw new Error("usage: node extract-evidence.mjs <cef_binary.7z>");
}

function sha256(content) {
  return createHash("sha256").update(content).digest("hex");
}

function extract(member) {
  const result = spawnSync(
    process.platform === "win32" ? "C:\\Program Files\\7-Zip\\7z.exe" : "7z",
    ["e", "-so", archive, member],
    { encoding: null, maxBuffer: 16 * 1024 * 1024 },
  );
  if (result.status !== 0) {
    throw new Error(`7z failed for ${member}: ${result.stderr.toString("utf8")}`);
  }
  return result.stdout;
}

function pakResource(pak, resourceId) {
  if (pak.readUInt32LE(0) !== 5) {
    throw new Error("unsupported Chromium DataPack version");
  }
  const resourceCount = pak.readUInt16LE(8);
  for (let index = 0; index < resourceCount; index += 1) {
    const entry = 12 + index * 6;
    if (pak.readUInt16LE(entry) !== resourceId) {
      continue;
    }
    const start = pak.readUInt32LE(entry + 2);
    const end = pak.readUInt32LE(entry + 8);
    return pak.subarray(start, end);
  }
  throw new Error(`resource ${resourceId} is absent`);
}

const cefLicense = pakResource(
  extract("cef_binary/Resources/chrome_100_percent.pak"),
  63001,
);
const secondCefLicense = pakResource(
  extract("cef_binary/Resources/chrome_200_percent.pak"),
  63001,
);
const compressedCredits = pakResource(
  extract("cef_binary/Resources/resources.pak"),
  31061,
);
const chromiumCredits = brotliDecompressSync(compressedCredits.subarray(8));
if (!cefLicense.equals(secondCefLicense)) {
  throw new Error("CEF license resources differ between scale packs");
}
const creditsText = chromiumCredits.toString("utf8");
const products = creditsText.match(/<div class="product">/g) ?? [];
const licenses = [
  ...creditsText.matchAll(/<div class="licence">\s*<pre>([\s\S]*?)<\/pre>/g),
];
const homepages = creditsText.match(/<span class="homepage">/g) ?? [];
if (
  products.length !== 357
  || licenses.length !== 357
  || homepages.length !== 357
  || licenses.some((match) => match[1].trim().length === 0)
) {
  throw new Error("Chromium credits inventory is incomplete");
}

const expected = {
  cefLicense: "058c3827ffb827ff3edda471ae7e1bb1d1aa5931985f0126043ccd33409e792f",
  compressedCredits: "68c698b348ca2878a485d7b355217b4c433adf1b2b35b375b88924a6c31ebc75",
  chromiumCredits: "4323092783bb888b8cacdd0f4e6173a69eedc29b747015376f17d337bbe304ef",
};
const actual = {
  cefLicense: sha256(cefLicense),
  compressedCredits: sha256(compressedCredits),
  chromiumCredits: sha256(chromiumCredits),
};
if (JSON.stringify(actual) !== JSON.stringify(expected)) {
  throw new Error(`CEF evidence digest mismatch: ${JSON.stringify(actual)}`);
}

const output = path.dirname(new URL(import.meta.url).pathname.replace(/^\/(.:)/, "$1"));
mkdirSync(output, { recursive: true });
writeFileSync(path.join(output, "LICENSE.txt"), cefLicense);
writeFileSync(path.join(output, "chromium-credits.html"), chromiumCredits);

for (const [name, digest] of Object.entries(actual)) {
  process.stdout.write(`${name} ${digest}\n`);
}
process.stdout.write(`creditsInventory ${products.length}\n`);
