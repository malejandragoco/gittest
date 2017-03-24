#!/bin/bash

NombreFoto=$1

identify -verbose /home/tg1628/Documentos/Rasp1/$12000.jp2 | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp2/$12000.jp2 | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp3/$12000.jp2 | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp4/$12000.jp2 | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp5/$12000.jp2 | grep "exif:DateTimeOriginal:"
