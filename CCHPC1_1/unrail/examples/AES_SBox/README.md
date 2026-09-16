# S-box filename naming

| Pattern | Meaning |
| ------- | ------- |
| `cchpc1_1_<name>.unrail` | Benchmark S-boxes in the CCHPC1.1 paper |
| `nist-aes-sbox-<dir>-g<g>-a<a>-d<d>-ad<ad>.unrail` | Historical NIST SLP |
| `aes-sbox-<dir>-a<a>-ad<ad>-g<g>-gd<gd>-xx<xx>-<id>.unrail` | Current NIST-style circuit, checked 2026-09-16 |
| `aes-sbox-fwd-g224-a29-d34-ad6.unrail` | Original 29-AND circuit [[Umi26]](https://umizame.github.io/S-box_29-AND/) |

| Token | Meaning |
| ------- | ------- |
| `<dir>` | `fwd` = forward AES S-box, `inv` = inverse AES S-box |
| `<g>` | gate count |
| `<gd>` | gate depth |
| `<a>` | AND count |
| `<ad>` | AND depth |
| `<d>` | gate depth in historical NIST names |
| `<xx>` | XOR/XNOR count |
| `<id>` | NIST circuit identifier |
