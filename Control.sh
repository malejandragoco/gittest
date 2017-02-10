#!/bin/bash

#El siguiente script es el encargado de llamar los demas procesos.

NombreFoto=$1

#Primero se verifica si las tarjetas están conectadas a la red local junto con el pc.
sh ./ActividadRpis.sh

#Luego se verifica el retraso del servidor NTP y se captura la foto.
sh ./conexionsshp.sh $1



