#!/bin/bash

NombreFoto=$1

while true; do
todate=$(date +%H%M%S%N )
#echo $todate
if [ $todate -ge 102100900000000 ]
then
	#echo "yes"
	raspistill -w 800 -h 600 -ISO 800 -n -t 125 -q 40 -ex off -ss 5000 -a 4 -a "%s" -o $1.jpg
	break
#else
	#echo "no"
fi
done


