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

ENTITY Comparador100 IS
PORT(

NBCD100: IN STD_LOGIC_VECTOR(4 downto 1);
Rest100 :  BUFFER STD_LOGIC
);

END Comparador100;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE Comparador100Arch of Comparador100 IS

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal compare100:STD_LOGIC;
signal NumComp100:STD_LOGIC_VECTOR(4 downto 1);




BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************
NumComp100 <= "1010";

PROCESS(NBCD100, NumComp100)

BEGIN

IF (NBCD100 =NumComp100) THEN
compare100<='1';
ELSE
compare100<='0';
END IF;

Rest100<=compare100;
END PROCESS;

END Comparador100Arch;

