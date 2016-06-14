#!/bin/bash

file=$1

if [ ! -f "$file" ]
then
	echo "Wrong file!"
	exit -1
fi

current_line=`cat $file | wc -l`

until [ $current_line -eq 0 ]
do
	cat $file | sed -n "$current_line p"
	current_line=$(($current_line-1))
done
