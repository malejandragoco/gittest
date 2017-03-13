#!/bin/bash

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.

#SIN BM-----------------------------------------------------------------------------------------------
#scriptfoto="raspistill -w 800 -h 600 -hf -ISO 800 -t 1000  -tl 100 -q 60 -ex off -awb sun -ss 30000 -a 4 -a "%s" -o a%04d.jpg"

#ssh pi1@192.168.2.111 "${scriptfoto}" #-l es el loginname

#scp pi1@192.168.2.111:~/a0001.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0004.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0010.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0015.jpg  /home/tg1628/Documentos/PruebaSeg/

#convert ~/Documentos/PruebaSeg/a0001.jpg ~/Documentos/PruebaSeg/a0004.jpg ~/Documentos/PruebaSeg/a0010.jpg ~/Documentos/PruebaSeg/a0015.jpg +append ~/Documentos/PruebaSeg/Ejemplo.jpg

#shotwell ~/Documentos/PruebaSeg/Ejemplo.jpg

#ssh pi1@192.168.2.111 rm -R a0001.jpg 
#ssh pi1@192.168.2.111 rm -R a0004.jpg 
#ssh pi1@192.168.2.111 rm -R a0010.jpg 
#ssh pi1@192.168.2.111 rm -R a0015.jpg 

#SIN BM CON MENOS -----------------------------------------------------------------------------------
#scriptfoto="raspistill -w 800 -h 600 -hf -ISO 800 -t 1000 -tl 200 -q 60 -ex off -awb sun -ss 30000 -a 4 -a "%s" -o b%04d.jpg"

#ssh pi1@192.168.2.111 "${scriptfoto}"

#scp pi1@192.168.2.111:~/b0001.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/b0002.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/b0006.jpg  /home/tg1628/Documentos/PruebaSeg/

#convert ~/Documentos/PruebaSeg/b0001.jpg ~/Documentos/PruebaSeg/b0002.jpg ~/Documentos/PruebaSeg/b0006.jpg +append ~/Documentos/PruebaSeg/Ejemplocon3.jpg

#shotwell ~/Documentos/PruebaSeg/Ejemplocon3.jpg

#ssh pi1@192.168.2.111 rm -R b0001.jpg 
#ssh pi1@192.168.2.111 rm -R b0002.jpg 
#ssh pi1@192.168.2.111 rm -R b0006.jpg 

#CON BM-----------------------------------------------------------------------------------------------
scriptfoto="raspistill -hf -ISO 800 -n -t 1000 -bm -tl 130 -q 60 -ex off -awb sun -ss 5000 -a 4 -a "%s" -o a%04d.jpg"

ssh pi1@192.168.2.111 "${scriptfoto}" #-l es el loginname

#scp pi1@192.168.2.111:~/a0001.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0004.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0005.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0006.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0008.jpg  /home/tg1628/Documentos/PruebaSeg/
#scp pi1@192.168.2.111:~/a0009.jpg  /home/tg1628/Documentos/PruebaSeg/

#convert ~/Documentos/PruebaSeg/a0001.jpg ~/Documentos/PruebaSeg/a0004.jpg ~/Documentos/PruebaSeg/a0005.jpg ~/Documentos/PruebaSeg/a0006.jpg ~/Documentos/PruebaSeg/a0008.jpg ~/Documentos/PruebaSeg/a0009.jpg +append ~/Documentos/PruebaSeg/Ejemplo4.jpg

#shotwell ~/Documentos/PruebaSeg/Ejemplo4.jpg

#ssh pi1@192.168.2.111 rm -R a0001.jpg 
#ssh pi1@192.168.2.111 rm -R a0004.jpg 
#ssh pi1@192.168.2.111 rm -R a0005.jpg 
#ssh pi1@192.168.2.111 rm -R a0006.jpg 
#ssh pi1@192.168.2.111 rm -R a0008.jpg 
#ssh pi1@192.168.2.111 rm -R a0009.jpg 

