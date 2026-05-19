# Day 03 · Nmap Flag Knowledge

You'll be asked Nmap flag questions on the CEH exam — not full scans against
live hosts. This drill is offline: no network needed, no target needed. You
match scan **intent** to the right flag combination.

## The challenge

The file `questions.txt` contains 8 scenarios. Write the right Nmap command
for each one in `answers.txt`, one command per line, same order as the
questions. Only the flags matter — the target IP can be a placeholder like
`<target>`.

When you're done:

```
drill check
```

## Allowed reference

- `man nmap`
- `nmap --help`

## Tip

In WebVM the kernel does not expose raw sockets, so SYN scans (`-sS`) and
ping sweeps (`-sn`) will not actually fire packets — but the flags are
still the right *answer* for the exam. This drill grades on flag
correctness, not execution.
