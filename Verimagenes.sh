#!/bin/bash

convert ~/Documentos/Rasp1/$1.jpg ~/Documentos/Rasp2/$1.jpg ~/Documentos/Rasp3/$1.jpg ~/Documentos/Rasp4/$1.jpg ~/Documentos/Rasp5/$1.jpg +append ~/Documentos/mosaicos/$1.jpg

shotwell ~/Documentos/mosaicos/$1.jpg
