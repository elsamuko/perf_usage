#!/usr/bin/env bash

EXPECTED_OPS=37
CPU_EVENT="fp_ret_sse_avx_ops.all"

# enable perf tracing events
echo 0 | sudo tee /proc/sys/kernel/perf_event_paranoid > /dev/null

# compile programm with floating point operations
g++ floating.cpp -o floating

# run perf
perf stat -e "$CPU_EVENT" -o out.log ./floating "$EXPECTED_OPS" 1> /dev/null

# grep
COUNTED_OPS=$(grep "$CPU_EVENT" < out.log | awk '{print $1}')


if [ "$COUNTED_OPS" != "$EXPECTED_OPS" ]; then
    echo "Counted only $COUNTED_OPS/$EXPECTED_OPS fp ops, are you in a virtual machine?"
    exit 1
else
    echo "Counted $COUNTED_OPS/$EXPECTED_OPS fp ops, you run probably on real hardware."
fi
