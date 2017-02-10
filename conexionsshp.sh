#!/bin/bash

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.


#En este script se realiza la conexion ssh, toma la foto y la guarda en la raspberry-pc. PARALELA
#Hay que tener en cuenta que para correr este codigo se debe escribir el argumento


NombreFoto=$1
scriptntp="ntpq -p"
scriptfoto="raspistill -w 800 -h 600 -hf -vf -ISO 800 -t 1000 -o $1.jpg"

parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${scriptntp}"

parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${scriptfoto}"  


scp pi1@192.168.2.111:~/$1.jpg  /home/tg1628/Documentos/Rasp1/ 
scp pi2@192.168.2.112:~/$1.jpg  /home/tg1628/Documentos/Rasp2/ 
scp pi3@192.168.2.113:~/$1.jpg  /home/tg1628/Documentos/Rasp3/ 
scp pi4@192.168.2.114:~/$1.jpg  /home/tg1628/Documentos/Rasp4/ 
scp pi5@192.168.2.115:~/$1.jpg  /home/tg1628/Documentos/Rasp5/
