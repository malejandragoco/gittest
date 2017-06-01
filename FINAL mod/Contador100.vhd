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

entity  Contador100 is
port( 
		Reloj: IN STD_LOGIC;
		NBCD100: Buffer std_logic_vector(4 downto 1);
		Rest100: in std_logic;
		Reinicio: in std_logic;
		Rest10: in std_logic
		);
end    Contador100          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Contador100Arch       of  Contador100     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

PROCESS(Reloj, Rest10, Rest100)
BEGIN
IF (Reloj'EVENT and Reloj = '1' and Rest100 = '1' ) THEN
NBCD100 <= (others => '0');
ELSIF (Reloj'EVENT and Reloj = '1' and Rest10 ='1' )THEN
NBCD100 <= NBCD100+1;
END IF;
IF (Reinicio = '1') THEN
NBCD100 <= (others => '0');
END IF;
END PROCESS;
End  Contador100Arch;
