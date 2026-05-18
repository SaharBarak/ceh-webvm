# Grep the flag

**Day 01 · Drill 01 · Foundations**

A directory of decoy files contains exactly one CEH-style flag in the
format `FLAG{...}`. Find it and place it in a file called `answer.txt`
in the drill directory (where you are right now).

## Setup

The drill's `setup.sh` already ran when you typed `drill start`. It
created `./challenge/` with ~50 files and exactly one flag hidden among
them. The flag matches the regex `FLAG\{[A-Za-z0-9_]+\}`.

## Your job

```bash
# poke around
ls ./challenge | head
file ./challenge/*

# find it
grep -rE 'FLAG\{[A-Za-z0-9_]+\}' ./challenge

# capture the answer
echo 'FLAG{...}' > answer.txt

# grade
drill check
```

## What this drill teaches

- Recursive `grep` with `-r` and basic POSIX/extended regex (`-E`).
- Reading file types with `file` before assuming `cat` is safe.
- The CTF-style `FLAG{...}` pattern you'll see across every CEH-adjacent
  capture-the-flag exercise.

## Cheats

If you're stuck, `drill hint` will print a hint without spoiling the
answer.
