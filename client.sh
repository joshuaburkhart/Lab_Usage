#!/bin/bash
#
#Usage: ./client.sh <server hostname> <server listening port>
#Example: ./client.sh molluska.cs.uoregon.edu 12345

exit_funct()
{
  echo "Exiting..."
  rm -f $TMP_FILE_1
  rm -f $TMP_FILE_2
  exit 0
}

TMP_FILE_1=$(date +%s | shasum | tr ' -' 'X')
touch $TMP_FILE_1
sleep 1
TMP_FILE_2=$(date +%s | shasum | tr ' -' 'X')
touch $TMP_FILE_2

trap exit_funct SIGINT

while true
do
	DATE=$(date)
	NAME=$(hostname)
	ps -Af | awk '{$5=""; $7=""; print $0}' | tr -s ' ' > $TMP_FILE_1
	DIFF=$(diff $TMP_FILE_1 $TMP_FILE_2 | tr '\n' '|') 
	row_parser.rb "$DATE" "$NAME" "$DIFF" | nc $1 $2
	cat $TMP_FILE_1 > $TMP_FILE_2
	sleep 60
done
