 #!/bin/bash

#O. Tange (2011): GNU Parallel - The Command-Line Power Tool,
#;login: The USENIX Magazine, February 2011:42-47.

#El siguiente script es el encargado de darle la opción al usuario de apagar las raspberrys.

Apagado="sudo shutdown -t now"

echo "Desea apagarlas? si o no"
read respuesta

if [ $respuesta = "si" ]; then
	
parallel --tag --nonall -S 4/pi1@192.168.2.111,4/pi2@192.168.2.112,4/pi3@192.168.2.113,4/pi4@192.168.2.114,4/pi5@192.168.2.115 "${Apagado}" 
	echo Las raspberrys se apagaron...
elif [ $respuesta = "no" ]; then
	echo Fin
else
	echo Orden no valida...
fi

