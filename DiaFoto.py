#!/usr/bin/python

import os
import sys

nombreimagen2000 = sys.argv[1]+"2000.jp2" 

os.system("identify -verbose /home/tg1628/Documentos/Rasp1/"+nombreimagen2000+" | grep exif:DateTimeOriginal:")
