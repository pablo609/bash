#!/bin/bash

file=$1

if ! [ -f "$file" -a -r "$file" ]
then
    echo "File is not readable!"
fi

oldIFS=$IFS
IFS=$'\n'
for line in `cat $file`
do
    IFS=$oldIFS
    wordcounter=0
    for word in $line
    do
        wordcounter=`expr $wordcounter + 1`
        if [ `expr $wordcounter % 2` -eq 1 ]
        then
            printf "$word "
        fi
    done
    printf "\n"
    IFS=$'\n'
done
IFS=$oldIFS
