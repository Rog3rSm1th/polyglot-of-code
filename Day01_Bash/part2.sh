#!/bin/bash

FILE="input.txt"

position=1
floor=0

while read -n1 c; do
    if [ "$c" = "(" ]; then
        floor=$((floor+1))
    else
        floor=$((floor-1))
        if [ "$floor" -le "-1" ]; then
            break
        fi
    fi

    position=$((position+1))
done < $FILE

echo $position