#!/bin/bash

while true
do
	DATE=$(date)
	NAME=$(hostname)
	PS_OUT=$(ps -ef | tr '\n' '|')
	ROW_DATA=$(echo "$DATE%$NAME%$PS_OUT" | tr -s ' ')
	row_parser.rb "$ROW_DATA"
	#echo $ROW_DATA
	sleep 60
done
