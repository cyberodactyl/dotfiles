#!/bin/bash

IFS=$'\n'
files=($(find . -name '.vimrc*'))
unset IFS

counter=1
for file in ${files[@]}
do
	echo "[$counter] $file"
	((counter++))
done

read choice
cfile=${files[($choice - 1)]}
echo "You have chosen $cfile"
# To be written...
