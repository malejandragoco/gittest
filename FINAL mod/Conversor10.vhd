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

entity  Conversor10 is
port( 
		
		NBCD10: in std_logic_vector(4 downto 1);
		Sieteseg10: out std_logic_vector(7 downto 1)
		
		);
end    Conversor10          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Conversor10Arch       of  Conversor10     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

Sieteseg10(1)<= (((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1))));
Sieteseg10(2)<= (((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (not NBCD10(1))));
Sieteseg10(3)<= ((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and (not NBCD10(1)));
Sieteseg10(4)<= (((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1))) or ((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (NBCD10(1))) or((NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1))));
Sieteseg10(5)<= (((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and (NBCD10(1))) or ((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1))) or((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (NBCD10(1)))or ((NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1))));
Sieteseg10(6)<= (((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)))or ((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and (not NBCD10(1))) or ((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and (NBCD10(1))) or(( not NBCD10(4)) and ( NBCD10(3)) and ( NBCD10(2))and ( NBCD10(1))));
Sieteseg10(7)<= (((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1)))or ((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1))) or ((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (NBCD10(1))));


End  Conversor10Arch;