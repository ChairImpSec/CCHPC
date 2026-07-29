#!/bin/bash

mkdir -p results
rm -r results/*

function with_opts() {
    python main.py -f examples/$1.unrail -o results/$1
}

function without_opts() {
    python main.py -f examples/$1.unrail -o results/$1 --disable-f2b --disable-b2f
}

function for_example() {
    with_opts $1
    without_opts $1
}

for_example BP10
for_example BP12
for_example BPimpr
for_example canright
for_example HB25
for_example JBKK_smallest
for_example TWWH