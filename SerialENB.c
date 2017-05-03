/////////////////////////////////////////////////////
//PROGRAMA ESCLAVO                                 //
//Maria Alejandra Gomez Contreras                  //
//Pontificia Universidad Javeriana                 //
/////////////////////////////////////////////////////

                                        // gcc -o nobloqueante nobloqueante.c
#define __LINUX_COM__
#include <bcm2835.h>
#include <stdlib.h>
#include "LnxCOMM.1.06/com/serial.h"

#define PIN RPI_GPIO_P1_11
#define E1 	10		//definicion estado 1
#define E2 	20		//definicion estado 2
#define E31 	31		//definicion sub estado 3.1
#define E32	32		//definicion sub estado 3.2
#define E41 	41		//definicion sub estado 4.1
#define E42	42		//definicion sub estado 4.2
#define E43	43		//definicion sub estado 4.3
#define E51 	51		//definicion sub estado 5.1
#define E52	52		//definicion sub estado 5.2
#define E53	53		//definicion sub estado 5.3
#define E10	100
#define FINAL	180

#define CINICIO 	170	//definicion caracter de inicio
#define OP1 		171	//definicion tomar foto
#define LOP1		3	//definicion longitud operacion1
#define OP3		173	//definicion tomar foto con parametro ss
#define LOP3		7  	//definicion longitud operacion3
#define OP2		172	//definicion poner fecha
#define LOP2		17	//definicion longitud operacion2


//se define una estructura para com llamada Com
typedef struct {
	unsigned char buffer[100];
	int cont;
	int est;
} Com;

int Inicializador (Com *com, int cont,int est);
int check(int longitud, Com *com,int pala, int checksum);
void Procesador_Pal(unsigned char P[], Com *com);


int main()
{
    bcm2835_init();
    bcm2835_gpio_fsel(PIN, BCM2835_GPIO_FSEL_OUTP);
    int var;					//variable donde se retorna la funcion inicializador 
    int c=0;
    Com com;
    var=Inicializador(&com,0,E1);
    printf("Contador inicializado en: %d\n",com.cont);
    printf("Estado inicializado en: %d\n",com.est);
    printf("Se inicializo el buffer en: \n");
    printf("%s\n",com.buffer);

    HANDLE fd;
    DCB OldConf;
    char cad[1];
    int n;
    int statu=system("sudo chmod o+rw /dev/ttyS0");
    fd=Open_Port("/dev/ttyS0");         // Abre el puerto serie.

    OldConf=Get_Configure_Port(fd);     // Guardo la configuración del puerto.
    Configure_Port(fd,B1000000,"8N1");  // Configuro el puerto serie.
    IO_Blocking(fd,FALSE);              // Seleccionamos lectura no bloqueante.
    bcm2835_gpio_write(PIN, LOW);
    while(Kbhit_Port(fd)<1);            // Espero a leer hasta que se tengan
    while(c==0)
    {                                        // 16 bytes en el buffer de entrada.
	if(com.est==FINAL)
	{
	 Procesador_Pal(cad, &com);
	 break;
	}
   	n=Read_Port(fd,cad,1);              // Leo el puerto serie.
	//printf("Cad: %d\n",(int) cad[0]);
	Procesador_Pal(cad, &com);

    }
    	Set_Configure_Port(fd,OldConf);     // Restituyo la antigua configuración
                                            // del puerto.

    	Close_Port(fd);                     // Cierro el puerto serie.
    //printf("\nPresione ENTER para terminar\n");
    //getchar();

    return 0;
}

int Inicializador(Com *com, int cont, int est)
{
	com->cont=cont;
 	com->est=est;
        int x;
	for(x=0;x<100;x++)
	{
	com->buffer[x]=0;
	}
	return 0;
}

int check(int longitud, Com *com, int pala, int checksum)
{
	int x;
	int d=0;
	pala=0;
	checksum=0;
	d=longitud-1;
	printf("El tamaño del char es: %d\n",longitud);
	for(x=0;x<longitud;x++)
	{
		if (x<d)
		{
			pala=pala+(int)com->buffer[x];

		}else
		{
			if(x==d)
			{
				checksum=((int)com->buffer[x]);
				printf("Checksum dentro: %d\n",checksum);
			}
		}
	}
	unsigned int palla= (pala&0x000000FF);
	if(palla==checksum)
	{
		printf("Checksum verificado \n");
		return 0;
	}else
	{
		printf("La palabra sumada dio: %d\n",palla);
		printf("Checksum ess: %d\n",checksum);
		return 1;
	}
}


void Procesador_Pal(unsigned char P[], Com *com)
{
	int rchecksum=1;
	int pala;
	int checksum;
	unsigned int uni;
	char fecha[100];
	int hora0;
	int hora2;
	int hora3;
	switch (com->est)
	{
		case E1:
		if ((int)P[0] == CINICIO)
		{
			com->est=E2;
			com->buffer[com->cont]=P[0];
			printf("P es igual a inicio\n");
			printf("El buffer tiene:\n");
			printf("%s\n",com->buffer);
			com->cont=com->cont+1;
		}else
		{
			//printf("P no es igual a INICIO\n");
			//printf("P: %d\n",P[com->cont]);
		}
		break;
		case E2:
		if ((int)P[0] == OP1)
		{
			com->buffer[com->cont]=P[0];
			printf("P es igual a la operacion 1\n");
			printf("El buffer tiene:\n");
			printf("%s\n",com->buffer);
			com->est=E31;
			com->cont=com->cont+1;
		}
		if((int)P[0] == OP2)
                {
                        com->buffer[com->cont]=P[0];
                        printf("P es igual a la operacion 2\n");
                        printf("El buffer tiene:\n");
                        printf("%s\n",com->buffer);
                        com->est=E41;
                        com->cont=com->cont+1;
                }
		if ((int)P[0] == OP3)
		{
			com->buffer[com->cont]=P[0];
			printf("P es igual a la operacion 3\n");
			printf("El buffer tiene:\n");
			printf("%s\n",com->buffer);
			com->est=E51;
			com->cont=com->cont+1;
		}
		break;
		case E31:
			printf("La operacion en el buffer es: %d\n",(int)com->buffer[1]);
			com->buffer[com->cont]=P[0];
                        printf("P es igual a operacion checksum 1\n");
                        printf("El buffer tiene:\n");
                        printf("%s\n",com->buffer);
                        rchecksum=check(LOP1, com, pala, checksum);
                        if(rchecksum == 0)
                        {
                                com->est=E32;
                        }
                        else
                        {
                                com->est=E10;
                        }
		break;
		case E32:
                        printf("SE TOMA FOTO\n");
                 	int foto=system("raspistill -w 800 -h 600 -ISO 80 -n -t 125 -q 40 -ex off -ss 5000 -o protocolo2.jpg");
                        if(foto==1)
                        {
                                printf("NO SE TOMO LA FOTO\n");
                        }
                        int hora=system("identify -verbose protocolo2.jpg | grep exif:DateTimeOriginal:");
                        if(hora==1)
                        {
                                printf("NO SE SACO EL EXIF\n");
                        }
                        com->est=FINAL;
                break;
		case E41:
			com->buffer[com->cont]=P[0];
			printf("El buffer tiene:\n");
			printf("%s\n",com->buffer);
			printf("El numero guardado fue: %d\n",(int)P[0]);
			com->cont=com->cont+1;
			if(com->cont==(LOP2-1))
				{
					com->est=E42;
				}else
				{
					com->est=E41;
				}
		break;
		case E42:
			printf("La operacion en el buffer es: %d\n",(int)com->buffer[1]);
			com->buffer[com->cont]=P[0];
                        printf("P es igual a operacion checksum 2\n");
                        printf("El buffer tiene:\n");
                        printf("%s\n",com->buffer);
                        rchecksum=check(LOP2, com, pala, checksum);
                        if(rchecksum == 0)
                        {
                                com->est=E43;
                        }
                        else
                        {
                                com->est=E10;
                        }

		break;
		case E43:
			hora0=system("identify -verbose protocolo2.jpg | grep exif:DateTimeOriginal:");
			snprintf(fecha,sizeof(fecha),"exiftool -AllDates='%d%d%d%d:%d%d:%d%d %d%d:%d%d:%d%d' -overwrite_original protocolo2.jpg",(int)com->buffer[2],(int)com->buffer[3],(int)com->buffer[4],(int)com->buffer[5],(int)com->buffer[6],(int)com->buffer[7],(int)com->buffer[8],(int)com->buffer[9],(int)com->buffer[10],(int)com->buffer[11],(int)com->buffer[12],(int)com->buffer[13],(int)com->buffer[14],(int)com->buffer[15]);
			hora2=system(fecha);
			printf("%s\n",fecha);
			hora3=system("identify -verbose protocolo2.jpg | grep exif:DateTimeOriginal:");
			if(hora2==1)
			{
				printf("NO SE MODIFICO EL EXIF\n");
			}
			com->est=FINAL;
		break;
		case E51:
			 com->buffer[com->cont]=P[0];
                         printf("El buffer tiene:\n");
                         printf("%s\n",com->buffer);
                         printf("El numero guardado fue: %d\n",(int)P[0]);
                         com->cont=com->cont+1;
                         if(com->cont==(LOP3-1))
                         {
                                 com->est=E52;
                         }else
                         {
                                 com->est=E51;
                         }
		break;
		case E52:
			printf("La operacion en el buffer es: %d\n",(int)com->buffer[1]);
			com->buffer[com->cont]=P[0];
			printf("P es igual a operacion checksum 3\n");
			printf("El buffer tiene:\n");
			printf("%s\n",com->buffer);
			rchecksum=check(LOP3, com, pala, checksum);
			if(rchecksum == 0)
			{
				com->est=E53;
			}
			else
			{
				com->est=E10;
			}
		break;
		case E53:
			uni =(com->buffer[5]&0xFF)|((com->buffer[4]&0xFF)<<8)|((com->buffer[3]&0xFF)<<16)|((com->buffer[2]&0xFF)<<24);
			printf("SE TOMA FOTO CON PARAMETRO DE: %d\n",uni);
			char buf[200];
			snprintf(buf, sizeof(buf),"raspistill -w 800 -h 600 -ISO 800 -n -t 125 -q 40 -ex off -ss %d -o protocolo2.jpg",uni);
			//printf("Instruc es: %s\n",buf);
			int foto1=system(buf);
			if(foto1==1)
			{
				printf("NO SE TOMO LA FOTO\n");
			}
			int hora1=system("identify -verbose protocolo2.jpg | grep exif:DateTimeOriginal:");
			if(hora1==1)
			{
				printf("NO SE SACO EL EXIF\n");
			}
			com->est=FINAL;
		break;
		case E10:
			printf("CHECKSUM ERRONEO\n");
			com->est=FINAL;
		break;
		case FINAL:
			printf("Final del programa\n");
		break;
		default:
			printf("ERRORRRRR!!!\n");
		break;
	}
}



