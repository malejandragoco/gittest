#!/bin/bash

import os
import sys

script2000="convert ~/Documents/protocolo2.jpg -quality 60 ~/Documents/protocolo2.jp2"

Borrar="rm -R "~/Documents/protocolo2.jpg""
Borrar2="rm -R "~/Documents/protocolo2.jp2""

echo "Iniciando compresion."
parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${script2000}"

echo "Iniciando envio."
scp pi1@192.168.2.111:~/Documents/protocolo2.jp2  /home/tg1628/Documentos/Rasp1/ 
scp pi2@192.168.2.112:~/Documents/protocolo2.jp2  /home/tg1628/Documentos/Rasp2/ 
scp pi3@192.168.2.113:~/Documents/protocolo2.jp2  /home/tg1628/Documentos/Rasp3/ 
scp pi4@192.168.2.114:~/Documents/protocolo2.jp2  /home/tg1628/Documentos/Rasp4/ 
scp pi5@192.168.2.115:~/Documents/protocolo2.jp2  /home/tg1628/Documentos/Rasp5/

#echo "Iniciando borrado de archivo en las raspberrys."
#parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${Borrar}"

#parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${Borrar2}"

#echo "Se ha borrado la imagen de cada una de las raspberrys."

convert ~/Documentos/Rasp1/protocolo2.jp2 ~/Documentos/Rasp2/protocolo2.jp2 ~/Documentos/Rasp3/protocolo2.jp2 ~/Documentos/Rasp4/protocolo2.jp2 ~/Documentos/Rasp5/protocolo2.jp2 +append ~/Documentos/mosaicos/protocolo2.jp2

echo "Generando mosaico.."

eog ~/Documentos/mosaicos/protocolo2.jp2
