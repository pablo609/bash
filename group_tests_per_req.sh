#!/usr/bin/bash
# This script is used to automatically paste result form Re-use_Finder_Insight to Scenario Outline
# INPUT
# 1 - file with all requirements  (copy and paste it from column B from Re-use_Finder)
# 2 - file with requirements mapped to tests (copy and paste it from columns D and E from Re-use_Finer)
# OUTPUT
# 1 - prints the grouped tests to the screen and tmp_group_tests_per_req.txt in the order of requirements from INPUT1 so you can past it into Scenario Outline.
#     Empty lines are used for requirements for which not test were found

req_list=$(cat $1)
req2test_list=$(cat $2 | sed 's/\t/,/' | sed 's/ /,/')

if [ -e tmp_group_tests_per_req.txt ]
then
    rm tmp_group_tests_per_req.txt
fi

for req in $req_list
do
    echo "Grouping tests for $req"
    printf '"' >> tmp_group_tests_per_req.txt

    first_test=1
    for req2test in $req2test_list
    do
        temp_req=$(echo $req2test | cut -d"," -f1)
        
        if [ $req = $temp_req ]
        then
            temp_test=$(echo $req2test | cut -d"," -f2)
            
            if [ $first_test -eq 1 ]
            then
                printf "$temp_test" >> tmp_group_tests_per_req.txt
                first_test=0
            else
                printf "\n$temp_test" >> tmp_group_tests_per_req.txt
            fi
        fi
    done
    
    printf '"\n' >> tmp_group_tests_per_req.txt
done

if [ -e tmp_group_tests_per_req.txt ]
then
    printf "\nRESULT:\n"
    cat tmp_group_tests_per_req.txt
fi
