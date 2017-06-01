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

entity  Contador0 is
port( 
		Reloj: IN STD_LOGIC;
		NBCD0: Buffer std_logic_vector(4 downto 1);
		Rest0: in std_logic;
		Reinicio: in std_logic;
		Rest100: in std_logic
		);
end    Contador0          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Contador0Arch       of  Contador0     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

PROCESS(Reloj, Rest100, Rest0)
BEGIN
IF (Reloj'EVENT and Reloj = '1' and Rest0 = '1') THEN
NBCD0 <= (others => '0');
ELSIF (Reloj'EVENT and Reloj = '1' and Rest100 ='1' )THEN
NBCD0 <= NBCD0+1;
END IF;
IF (Reinicio = '1') THEN
NBCD0 <= (others => '0');
END IF;
END PROCESS;
End  Contador0Arch;
