# Day 13 · Crypto — ROT and Base Encodings

Five short strings have been encoded with classic transforms. Identify the
transform, decode each one, and write the plaintexts into `answers.txt`.

```
drill check
```

## Allowed tools

Anything pre-installed on this image: `tr`, `python3`, `openssl`, `base64`,
`xxd`, `rev`. The grader doesn't care *how* you decode, only what comes
out.

## Tip

Five transforms appear once each:
  • ROT13 (a↔n, b↔o, …)
  • ROT47
  • Base64
  • Base32
  • Hex (each byte as two hex digits)

The plaintexts are short, all lowercase, no spaces.
