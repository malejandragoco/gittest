#!/bin/bash

Maestro=$1
compilar="cd Documents/ && make"
correresclavo="cd Documents/ && ./SerialENB"
corrermaestro="sudo ./SerialMNB"

if [ $1 -eq 1 ] 
then
	echo "EL MAESTRO ES EL 1"
	scp /home/tg1628/gittest/SerialMNB.c pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/M/Makefile pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi5@192.168.2.115:~/Documents/

	parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${compilar}"
	
	#parallel --tag --nonall -S 4/pi2@192.168.2.112 "${correresclavo}"

	#ssh pi1@192.168.2.111 "${corrermaestro}"

	exit 0
else
	echo "VERIFIQUE LA CONEXION."
fi

if [ $1 -eq 2 ] 
then
	echo "EL MAESTRO ES EL 2"
	scp /home/tg1628/gittest/SerialMNB.c pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/M/Makefile pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi5@192.168.2.115:~/Documents/

	parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${compilar}"

	#parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${correresclavo}"

	#ssh pi2@192.168.2.112 "${corrermaestro}"

	exit 0
else
	echo "VERIFIQUE LA CONEXION."
fi

if [ $1 -eq 3 ] 
then
	echo "EL MAESTRO ES EL 3"
	scp /home/tg1628/gittest/SerialMNB.c pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/M/Makefile pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi5@192.168.2.115:~/Documents/

	parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${compilar}"

	#parallel --tag --nonall -S 4/pi2@192.168.2.112,4/pi1@192.168.2.111,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${correresclavo}"

	#ssh pi3@192.168.2.113 "${corrermaestro}"

	exit 0
else
	echo "VERIFIQUE LA CONEXION."
fi

if [ $1 -eq 4 ] 
then
	echo "EL MAESTRO ES EL 4"
	scp /home/tg1628/gittest/SerialMNB.c pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/M/Makefile pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi5@192.168.2.115:~/Documents/

	parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${compilar}"

	#parallel --tag --nonall -S 4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi1@192.168.2.111,4/pi5@192.168.2.115 "${correresclavo}"

	#ssh pi4@192.168.2.114 "${corrermaestro}"
	
	exit 0
else
	echo "VERIFIQUE LA CONEXION."
fi

if [ $1 -eq 5 ] 
then
	echo "EL MAESTRO ES EL 5"
	scp /home/tg1628/gittest/SerialMNB.c pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/SerialENB.c pi1@192.168.2.111:~/Documents/
	scp /home/tg1628/gittest/M/Makefile pi5@192.168.2.115:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi2@192.168.2.112:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi3@192.168.2.113:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi4@192.168.2.114:~/Documents/
	scp /home/tg1628/gittest/E/Makefile pi1@192.168.2.111:~/Documents/
	
	parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${compilar}"

	#parallel --tag --nonall -S 4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi1@192.168.2.111 "${correresclavo}"

	#ssh pi5@192.168.2.115 "${corrermaestro}"
	
	exit 0
else
	echo "VERIFIQUE LA CONEXION."
fi


