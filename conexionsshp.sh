#!/bin/bash
#En este script se realiza la conexion ssh, toma la foto y la guarda en la raspberry-pc. PARALELA


#parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 sudo halt


NombreFoto="prueba1"

parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 date +"%H:%M-%S-%3N-%N"

parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 raspistill -hf -vf -ISO 800 -t 1000 -o prueba1.jpg 


scp pi1@192.168.2.111:~/$NombreFoto.jpg  /home/tg1628/Documentos/Rasp1/ 
scp pi2@192.168.2.112:~/$NombreFoto.jpg  /home/tg1628/Documentos/Rasp2/ 
scp pi3@192.168.2.113:~/$NombreFoto.jpg  /home/tg1628/Documentos/Rasp3/ 
scp pi4@192.168.2.114:~/$NombreFoto.jpg  /home/tg1628/Documentos/Rasp4/ 
scp pi5@192.168.2.115:~/$NombreFoto.jpg  /home/tg1628/Documentos/Rasp5/
