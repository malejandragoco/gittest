#!/bin/bash
#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.


#Este script verifica si las raspberrys y el pc esten conectados a la red. 


Raspberrys="192.168.2.100 192.168.2.111 192.168.2.112 192.168.2.113 192.168.2.114 192.168.2.115"

while true;
do 
	for Rpis in ${Raspberrys} ; do
		ping -c1 ${Rpis} #-c1 manda un solo ping
		if [ $? -eq 0 ]
		then
			echo "El pc y las Rpis están listas para trabajar."
		
		else
			echo "VERIFIQUE LA CONEXION."
		fi
	done
	exit 0
done





