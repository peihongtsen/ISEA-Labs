#!/bin/bash
LOGFILE="/var/log/apache2/access.log"
REGEX='^([0-9A-Fa-f:.]+) .* \[([^]]+)\] "([A-Z]+) ([^ ]+) HTTP/[0-9.]+" ([0-9]{3}) ([0-9]+|-)'
echo "FAILED REQUESTS:"
printf "%-15s | %-26s | %-6s | %-25s | %-6s\n" "IP" "Date/Time" "Method" "URL" "Status"
while IFS= read -r line; do
  if [[ $line =~ $REGEX ]]; then
    status="${BASH_REMATCH[5]}"
    if (( status >= 400 )); then
      printf "%-15s | %-26s | %-6s | %-25s | %-6s\n" "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[4]}" "$status"
    fi
  fi
done < "$LOGFILE"
