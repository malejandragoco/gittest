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

entity  ConversorMOVdoble is
port( 
		
		NBCD10: in std_logic_vector(4 downto 1);
		Sieteseg10: out std_logic_vector(7 downto 1);
		Sieteseg: out std_logic_vector(7 downto 1)
		
		);
end   ConversorMOVdoble         ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  ConversorMOVdobleArch       of  ConversorMOVdoble    is



--******************************************************--
--Comentarios                                           --
--******************************************************--


begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

Sieteseg10(1)<= not((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1)));
Sieteseg10(2)<= '1';
Sieteseg10(3)<= '1';
Sieteseg10(4)<= not((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and (NBCD10(1)));
Sieteseg10(5)<= not((not NBCD10(4)) and (not NBCD10(3)) and (NBCD10(2))and ( not NBCD10(1)));
Sieteseg10(6)<= not((not NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)));
Sieteseg10(7)<= not((NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)));
Sieteseg(1)<= not((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (NBCD10(1)));
Sieteseg(2)<= not((not NBCD10(4)) and (NBCD10(3)) and (NBCD10(2))and (not NBCD10(1)));
Sieteseg(3)<= not((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (NBCD10(1)));
Sieteseg(4)<= not((not NBCD10(4)) and (NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1)));
Sieteseg(5)<= '1';
Sieteseg(6)<= '1';
Sieteseg(7)<= not((NBCD10(4)) and (not NBCD10(3)) and (not NBCD10(2))and (not NBCD10(1)));



End  ConversorMOVdobleArch;
