#!/bin/bash
# Interleve lines from two files until the last line of the longest file.

FILE1=$1
FILE2=$2

function countlinesinfile {
  wc -l $1 | awk '{print $1}'
}

function printlinefromfile {
  awk "FNR == $CURRENTLINENUMBER {print}" $1
}

# Figure out which file is longer so we do not stop printing lines too soon.
LINECOUNTINFILE1=$(countlinesinfile $FILE1)
LINECOUNTINFILE2=$(countlinesinfile $FILE2)
if [ "$LINECOUNTINFILE1" -ge "$LINECOUNTINFILE2" ]; then
  MAXLINES="$LINECOUNTINFILE1"
else
  MAXLINES="$LINECOUNTINFILE2"
fi

# Make line number 1 the first line we print.
let 'CURRENTLINENUMBER = 1'

until [ $CURRENTLINENUMBER -eq $MAXLINES ]; do 
  printlinefromfile $FILE1
  printlinefromfile $FILE2
  # Once we have printed the current line number, increment the line number counter so we print the next line from both files
  (( CURRENTLINENUMBER++ ))
done
