#!/bin/bash

if [ $# -ne 1 ]; then

   echo "Usage: $0 <file>"
   exit 1

fi

counter=1

while read line

do
  
  echo "Row # ${counter}: ${line}"
  ((counter++))

done < "$1"
