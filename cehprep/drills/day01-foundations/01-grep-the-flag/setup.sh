#!/usr/bin/env bash
# Seed the challenge directory. Idempotent — running twice does nothing.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
CHAL="$HERE/challenge"
[ -d "$CHAL" ] && exit 0
mkdir -p "$CHAL"

# 50 decoys: random base64 noise that won't match FLAG{...}
for i in $(seq -w 1 50); do
  head -c 256 /dev/urandom | base64 > "$CHAL/decoy_${i}.txt"
done

# A handful of binary decoys to discourage `cat *`
for i in 1 2 3; do
  head -c 4096 /dev/urandom > "$CHAL/blob_${i}.bin"
done

# Pick a random nesting depth and filename for the real flag.
NEST=$(( (RANDOM % 3) + 1 ))
DIR="$CHAL"
for _ in $(seq 1 "$NEST"); do
  sub="sub_$(head -c 4 /dev/urandom | xxd -p)"
  DIR="$DIR/$sub"
  mkdir -p "$DIR"
done
FLAG_VAL="FLAG{linux_grep_$(head -c 6 /dev/urandom | xxd -p)}"
echo "$FLAG_VAL" > "$DIR/notes.txt"

# Record the answer for the grader (not for the user).
echo "$FLAG_VAL" > "$HERE/.answer"
chmod 600 "$HERE/.answer"
