#!/bin/sh

doindent()
{
    j=0;
    while [ "$j" -lt "$1" ]; do
      echo -en "  " 
      j=`expr $j + 1`
    done
}

traverse() 
{
  indent="$2"
  ls "$1" | while read i
  do
    doindent $2
    if [ -d "$1/$i" ]; then
      echo "Directory: $1/$i"
      traverse "$1/$i" `expr $2 + 1`
    else 
      echo "File: $1/$i"
    fi
  done
}

traverse . 0
