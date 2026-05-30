#!/bin/bash

if [ $# -ne 2 ]; then

   echo "Usage: $0 <directory> <name_direcotry>"

   exit 1

fi

if [ ! -d "$1" ]; then

  echo "Error: first parameter must be an existing directory"

  exit 1

fi

if [ -e "$2" ]; then

   echo "Error: archive already  exist"
   exit 1

fi

tar -czf "$2" "$1"

echo "Archive created successfully."
