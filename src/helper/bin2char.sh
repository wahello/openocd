#!/bin/sh

[ $# != 0 ] && {
    echo "Usage: $0"
    echo
    echo "Read binary data from standard input and write it as a comma separated"
    echo "list of hexadecimal byte values to standard ouput. The output is usable"
    echo "as a C array initializer. It is terminated with a comma so it can be"
    echo "continued e.g. for zero termination."
    exit 1
}

echo "/* Autogenerated with $0 */"
od -v -A n -t x1 | sed 's/ *\(..\) */0x\1,/g'