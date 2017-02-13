#!/bin/bash

#El siguiente script es el encargado de llamar los demas procesos.

NombreFoto=$1
Counter=0;
Raspberrys="192.168.2.100 192.168.2.111 192.168.2.112 192.168.2.113 192.168.2.114 192.168.2.115"

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
			bash ./BorrarT.sh $1
			echo "Se ha borrado la imagen de cada una de las raspberrys."
			bash ./ApagadoT.sh
			exit 0
		else
			echo "VERIFIQUE LA CONEXION."
fi





