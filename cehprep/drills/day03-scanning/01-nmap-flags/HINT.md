Useful Nmap reference (CEH-relevant):

  Scan type            -sS  SYN     -sT  TCP-connect    -sU  UDP    -sn  ping-sweep
  Service / OS         -sV  version -O  OS detect      -sC  default scripts
  Aggressive (combo)   -A   ⇔  -sV -O -sC --traceroute
  Timing               -T0 paranoid → -T5 insane (default T3, use T2 for stealth)
  Targets              -iL <file>   --exclude <ip>     <subnet/CIDR>
  Ports                -p 22,80     -p-  (all 65535)   --top-ports N
  Discovery            -Pn  skip ping (assume host up)
  Output               -oX / -oN / -oG / -oA <basename>
  Misc                 -n   no DNS  -v   verbose       --reason

The grader normalizes flag order — `nmap -sS -n 1.2.3.0/24` and
`nmap -n -sS 1.2.3.0/24` are both accepted.
