#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# If the language is not English, free will output localized text and parsing fails
LANG=en_US.UTF-8

THRESHOLD=2000 # 1000 -> 1gib
INTERVAL=30
POPUP_DELAY=999999

# sleep some time so the shell starts properly
sleep 5

while :; do
  available=$(free -mw | awk '/^Mem:/{print $8}')
  if [ $available -lt $THRESHOLD ]; then
    title="Low memory! $available MB available"
    #        message=$(top -bo %MEM -n 1 | grep -A 3 PID | awk '{print $(NF - 6) " \t" $(NF)}')
    #        notify-send -u critical "$title" "$message" -t $POPUP_DELAY
    notify-send "$title" 'Жопа с памятью!! проверь!! скрипт запущен здесь  /home/miroshnykov/Sites/mysql8_docker/ubuntu-low-mem-popup.sh'

  fi
  sleep $INTERVAL
done
