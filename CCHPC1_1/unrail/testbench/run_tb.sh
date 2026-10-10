#!/bin/bash
# usage: run_tb.sh <unrail file> <inverse 0/1> [unrail flags...]
cd /mnt/a/ImpSec/unrail
file=$1; inverse=$2; shift 2
out=$(mktemp -d)
~/.pixi/bin/pixi run python main.py -f "$file" -o "$out" "$@" > "$out/log.txt" 2>&1 || { echo "UNRAIL FAILED: $file $*"; tail -n 20 "$out/log.txt"; exit 1; }
v=$(ls "$out"/*/optimized.v)
dr=$(grep -oP 'dual-rail output gadgets\): \K\d+' "$v")
drtsr=$(grep -oP 'dual-rail to single-rail gadgets\): \K\d+' "$v")
f2b=$(grep -q 'F2B Algorithm: Disabled' "$v" && echo 1 || echo 0)
b2f=$(grep -q 'B2F Algorithm: Disabled' "$v" && echo 1 || echo 0)
if grep -q 'Duality: Enabled' "$v"; then tb=testbench/aes_sbox_duality_tb.v; top=sbox_duality_tb; else tb=testbench/aes_sbox_tb.v; top=sbox_tb; fi
for so in ${ORDERS:-1 2 3}; do
  res=$(~/.pixi/bin/pixi exec -s iverilog -- bash -c "iverilog -g2005 -Wall -Wno-timescale -s $top -P$top.security_order=$so -P$top.random_bit_count_dr=$dr -P$top.random_bit_count_drtsr=$drtsr -P$top.disable_f2b=$f2b -P$top.disable_b2f=$b2f -P$top.inverse=$inverse -o $out/sim testbench/tb_modules.v $tb $v && vvp -n $out/sim" 2>&1)
  echo "$(basename "$file") [$*] dr=$dr drtsr=$drtsr so=$so: $(echo "$res" | grep -E 'End Testbench|error|warning|FAILED' | head -n 4 | tr '\n' ' ')"
done
