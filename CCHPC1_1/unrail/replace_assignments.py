import argparse
import os
import re

parser = argparse.ArgumentParser()
parser.add_argument("input_file", type=str, help="The input file to replace the assignments in")
parser.add_argument("output_file", type=str, help="The output file to write the replaced assignments to")
parser.add_argument("--overwrite", "-o", action="store_true", default=False, help="Overwrite if the output file already exists")
args = parser.parse_args()

if not os.path.exists(args.input_file) or not os.path.isfile(args.input_file):
    print(f"Input file {args.input_file} does not exist")
    exit(1)

if os.path.exists(args.output_file) and os.path.isdir(args.output_file):
    print(f"Output file {args.output_file} is a folder")
    exit(1)

if not args.overwrite and os.path.exists(args.output_file):
    print(f"Output file {args.output_file} already exists")
    exit(1)

if args.input_file == args.output_file:
    print("Input and output files cannot be the same")
    exit(1)

assignments: dict[str, str] = {}

def get_from_wire(from_wire: str) -> str:
    global assignments
    if from_wire in assignments:
        return get_from_wire(assignments[from_wire])
    return from_wire

with open(args.input_file, "r") as f:
    for line in f:
        match = re.match(r"^ *(\w[\w\d_\-\[\]]*) *= *(\w[\w\d_\-\[\]]*) *$", line)
        if not match:
            continue

        wire_to = match.group(1)
        wire_from = match.group(2)

        assignments[wire_to] = get_from_wire(wire_from)

with open(args.input_file, "r") as f:
    with open(args.output_file, "w") as f_out:
        for line in f:
            if re.match(r"^ *(\w[\w\d_\-\[\]]*) *= *(\w[\w\d_\-\[\]]*) *$", line):
                continue

            match = re.match(r"^ *(\w[\w\d_\-\[\]]*) *= *(\w[\w\d_\-\[\]]*)? *([\^&|~]{1,2}) *(\w[\w\d_\-\[\]]*) *$", line)
            if not match:
                f_out.write(line)
                continue

            wire_to = match.group(1).replace("[", "").replace("]", "")
            wire_from = None if match.group(2) is None else match.group(2).replace("[", "").replace("]", "")
            operator = match.group(3)
            wire_from_2 = match.group(4).replace("[", "").replace("]", "")

            wire_to = assignments.get(wire_to, wire_to)
            wire_from = assignments.get(wire_from, wire_from)
            wire_from_2 = assignments.get(wire_from_2, wire_from_2)

            f_out.write(f"{wire_to} ={" " + wire_from if wire_from is not None else ""} {operator} {wire_from_2}\n")