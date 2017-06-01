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

entity  Conversor0 is
port( 
		
		NBCD0: in std_logic_vector(4 downto 1);
		Sieteseg0: out std_logic_vector(7 downto 1)
		
		);
end    Conversor0          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  Conversor0Arch       of  Conversor0     is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

Sieteseg0(1)<= (((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (NBCD0(3)) and (not NBCD0(2))and (not NBCD0(1))));
Sieteseg0(2)<= (((not NBCD0(4)) and (NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (NBCD0(3)) and (NBCD0(2))and (not NBCD0(1))));
Sieteseg0(3)<= ((not NBCD0(4)) and (not NBCD0(3)) and (NBCD0(2))and (not NBCD0(1)));
Sieteseg0(4)<= (((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (NBCD0(3)) and (not NBCD0(2))and (not NBCD0(1))) or ((not NBCD0(4)) and (NBCD0(3)) and (NBCD0(2))and (NBCD0(1))) or((NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1))));
Sieteseg0(5)<= (((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (not NBCD0(3)) and (NBCD0(2))and (NBCD0(1))) or ((not NBCD0(4)) and (NBCD0(3)) and (not NBCD0(2))and (not NBCD0(1))) or((not NBCD0(4)) and (NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (NBCD0(3)) and (NBCD0(2))and (NBCD0(1)))or ((NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1))));
Sieteseg0(6)<= (((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1)))or ((not NBCD0(4)) and (not NBCD0(3)) and (NBCD0(2))and (not NBCD0(1))) or ((not NBCD0(4)) and (not NBCD0(3)) and (NBCD0(2))and (NBCD0(1))) or(( not NBCD0(4)) and ( NBCD0(3)) and ( NBCD0(2))and ( NBCD0(1))));
Sieteseg0(7)<= (((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (not NBCD0(1)))or ((not NBCD0(4)) and (not NBCD0(3)) and (not NBCD0(2))and (NBCD0(1))) or ((not NBCD0(4)) and (NBCD0(3)) and (NBCD0(2))and (NBCD0(1))));


End  Conversor0Arch;
