#!/bin/bash

if [ "$1" = "" ]; then
    echo "Usage: $0 <path-to-asm-file>"
    exit 1
fi

file_path="$1"
file_dir=$(dirname "$file_path")
file_name=$(basename -- "$file_path" .asm)

# Assemble the .asm file using NASM
nasm -f elf32 "$file_path" -o "$file_dir/$file_name.o"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

# Link the object file
ld -m elf_i386 "$file_dir/$file_name.o" -o "$file_dir/$file_name"
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

"$file_dir/$file_name"
run_status=$?

echo "status: $run_status"

# cleanup
rm -f "$file_dir/$file_name.o" "$file_dir/$file_name"
exit 0
