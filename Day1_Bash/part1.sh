#!/bin/bash

FILE="input.txt"
up=`grep -o "(" $FILE | wc -l`
down=`grep -o ")" $FILE | wc -l`

floor=$(($up - $down))

echo $floor