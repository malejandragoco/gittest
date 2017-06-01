--**************************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                      --
--				TRABAJO DE GRADO 	                            --
--				                                                --
-- Nombre María Alejandra Gómez Contreras                       --                      
-- Titulo Sincronización entre módulos para la captura          --
--	      de información en un robot modular tipo serpiente.	--										
-- Fecha  01/03/2017									        --
--                                                              --
--**************************************************************--

--Definición de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;


--******************************************************--
--este bloque es --
--******************************************************--

entity  Contador10 is
port( 
		Reloj: IN STD_LOGIC;
		NBCD10: Buffer std_logic_vector(4 downto 1);
		Rest10: in std_logic;
		Reinicio: in std_logic;
		Rest: in std_logic
		);
end    Contador10          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Contador10Arch       of  Contador10     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

PROCESS(Reloj, Rest, Rest10)
BEGIN
IF (Reloj'EVENT and Reloj = '1' and Rest10 = '1') THEN
NBCD10 <= (others => '0');
ELSIF (Reloj'EVENT and Reloj = '1' and Rest ='1' )THEN
NBCD10 <= NBCD10 + 1;
END IF;
IF (Reinicio = '1') THEN
NBCD10 <= (others => '0');
END IF;
END PROCESS;
End  Contador10Arch;
