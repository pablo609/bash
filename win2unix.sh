#!/usr/bin/bash

user_input=$1

if [ ! -f $user_input ]
then
    echo "Wrong file name!"
fi

cat $user_input | sed 's/\r//' > "unix_$user_input"
