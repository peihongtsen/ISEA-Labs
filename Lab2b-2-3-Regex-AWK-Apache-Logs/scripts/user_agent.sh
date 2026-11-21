#!/bin/bash
LOG="/var/log/apache2/access.log"
R='^([0-9A-Fa-f:.]+) .* \[([^]]+)\] "([A-Z]+) ([^ ]+) HTTP/[0-9.]+" ([0-9]{3}) ([0-9]+|-) "([^"]*)" "([^"]*)"'
while IFS= read -r line; do
  if [[ $line =~ $R ]]; then
    ip=${BASH_REMATCH[1]}
    s=${BASH_REMATCH[5]}
    ua=${BASH_REMATCH[8]}
    echo "$ip | $s | $ua"
  fi
done < "$LOG"
