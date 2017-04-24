#!/bin/sh

time=$(sysctl kern.boottime | awk '{print $5}' | tr -d ,)
echo "<result>$(date -jf %s $time +%F\ %T)</result>"