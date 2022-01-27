#!/usr/bin/env bash

free -h && sudo sysctl -w vm.drop_caches=3 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h

available=$(free -mw | awk '/^Mem:/{print $8}')
title="Low memory! $available MB available"
echo "$title"
#notify-send "$title" 'память очщена'