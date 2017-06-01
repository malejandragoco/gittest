--**************************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                      --
--				TRABAJO DE GRADO 	                            --
--				                                                --
-- Nombre María Alejandra Gómez Contreras                       --                      
-- Titulo Sincronización entre módulos para la captura          --
--	      de información en un robot modular tipo serpiente.	--										
-- Fecha  20/02/2017									        --
--                                                              --
--**************************************************************--

--Definición de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;

--******************************************************--
--este bloque es --
--******************************************************--

entity  Control is
port( 
		
		INICIO: in std_logic;
		Reloj: in std_logic;
		Validacion: in std_logic;
		Reset: in std_logic;
		ControlP: out std_logic_vector(2 downto 1);
		Cnt_contador: out std_logic;
		Estados : out std_logic_vector (4 downto 1);
		Reinicio: out std_logic
		
		);
end    Control          ;

--Definición de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  ControlArch       of  Control     is


component DFFE
port(	

d:in std_logic;
clk:in std_logic;
clrn:in std_logic;
prn:in std_logic;
ena:in std_logic;
q:out std_logic
		);
end component ;

--******************************************************--
--Comentarios                                           --
--******************************************************--
signal q1: std_logic;
signal q2: std_logic;
signal q3: std_logic;
signal q4: std_logic;

signal d1: std_logic;
signal d2: std_logic;
signal d3: std_logic;
signal d4: std_logic;

begin

--******************************************************--
--Instancias y Conectividad
--******************************************************

--d1<= NOT INICIO;
--d2<=q1 or Validacion;
--d3<=q2;
--d4<=(q3 or (q4 and (not Validacion)));

d1<= NOT INICIO;
d2<=q1;
d3<=q2 or (q3 and (not Validacion)) or q4;
d4<=(q3 and Validacion);


flipflop1:dffe port map (d1,Reloj, Reset,'1','1',q1);
flipflop2:dffe port map (d2,Reloj, Reset,'1','1',q2);
flipflop3:dffe port map (d3,Reloj, Reset,'1','1',q3);
flipflop4:dffe port map (d4,Reloj, Reset,'1','1',q4);

--ControlP(1)<=q2;
--ControlP(2)<=q4;
--Reinicio<=q1;
--Cnt_contador<=q3;

ControlP(1)<=q2 or q4;
ControlP(2)<=q3;
Reinicio<=q1;
Cnt_contador<=q4;

Estados(1)<=q1;
Estados(2)<=q2;
Estados(3)<=q3;
Estados(4)<=q4;

End  ControlArch;
