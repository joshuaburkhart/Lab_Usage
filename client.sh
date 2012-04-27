#!/bin/bash
#
#Usage: ./client.sh <server hostname> <server listening port>
#Example: ./client.sh molluska.cs.uoregon.edu 12345

while true
do
	DATE=$(date)
	NAME=$(hostname)
	PS_OUT=$(ps -dcfv | tr '\n' '|')
	ROW_DATA=$(echo "$DATE%$NAME%$PS_OUT" | tr -s ' ')
	row_parser.rb "$ROW_DATA" | nc $1 $2
	sleep 60
done
