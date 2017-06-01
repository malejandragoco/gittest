--**************************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                      --
--				TRABAJO DE GRADO 	                            --
--				                                                --
-- Nombre María Alejandra Gómez Contreras                       --                      
-- Titulo Sincronización entre módulos para la captura          --
--	      de información en un robot modular tipo serpiente.	--										
-- Fecha  02/03/2017									        --
--                                                              --
--**************************************************************--

--Definición de las bibliotecas 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

--******************************************************--
--este bloque es --
--******************************************************--

ENTITY ComparadorReferencia IS
PORT(

Numero: IN STD_LOGIC_VECTOR(26 downto 1);
Validacion :  BUFFER STD_LOGIC
);

END ComparadorReferencia;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE ComparadorReferenciaArch of ComparadorReferencia IS

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal compareG:STD_LOGIC;
signal NumCompG:STD_LOGIC_VECTOR(26 downto 1);




BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************
--PARA VER EN SEGUNDOS
--NumCompG <="10111110101111000010000000"; 

--PARA VER EN MILISEGUNDOS
NumCompG <="00000000001100001101010000"; 
--PARA PROBAR
--NumCompG <="00000000000000000000000001";


PROCESS(Numero, NumCompG)

BEGIN

IF (Numero = NumCompG) THEN
compareG<='1';
ELSE
compareG<='0';
END IF;

Validacion<=compareG;
END PROCESS;

END ComparadorReferenciaArch;

