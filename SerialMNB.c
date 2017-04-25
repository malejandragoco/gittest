/////////////////////////////////////////////////////
//PROGRAMA MAESTRO                                 //
//Maria Alejandra Gomez Contreras                  //
//Pontificia Universidad Javeriana                 //
/////////////////////////////////////////////////////

                                        // gcc -o nobloqueante nobloqueante.c
#define __LINUX_COM__

#include <bcm2835.h>
#include <stdlib.h>
#include "LnxCOMM.1.06/com/serial.h"
#include <string.h>

#define PIN RPI_GPIO_P1_11
#define CINICIO 	170	//definicion caracter de inicio
#define OP1 		171	//definicion tomar foto
#define LOP1		3	//definicion longitud operacion1
#define CHECKSUMOP1	85	//definicion checksum operacion1
#define OP3		173	//definicion tomar foto con parametro ss
#define LOP3		7  	//definicion longitud operacion3
#define CHECKSUMOP3	142	//definicion checksum operacion3 con ss de 10.000
#define OP2		172	//definicion poner fecha exif
#define LOP2		17	//definicion longitud operacion2
#define CHECKSUMOP2	152	//definicion checksum operacion2 con mi fecha

int check(int longitud, char Palabra[], int Checksum);

int main(int argc, char **argv)
{
    bcm2835_init();
    bcm2835_gpio_fsel(PIN, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_write(PIN, HIGH);
    int x=0;
    int aux;
	int vel= 10000;		//velocidad del ss
	unsigned char a= ((vel&0xFF000000)>>24);
	unsigned char b= ((vel&0x00FF0000)>>16);
	unsigned char c= ((vel&0x0000FF00)>>8);
	unsigned char d= ((vel&0x000000FF));
    HANDLE fd;
    DCB OldConf;
    int Checksum;
    char Palabra[3]={CINICIO,OP1,00};
    char Palabra3[7]={CINICIO,OP3,a,b,c,d,00};
    char Palabra2[17]={CINICIO,OP2,1,9,9,4,0,7,0,6,1,9,4,7,0,9,00};
    char cad[1]={0};
    int Operacion=OP3;		//IMPORTANTE: poner el codigo de operacion a mandar
    int n;
    char *ca;
    char *pal;
    char *pal3;
    char *pal2;
    ca=cad;
    pal=Palabra;
    pal3=Palabra3;
    pal2=Palabra2;

    int status=system("stty -F /dev/ttyS0 1000000");
    fd=Open_Port("/dev/ttyS0");         // Abre el puerto serie.
                                        // fd=Open_Port("/dev/ttyS0");
    OldConf=Get_Configure_Port(fd);     // Guardo la configuración del puerto.
    Configure_Port(fd,B1000000,"8N1");   // Configuro el puerto serie.
    IO_Blocking(fd,FALSE);              // Seleccionamos lectura no bloqueante.
    if(Operacion==OP1)
    {
		check(LOP1, Palabra, Checksum);
		while(x<LOP1)
    		{
			*ca=*pal;
	    		n=Write_Port(fd,cad,1);            // Escribo en el puerto serie.
	   		printf("Enviado: %d\n",(int)cad[0]);        // Muestro loas datos.
	    		x++;
	    		*pal++;
			//for(aux=0;aux<350000;aux++);
		}
		int foto=system("raspistill -hf -vf -w 800 -h 600 -ISO 800 -n -t 125 -q 40 -ex off 			-ss 5000 -o helloM.jpg");
		if(foto==1)
			{
				printf("NO SE TOMO LA FOTO\n");
			}
		int hora=system("identify -verbose helloM.jpg | grep exif:DateTimeOriginal:");
		if(hora==1)
			{
				printf("NO SE SACO EL EXIF\n");
			}
    }else
    {
	if(Operacion==OP3)
	{
		check(LOP3, Palabra3, Checksum);
		printf("%d,%d,%d,%d\n",a,b,c,d);
		while(x<LOP3)
    		{
			*ca=*pal3;
	    		n=Write_Port(fd,cad,1);          	  // Escribo en el puerto serie.
	   		printf("Enviado: %d\n",(int)cad[0]);        // Muestro los datos.
	    		x++;
	    		*pal3++;
			//for(aux=0;aux<350000;aux++);
		}
		int foto1=system("raspistill -hf -vf -w 800 -h 600 -ISO 800 -n -t 125 -q 40 -ex off 			-ss 10000 -o helloM.jpg");
		if(foto1==1)
			{
				printf("NO SE TOMO LA FOTO\n");
			}
		int hora1=system("identify -verbose helloM.jpg | grep exif:DateTimeOriginal:");
		if(hora1==1)
			{
				printf("NO SE SACO EL EXIF\n");
			}
	}else
	{	if(Operacion==OP2)
		{
			check(LOP2, Palabra2, Checksum);
			while(x<LOP2)
			{
				*ca=*pal2;
				n=Write_Port(fd,cad,1);		//Escribo en el puerto serie.
				printf("Enviado: %d\n",(int)cad[0]);	//Muestro los datos.
				x++;
				*pal2++;
				//for(aux=0;aux<350000;aux++);
			}

		}else
		{
			printf("Codigo de operacion no valido\n");
		}
	}
    }

    Set_Configure_Port(fd,OldConf);     // Restituyo la antigua configuración
                                        // del puerto.

    Close_Port(fd);                     // Cierro el puerto serie.

    //printf("\nPresione ENTER para terminar\n");
    //getchar();
    bcm2835_gpio_write(PIN, LOW);
    bcm2835_close();
    return 0;
}

int check(int longitud, char Palabra[], int Checksum)
{
	int x;
	Checksum=0;
	printf("El tamaño del char es: %d\n",longitud);
	for(x=0;x<(longitud-1);x++)
        {
                Checksum=Checksum+(int)Palabra[x];
	}
	unsigned int Checks=(Checksum&0x000000FF);
	printf("El checksum es: %d\n",Checks);
	Palabra[longitud-1]=Checks;
	printf("La palabra es: %s\n",Palabra);
}
