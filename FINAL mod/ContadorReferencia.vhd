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
USE ieee.std_logic_arith.ALL;

--******************************************************--
--este bloque es --
--******************************************************--

ENTITY ContadorReferencia IS
PORT(
	Reloj: IN STD_LOGIC;
	ControlP: IN STD_LOGIC_VECTOR(2 downto 1);
	Numero :  BUFFER STD_LOGIC_VECTOR(26 downto 1)
);
END ContadorReferencia;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE counter of ContadorReferencia IS

--******************************************************--
--Comentarios                                           --
--******************************************************--

BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************

PROCESS(Reloj, ControlP)

BEGIN

IF (ControlP(1) = '1') THEN
Numero <= (others => '0');
ELSIF (Reloj'EVENT and Reloj = '1' and ControlP(2) ='1' )THEN
Numero <= Numero+1;
END IF;

END PROCESS;

END counter;