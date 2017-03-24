#!/usr/bin/python

import os
import sys

nombreimagen2000 = sys.argv[1]+"2000.jp2" 

os.system("convert ~/Documentos/Rasp1/"+nombreimagen2000+" ~/Documentos/Rasp2/"+nombreimagen2000+"  ~/Documentos/Rasp3/"+nombreimagen2000+"   ~/Documentos/Rasp4/"+nombreimagen2000+"   ~/Documentos/Rasp5/"+nombreimagen2000+"   +append ~/Documentos/mosaicos/"+nombreimagen2000+"")

os.system("eog ~/Documentos/mosaicos/"+nombreimagen2000+"")
