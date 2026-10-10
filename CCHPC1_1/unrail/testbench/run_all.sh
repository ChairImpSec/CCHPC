#!/bin/bash
# Runs the testbenches for all AES S-box examples in normal and duality mode
cd /mnt/a/ImpSec/unrail
for f in examples/AES_sboxes/paper_designs/*.unrail examples/AES_sboxes/NIST_designs/*.unrail; do
  inverse=0
  case "$f" in *-inv-*) inverse=1;; esac
  for flags in "" "--duality"; do
    ORDERS="1 2" bash testbench/run_tb.sh "$f" $inverse $flags &
  done
  wait
done
