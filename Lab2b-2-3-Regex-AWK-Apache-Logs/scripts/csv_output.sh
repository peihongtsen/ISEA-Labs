#!/bin/bash
LOG="/var/log/apache2/access.log"
R='^([0-9A-Fa-f:.]+) .* \[([^]]+)\] "([A-Z]+) ([^ ]+) HTTP/[0-9.]+" ([0-9]{3}) ([0-9]+|-)'
echo "ip,date_time,method,url,status,bytes"
while IFS= read -r line; do
  if [[ $line =~ $R ]]; then
    ip=${BASH_REMATCH[1]}
    dt=${BASH_REMATCH[2]}
    m=${BASH_REMATCH[3]}
    u=${BASH_REMATCH[4]}
    s=${BASH_REMATCH[5]}
    b=${BASH_REMATCH[6]}
    echo "$ip,$dt,$m,$u,$s,$b"
  fi
done < "$LOG"
