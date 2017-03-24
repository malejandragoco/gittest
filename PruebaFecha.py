#!/usr/bin/python

import os
import sys

nombreimagen = sys.argv[1]+".jpg" 

flag = 1
hora = 102100900000000
while (flag):


	dia = os.popen("date +%H%M%S%N")
	resultado = int(dia.readline())

	if resultado >= hora:
		os.system("raspistill -w 800 -h 600 -ISO 800 -n -t 125 -q 40 -ex off -ss 5000 -a 4 -a %s -o "+nombreimagen+"")

		break 
	


