#!/bin/bash

#El siguiente script es el encargado de llamar los demas procesos.

NombreFoto=$1
Counter=0;
Raspberrys="192.168.2.100 192.168.2.111 192.168.2.112 192.168.2.113 192.168.2.114 192.168.2.115"
scriptFoto="bash PruebaFecha.sh $1"

#Primero se verifica si las tarjetas están conectadas a la red local junto con el pc.
for Rpis in ${Raspberrys} ; do
	ping -c1 ${Rpis} #-c1 manda un solo ping
	if [ $? -eq 0 ] #$?Da el estatus de salida del comando anterior
		then
			
			Counter=$((Counter+1))
			
	fi
done

#Luego se verifica el retraso del servidor NTP y se captura la foto.

if [ $Counter -eq 6 ] #$?Da el estatus de salida del comando anterior
		then
			echo "EL PC Y LAS RASPBERRYS ESTÁN LISTAS PARA TRABAJAR."
			bash ./conexionsshp.sh $1
			scp /home/tg1628/gittest/PruebaFecha.sh pi1@192.168.2.111:~/
			scp /home/tg1628/gittest/PruebaFecha.sh pi2@192.168.2.112:~/
			scp /home/tg1628/gittest/PruebaFecha.sh pi3@192.168.2.113:~/
			scp /home/tg1628/gittest/PruebaFecha.sh pi4@192.168.2.114:~/
			scp /home/tg1628/gittest/PruebaFecha.sh pi5@192.168.2.115:~/
			parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${scriptFoto}"
			scp pi1@192.168.2.111:~/$1.jpg  /home/tg1628/Documentos/Rasp1/ 
			scp pi2@192.168.2.112:~/$1.jpg  /home/tg1628/Documentos/Rasp2/ 
			scp pi3@192.168.2.113:~/$1.jpg  /home/tg1628/Documentos/Rasp3/ 
			scp pi4@192.168.2.114:~/$1.jpg  /home/tg1628/Documentos/Rasp4/ 
			scp pi5@192.168.2.115:~/$1.jpg  /home/tg1628/Documentos/Rasp5/
			bash ./BorrarT.sh $1
			echo "Se ha borrado la imagen de cada una de las raspberrys."
			bash ./DiaFoto.sh $1
			bash ./Verimagenes.sh $1
			bash ./ApagadoT.sh
			exit 0
		else
			echo "VERIFIQUE LA CONEXION."
fi





