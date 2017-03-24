#!/usr/bin/python

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.

import os
import sys

argumento = sys.argv[1]
Raspberrys = ["192.168.2.100", "192.168.2.111", "192.168.2.112", "192.168.2.113", "192.168.2.114", "192.168.2.115"]
Contador = 0

for Rpis in Raspberrys:
	Resultado = os.system("ping -c1 "+Rpis+"")
	if Resultado == 0:
		Contador = Contador+1
		print Contador

if Contador == 6:
	print "EL PC Y LAS RASPBERRYS ESTAN LISTAS PARA TRABAJAR"
	os.system("python conexionsshp.py")
	os.system("scp /home/tg1628/gittest/PruebaFecha.py pi1@192.168.2.111:~/")
	os.system("scp /home/tg1628/gittest/PruebaFecha.py pi2@192.168.2.112:~/")
	os.system("scp /home/tg1628/gittest/PruebaFecha.py pi3@192.168.2.113:~/")
	os.system("scp /home/tg1628/gittest/PruebaFecha.py pi4@192.168.2.114:~/")
	os.system("scp /home/tg1628/gittest/PruebaFecha.py pi5@192.168.2.115:~/")
	os.system("parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 python PruebaFecha.py "+argumento+"")
	#os.system("parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 convert ~/"+argumento+".jpg -quality 60 ~/"+argumento+"2000.jp2")
	os.system("ssh pi1@192.168.2.111 convert /home/pi1/"+argumento+".jpg -quality 60 /home/pi1/"+argumento+"2000.jp2")
	os.system("ssh pi2@192.168.2.112 convert /home/pi2/"+argumento+".jpg -quality 60 /home/pi2/"+argumento+"2000.jp2")
	os.system("ssh pi3@192.168.2.113 convert /home/pi3/"+argumento+".jpg -quality 60 /home/pi3/"+argumento+"2000.jp2")
	os.system("ssh pi4@192.168.2.114 convert /home/pi4/"+argumento+".jpg -quality 60 /home/pi4/"+argumento+"2000.jp2")
	os.system("ssh pi5@192.168.2.115 convert /home/pi5/"+argumento+".jpg -quality 60 /home/pi5/"+argumento+"2000.jp2")
	os.system("scp pi1@192.168.2.111:~/"+argumento+"2000.jp2  /home/tg1628/Documentos/Rasp1/")
	os.system("scp pi2@192.168.2.112:~/"+argumento+"2000.jp2  /home/tg1628/Documentos/Rasp2/")
	os.system("scp pi3@192.168.2.113:~/"+argumento+"2000.jp2  /home/tg1628/Documentos/Rasp3/")
	os.system("scp pi4@192.168.2.114:~/"+argumento+"2000.jp2  /home/tg1628/Documentos/Rasp4/")
	os.system("scp pi5@192.168.2.115:~/"+argumento+"2000.jp2  /home/tg1628/Documentos/Rasp5/")
	os.system("python BorrarT.py "+argumento+"")
	os.system("python BorrarT2.py "+argumento+"")
	print "Se ha borrado la imagen de cada una de las raspberrys."
	os.system("python DiaFoto.py "+argumento+"")
	os.system("python Verimagenes.py "+argumento+"")
	os.system("python ApagadoT.py "+argumento+"")
	exit (0)
else:
	print "VERIFIQUE LA CONEXION."
	exit (1)
