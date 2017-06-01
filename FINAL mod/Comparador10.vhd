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

ENTITY Comparador10 IS
PORT(

NBCD10: IN STD_LOGIC_VECTOR(4 downto 1);
Rest10 :  BUFFER STD_LOGIC
);

END Comparador10;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE Comparador10Arch of Comparador10 IS

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal compare10:STD_LOGIC;
signal NumComp10:STD_LOGIC_VECTOR(4 downto 1);




BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************
NumComp10 <= "1010";

PROCESS(NBCD10, NumComp10)

BEGIN

IF (NBCD10 =NumComp10) THEN
compare10<='1';
ELSE
compare10<='0';
END IF;

Rest10<=compare10;
END PROCESS;

END Comparador10Arch;

