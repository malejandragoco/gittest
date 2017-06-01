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

ENTITY Comparador0 IS
PORT(

NBCD0: IN STD_LOGIC_VECTOR(4 downto 1);
Rest0 :  BUFFER STD_LOGIC
);

END Comparador0;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

ARCHITECTURE Comparador0Arch of Comparador0 IS

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal compare0:STD_LOGIC;
signal NumComp0:STD_LOGIC_VECTOR(4 downto 1);




BEGIN

--******************************************************--
--Instancias y Conectividad
--******************************************************
NumComp0 <= "1010";

PROCESS(NBCD0, NumComp0)

BEGIN

IF (NBCD0 =NumComp0) THEN
compare0<='1';
ELSE
compare0<='0';
END IF;

Rest0<=compare0;
END PROCESS;

END Comparador0Arch;

