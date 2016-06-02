#!/usr/bin/bash
# This script finds duplicated lines from a given list
# INPUT
# 1 - file with lines
# OUTPUT
# 1 - prints the duplicated lines with the number of dupicates found

list=$(cat $1)
result=""

if [ -e tmp_find_duplicated_lines.txt ]
then
    rm tmp_find_duplicated_lines.txt
fi

for line in $list
do
    num_of_dup=0
    
    for line_to_compare in $list
    do
        if [ "$line" = "$line_to_compare" ]
        then
            num_of_dup=$((num_of_dup + 1))
        fi
    done
    
    if [ "$num_of_dup" -gt 1 ]
    then
        echo $line $num_of_dup >> tmp_find_duplicated_lines.txt
    fi
    
done

if [ -e tmp_find_duplicated_lines.txt ]
then
    cat tmp_find_duplicated_lines.txt | sort | uniq
    rm tmp_find_duplicated_lines.txt
fi
