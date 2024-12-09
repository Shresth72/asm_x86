#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ]; then
    echo "Usage: $0 <linker> <path-to-asm-file>"
    exit 1
fi

linker="$1"
file_path="$2"
file_dir=$(dirname "$file_path")
file_name=$(basename -- "$file_path" .asm)

# Assemble the .asm file using NASM
nasm -f elf32 "$file_path" -o "$file_dir/$file_name.o"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

# Link the object file based on the linker specified
if [ "$linker" = "ld" ]; then
    ld -m elf_i386 "$file_dir/$file_name.o" -o "$file_dir/$file_name"
elif [ "$linker" = "gcc" ]; then
    gcc -m32 "$file_dir/$file_name.o" -o "$file_dir/$file_name"
else
    echo "Unknown linker: $linker. Use 'gcc' or 'ld'."
    exit 1
fi

if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

# Run
"$file_dir/$file_name"
run_status=$?

echo "exit status: $run_status"

# cleanup
rm -f "$file_dir/$file_name.o" "$file_dir/$file_name"
exit 0
