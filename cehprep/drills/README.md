# CEH-Prep WebVM Drills

Drills live under `dayNN-<theme>/MM-<slug>/`. Each drill is self-contained:

- `README.md` — the prompt the user reads
- `setup.sh` — optional seed script, runs on `drill start` (idempotent)
- `check` — local grader, exit 0 = pass
- `HINT.md` — optional, printed by `drill hint`
- `.answer` — written by `setup.sh`, consumed by `check` (never read by the user)

## Conventions

- Drills must be **idempotent**: re-running `setup.sh` does nothing if state already exists.
- Drills must be **offline-fittable**: grading happens entirely inside the WebVM. Network-bound drills (e.g. SQLMap against a hosted target) are still graded locally — e.g. by checking that the user produced a specific output file.
- Drills must **respect the WebVM limits**: no raw sockets, no kernel modules, no live capture interfaces. See `docs/content/16-webvm-browser-linux.md` in the main app repo for the full fitness table.

## Curriculum mapping

The full content ↔ drill mapping lives in `docs/content/CURRICULUM-MAP.md` in the `ceh-prep` app repo.

| Day | Theme | Drill count (current) |
|-----|-------|-----------------------|
| 01 | Foundations & Lab Setup | 1 (`01-grep-the-flag`) |
| 02 | Footprinting & recon | 0 |
| 03 | Scanning networks | 0 |
| 04 | Enumeration | 0 |
| 05 | Vulnerability analysis | 0 |
| 06 | System hacking | 0 |
| 07 | Malware · sniffing | 0 *(some not fittable in WebVM)* |
| 08 | Social eng · DoS · session | 0 |
| 09 | Web servers · web apps | 0 |
| 10 | SQL injection | 0 |
| 11 | Wireless · mobile · IoT | — *(not fittable in WebVM — VirtualBox path)* |
| 12 | Cloud computing | 0 |
| 13 | Cryptography | 0 |
| 14 | Exam simulator review | 0 |
