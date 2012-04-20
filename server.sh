#!/bin/bash
#
#Usage: ./server.sh <listening port>
#Example: ./server.sh 12345

while true
do
	nc -l $1 >> lab_100_data.psv
done
