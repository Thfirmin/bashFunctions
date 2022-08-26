#!/bin/bash

let LEN=$1
STR=$2

function middle
{
	STR_LEN=${#STR}
	
	for ((i = 0; i < $LEN; i++)); do
		if [[ $i == $(($((LEN / 2)) - $((STR_LEN / 2)))) ]]; then
			echo -n $STR
		else
			echo -n " "
		fi
	done
	echo ""
}

for ((i = 0; i < $LEN; i++)); do
	if [[ $i == $((LEN / 2)) ]]; then
		echo -n "+"
	else
		echo -n "-"
	fi
done
echo ""
middle
