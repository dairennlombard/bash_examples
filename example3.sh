#!/bin/bash
# Only print odd line numbers from a file.

FILE=$1

let 'CURRENTLINENUMBER = 1'
LINECOUNT=$(wc -l $FILE | awk '{print $1}')
until [ $CURRENTLINENUMBER -eq $LINECOUNT ]; do 
  divremainder=$(( $CURRENTLINENUMBER % 2 ))
  if [ "$divremainder" -eq 1 ]; then
    # printf "$CURRENTLINENUMBER\t"
    awk "FNR == $CURRENTLINENUMBER {print}" $1
  fi
  (( CURRENTLINENUMBER++ ))
done
