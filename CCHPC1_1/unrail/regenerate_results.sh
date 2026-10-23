#!/bin/bash

mkdir -p results
rm -r results/*

function with_opts() {
    python main.py -f examples/$1.unrail -o results/$1
}

function without_opts() {
    python main.py -f examples/$1.unrail -o results/$1 --disable-f2b --disable-b2f
}

function with_duality_and_opts() {
    python main.py -f examples/$1.unrail -o results/$1 --duality
}

function with_duality_and_without_opts() {
    python main.py -f examples/$1.unrail -o results/$1 --duality --disable-f2b --disable-b2f
}

function synthesize_latest() {
    run_dir=$(ls -d results/$1/*/ | sort | tail -n 1)
    for security_order in 1 2 3; do
        echo -n "    Security order $security_order: "
        bash synthesis/synth.sh "${run_dir}optimized.v" $security_order | grep "GE$" || echo "Synthesis failed for ${run_dir}"
    done
}

function for_example() {
    echo "  With opts"
    with_opts $1
    synthesize_latest $1
    echo "  Without opts"
    without_opts $1
    synthesize_latest $1
    echo "  With duality and opts"
    with_duality_and_opts $1
    synthesize_latest $1
    echo "  With duality and without opts"
    with_duality_and_without_opts $1
    synthesize_latest $1
}

for file in $(find examples/AES_sboxes -name "*.unrail" | sort); do
    example_path=${file#examples/}
    example_path=${example_path%.unrail}
    echo "$example_path"
    for_example $example_path
done
