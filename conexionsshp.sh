#!/bin/bash

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.


#En este script se realiza la conexion ssh, toma la foto y la guarda en la raspberry-pc. PARALELA
#Hay que tener en cuenta que para correr este codigo se debe escribir el argumento -hf-awb sun


NombreFoto=$1
scriptntp="ntpq -p"
scriptfoto="raspistill -w 800 -h 600  -ISO 800 -n -t 125 -q 40 -ex off -ss 5000 -a 4 -a "%s" -o $1.jpg"

#-w es el ancho de la imagen
#-h es el alto de la imagen
#-hf giro horizontal
#-ISO configurar el ISO de captura
#-t tiempo en ms antes de tomar la foto (si no se especifica son 5 segundos)
#-q calidad de la imagen
#-ex modo de exposicion mejor apagado
#-awb balance de blanco
#-ss velocidad de obturacion en microsegundos
#-o nombre del archivo donde se va a guardar
#-a para anotar texto -a 4 habilitar formato de tiempo
#-ts remplaza %d pero en segundos

parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${scriptntp}"

#parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${scriptfoto}"  

#scp pi1@192.168.2.111:~/$1.jpg  /home/tg1628/Documentos/Rasp1/ 
#scp pi2@192.168.2.112:~/$1.jpg  /home/tg1628/Documentos/Rasp2/ 
#scp pi3@192.168.2.113:~/$1.jpg  /home/tg1628/Documentos/Rasp3/ 
#scp pi4@192.168.2.114:~/$1.jpg  /home/tg1628/Documentos/Rasp4/ 
#scp pi5@192.168.2.115:~/$1.jpg  /home/tg1628/Documentos/Rasp5/
