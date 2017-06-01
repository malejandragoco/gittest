--**************************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                      --
--				TRABAJO DE GRADO 	                            --
--				                                                --
-- Nombre María Alejandra Gómez Contreras                       --                      
-- Titulo Sincronización entre módulos para la captura          --
--	      de información en un robot modular tipo serpiente.	--										
-- Fecha  4/03/2017									        --
--                                                              --
--**************************************************************--

--Definición de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;

--******************************************************--
--este bloque es --
--******************************************************--

entity  Conversor100 is
port( 
		
		NBCD100: in std_logic_vector(4 downto 1);
		Sieteseg100: out std_logic_vector(7 downto 1)
		
		);
end    Conversor100          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Conversor100Arch       of  Conversor100     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************


Sieteseg100(1)<= (((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (NBCD100(3)) and (not NBCD100(2))and (not NBCD100(1))));
Sieteseg100(2)<= (((not NBCD100(4)) and (NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (NBCD100(3)) and (NBCD100(2))and (not NBCD100(1))));
Sieteseg100(3)<= ((not NBCD100(4)) and (not NBCD100(3)) and (NBCD100(2))and (not NBCD100(1)));
Sieteseg100(4)<= (((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (NBCD100(3)) and (not NBCD100(2))and (not NBCD100(1))) or ((not NBCD100(4)) and (NBCD100(3)) and (NBCD100(2))and (NBCD100(1))) or((NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1))));
Sieteseg100(5)<= (((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (not NBCD100(3)) and (NBCD100(2))and (NBCD100(1))) or ((not NBCD100(4)) and (NBCD100(3)) and (not NBCD100(2))and (not NBCD100(1))) or((not NBCD100(4)) and (NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (NBCD100(3)) and (NBCD100(2))and (NBCD100(1)))or ((NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1))));
Sieteseg100(6)<= (((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1)))or ((not NBCD100(4)) and (not NBCD100(3)) and (NBCD100(2))and (not NBCD100(1))) or ((not NBCD100(4)) and (not NBCD100(3)) and (NBCD100(2))and (NBCD100(1))) or(( not NBCD100(4)) and ( NBCD100(3)) and ( NBCD100(2))and ( NBCD100(1))));
Sieteseg100(7)<= (((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (not NBCD100(1)))or ((not NBCD100(4)) and (not NBCD100(3)) and (not NBCD100(2))and (NBCD100(1))) or ((not NBCD100(4)) and (NBCD100(3)) and (NBCD100(2))and (NBCD100(1))));


End  Conversor100Arch;
