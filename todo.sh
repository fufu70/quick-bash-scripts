#!/bin/bash
# Finds and Counts all the instances of TODO

if [ -z "$1" ]; then
    echo "Please provide a parameter for the folder or directory: todo.sh directory/"
else
    grep -Rw $1 -e 'TODO' | wc -l

    echo -n "Would you like to view all TODO statements? [y/N]: "

    read CONTINUE
    if [ "$CONTINUE" == "y" ]; then
        grep -Rw -n $1 -e 'TODO'
    fi
fi