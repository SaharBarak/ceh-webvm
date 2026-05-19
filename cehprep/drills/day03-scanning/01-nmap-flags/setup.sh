#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
[ -f "$HERE/questions.txt" ] && exit 0

cat > "$HERE/questions.txt" <<'EOF'
1. Stealthy TCP SYN scan, no DNS resolution, against 192.168.1.0/24
2. Full TCP connect scan (no raw sockets needed) of all 65535 ports on <target>
3. Service + version detection plus default NSE scripts against <target>
4. UDP scan of the top 100 ports against <target>
5. OS fingerprint + version detection in one invocation against <target>
6. Aggressive scan (-A) but slow it down to T2 to avoid IDS noise against <target>
7. Read a list of targets from hosts.txt and write XML output to scan.xml
8. Scan only ports 80, 443, and 8080-8090 against <target>, skipping host discovery
EOF

# Reference answers. Multiple equivalent forms accepted by the grader.
# Each line is a `||`-separated set of acceptable command forms.
cat > "$HERE/.answers" <<'EOF'
nmap -sS -n 192.168.1.0/24||nmap -n -sS 192.168.1.0/24
nmap -sT -p- <target>||nmap -p- -sT <target>||nmap -p1-65535 -sT <target>
nmap -sV -sC <target>||nmap -sC -sV <target>||nmap -A <target>
nmap -sU --top-ports 100 <target>||nmap --top-ports 100 -sU <target>
nmap -O -sV <target>||nmap -sV -O <target>||nmap -A <target>
nmap -A -T2 <target>||nmap -T2 -A <target>
nmap -iL hosts.txt -oX scan.xml||nmap -oX scan.xml -iL hosts.txt
nmap -Pn -p 80,443,8080-8090 <target>||nmap -p 80,443,8080-8090 -Pn <target>
EOF
chmod 600 "$HERE/.answers"

cat > "$HERE/answers.txt" <<'EOF'
# One nmap command per line, same order as questions.txt.
# Example for a SYN scan: nmap -sS <target>
EOF
