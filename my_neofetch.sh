#!/bin/bash

get_kernel_version() {
    echo "Kernel: $(uname -r)"
}

get_uptime() {
    echo "Uptime: $(uptime)"
}

get_memory_usage() {
    free -m | grep "Mem:" | awk '{printf "Memory: %dMiB / %dMiB\n", $3, $2}'
}

echo $(whoami)@$(hostname)
get_kernel_version
get_uptime
echo Shell: $($SHELL --version | head -n1)
echo CPU: $(cat /proc/cpuinfo | grep "model name" | uniq | cut -d":" -f2 | cut -c2-)
get_memory_usage
