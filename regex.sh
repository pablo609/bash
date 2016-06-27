#!/bin/bash

file=$1

if ! [ -r "$file" ]
then
	echo "Cannot read the file!"
    exit 0
fi

cat $file | sed 's/ /\n/g' > temp.txt

cat temp.txt | sort > temp2.txt

currentWord=""
firstWord=1
for word in `cat temp2.txt`
do
    if [ "$currentWord" = "$word" ]
    then
        wordCount=`expr $wordCount + 1`
    else
        if [ $firstWord -ne 1 ]
        then
            echo "$currentWord - $wordCount"
        fi
        currentWord=$word
        wordCount=1
        firstWord=0
    fi
done