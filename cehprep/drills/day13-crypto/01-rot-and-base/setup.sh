#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
[ -f "$HERE/questions.txt" ] && exit 0

# Pick a random subset of plaintexts so the drill is fresh each time.
plaintexts=(
  "fingerprint" "exfiltrate" "permissions" "ciphertext" "vulnerable"
  "exploitkit" "privilege" "hashfunc" "saltround" "blockcipher"
)
picks=()
indexes=($(printf "%s\n" {0..9} | sort -R | head -n5))
for i in "${indexes[@]}"; do picks+=("${plaintexts[$i]}"); done

p1="${picks[0]}"   # ROT13
p2="${picks[1]}"   # ROT47
p3="${picks[2]}"   # Base64
p4="${picks[3]}"   # Base32
p5="${picks[4]}"   # Hex

c1=$(printf '%s' "$p1" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
c2=$(printf '%s' "$p2" | python3 -c "import sys; s=sys.stdin.read(); print(''.join(chr(33+((ord(c)-33+47)%94)) if 33<=ord(c)<=126 else c for c in s), end='')")
c3=$(printf '%s' "$p3" | base64 | tr -d '\n')
c4=$(printf '%s' "$p4" | base32 | tr -d '\n=')
c5=$(printf '%s' "$p5" | xxd -p | tr -d '\n')

cat > "$HERE/questions.txt" <<EOF
1. ROT13   : ${c1}
2. ROT47   : ${c2}
3. Base64  : ${c3}
4. Base32  : ${c4}
5. Hex     : ${c5}
EOF

# .answer records the expected plaintexts in question order.
printf '%s\n%s\n%s\n%s\n%s\n' "$p1" "$p2" "$p3" "$p4" "$p5" > "$HERE/.answer"
chmod 600 "$HERE/.answer"

cat > "$HERE/answers.txt" <<'EOF'
# One plaintext per line, same order as questions.txt.
EOF
