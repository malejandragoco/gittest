#!/bin/bash

NombreFoto=$1

identify -verbose /home/tg1628/Documentos/Rasp1/$1.jpg | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp2/$1.jpg | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp3/$1.jpg | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp4/$1.jpg | grep "exif:DateTimeOriginal:"
identify -verbose /home/tg1628/Documentos/Rasp5/$1.jpg | grep "exif:DateTimeOriginal:"
