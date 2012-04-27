#!/bin/bash
#
#Usage: ./server.sh <listening port> <output file>
#Example: ./server.sh 12345 output_data.csv

while true
do
	nc -l $1 >> $2
done
