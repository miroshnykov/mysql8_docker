#!/usr/bin/env bash

free -h && sudo sysctl -w vm.drop_caches=3 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches && free -h

available=$(free -mw | awk '/^Mem:/{print $8}')
timestamp=$(date +%s)
title="Clean up memory! available:$available MB time $timestamp"
echo "$title"
#notify-send "$title" 'память очщена'