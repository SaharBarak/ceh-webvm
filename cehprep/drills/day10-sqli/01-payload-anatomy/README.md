# Day 10 · SQL Injection — Payload Anatomy

You can't really "do" SQLi without a vulnerable backend, but the **payload
classes** are exam-critical. This drill quizzes payload construction without
needing a target.

## The challenge

`questions.txt` has 6 fragments. For each, write the SQLi payload that
*continues* the fragment to bypass authentication, dump data, or detect
the injection. Put one payload per line in `answers.txt`, matching the
order of questions.

```
drill check
```

## Tip

The grader normalizes whitespace and accepts common semantic equivalents
(e.g. `' OR 1=1 --` ≈ `' OR '1'='1' --`). Quotes, comment markers, and
truthy expressions matter. Specific column names and table names do not.

Use `cat questions.txt` to begin.
