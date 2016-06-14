#!/bin/bash

file=$1

if ! [ -f "$file" -a -r "$file" ]
then
    echo "File is not readable!"
fi

longest_line_lenght=0
longest_line=""

oldIFS=$IFS
IFS=$'\n'
for line in `cat $file`
do
    line_lenght=`echo $line | wc -c`
    if [ $longest_line_lenght -lt $line_lenght ]
    then
        longest_line_lenght=$line_lenght
        longest_line=$line
    fi
done
IFS=$oldIFS

echo "$longest_line_lenght - $longest_line"
