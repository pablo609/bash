#!/bin/bash

file=$1

if ! [-r "$file" ]
then
	echo "Cannot read the file!"
fi

