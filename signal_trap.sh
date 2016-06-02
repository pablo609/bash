#!/usr/bin/bash

current_month=`date +"%b"`
current_day=`date +"%d"`
current_hour=`date +"%H"`

for file in `ls -1`
do
    mtime=`ls -l $file | cut -d" " -f7-9`
    month=`echo $mtime | cut -d" " -f1`
    day=`echo $mtime | cut -d" " -f2`
    hour_minute=`echo $mtime | cut -d" " -f3`
    hour=`echo $hour_minute | cut -d":" -f1`

    if [ $current_month = $month ]
    then
        if [ $current_day = $day ]
        then
            if [ `expr $current_hour - $hour` -lt 2 ]
            then
                echo $file $mtime
            fi
        fi
    fi
done
