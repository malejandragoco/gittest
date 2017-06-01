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

ENTITY Comparador IS
PORT(

NBCD: IN STD_LOGIC_VECTOR(4 downto 1);
Rest :  BUFFER STD_LOGIC
);

END Comparador;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE ComparadorArch of Comparador IS

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal compare:STD_LOGIC;
signal NumComp:STD_LOGIC_VECTOR(4 downto 1);




BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************
NumComp <= "1010";

PROCESS(NBCD, NumComp)

BEGIN

IF (NBCD =NumComp) THEN
compare<='1';
ELSE
compare<='0';
END IF;

Rest<=compare;
END PROCESS;

END ComparadorArch;

