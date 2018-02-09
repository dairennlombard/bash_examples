#!/bin/bash
# Print every other line from a file until the current line is the last line of the file

let 'CURRENTLINENUMBER = 1'
LINECOUNT=$(wc -l $1 | awk '{print $1}')
until [ $CURRENTLINENUMBER -eq $LINECOUNT ]; do 
  # printf "$CURRENTLINENUMBER\t"
  awk "FNR == $CURRENTLINENUMBER {print}" $1
  CURRENTLINENUMBER=$((CURRENTLINENUMBER+2))
done
