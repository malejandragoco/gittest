--**************************************************************--
--		  PONTIFICIA UNIVERSIDAD JAVERIANA                      --
--				TRABAJO DE GRADO 	                            --
--				                                                --
-- Nombre Mar�a Alejandra G�mez Contreras                       --                      
-- Titulo Sincronizaci�n entre m�dulos para la captura          --
--	      de informaci�n en un robot modular tipo serpiente.	--										
-- Fecha  04/03/2017									        --
--                                                              --
--**************************************************************--

--Definici�n de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all;

--******************************************************--
--este bloque es --
--******************************************************--

entity  Sistema is
port( 
		
		Reloj: in std_logic;
		Reset: in std_logic;
		INICIO: in std_logic;
		RestVER: out std_logic;
		Sieteseg: out std_logic_vector(7 downto 1);
		Sieteseg10: out std_logic_vector(7 downto 1);
		Sieteseg100: out std_logic_vector(7 downto 1);
		Sieteseg0: out std_logic_vector(7 downto 1)
		);
end    Sistema         ;

--Definici�n de la arquitectura 
--******************************************************--
--Comentarios                                           --
--******************************************************--

architecture  SistemaArch       of  Sistema     is


component      Contador         is
port(	
		Reloj: IN STD_LOGIC;
		Rest: in std_logic;
		Cnt_contador: in std_logic;
		Reinicio: in std_logic;
		
		NBCD: Buffer std_logic_vector(4 downto 1)
		
		
		);
end component         ;

component      Contador10         is
port(	
		Reloj: IN STD_LOGIC;
		Rest10: in std_logic;
		Rest: in std_logic;
		Reinicio: in std_logic;
		
		NBCD10: Buffer std_logic_vector(4 downto 1)
		
		
		);
end component         ;

component      Contador100         is
port(	
		Reloj: IN STD_LOGIC;
		Rest100: in std_logic;
		Rest10: in std_logic;
		Reinicio: in std_logic;
		
		NBCD100: Buffer std_logic_vector(4 downto 1)
		
		
		);
end component         ;

component      Contador0         is
port(	
		Reloj: IN STD_LOGIC;
		Rest0: in std_logic;
		Rest100: in std_logic;
		Reinicio: in std_logic;
		
		NBCD0: Buffer std_logic_vector(4 downto 1)
		
		
		);
end component         ;

component      ConversorMOVdoble         is
port(	
		
		NBCD10: in std_logic_vector(4 downto 1);
		Sieteseg: out std_logic_vector(7 downto 1);
		Sieteseg10: out std_logic_vector(7 downto 1)
		
		
		);
end component         ;

component      Conversor100         is
port(	
		
		NBCD100: in std_logic_vector(4 downto 1);
		
		Sieteseg100: out std_logic_vector(7 downto 1)
		
		
		);
end component         ;

component      Conversor0         is
port(	
		
		NBCD0: in std_logic_vector(4 downto 1);
		
		Sieteseg0: out std_logic_vector(7 downto 1)
		
		
		);
end component         ;

component      Comparador         is
port(	
		
		NBCD: IN STD_LOGIC_VECTOR(4 downto 1);

		Rest :  BUFFER STD_LOGIC
		
		
		);
end component         ;

component      Comparador10         is
port(	
		
		NBCD10: IN STD_LOGIC_VECTOR(4 downto 1);

		Rest10 :  BUFFER STD_LOGIC
		
		
		);
end component         ;

component      Comparador100         is
port(	
		
		NBCD100: IN STD_LOGIC_VECTOR(4 downto 1);

		Rest100 :  BUFFER STD_LOGIC
		
		
		);
end component         ;

component      Comparador0         is
port(	
		
		NBCD0: IN STD_LOGIC_VECTOR(4 downto 1);

		Rest0 :  BUFFER STD_LOGIC
		
		
		);
end component         ;

component      Control         is
port(	
		
		
		INICIO: in std_logic;
		Reloj: in std_logic;
		Validacion: in std_logic;
		Reset: in std_logic;
		
		ControlP: out std_logic_vector(2 downto 1);
		Cnt_contador: out std_logic;
		Reinicio: out std_logic;
		Estados : out std_logic_vector (4 downto 1)
		
		
		);
end component         ;

component      ContadorReferencia         is
port(	
		
		Reloj: IN STD_LOGIC;
		ControlP: IN STD_LOGIC_VECTOR(2 downto 1);
		
		Numero :  BUFFER STD_LOGIC_VECTOR(26 downto 1)
		
		
		);
end component         ;

component      ComparadorReferencia         is
port(	
		
		
		Numero: IN STD_LOGIC_VECTOR(26 downto 1);
		
		Validacion :  BUFFER STD_LOGIC
		
		
		);
end component         ;

--******************************************************--
--Comentarios                                           --
--******************************************************--


signal Rest:  std_logic;
signal Rest10:  std_logic;
signal Rest100:  std_logic;
signal Rest0:  std_logic;
signal Cnt_contador:  std_logic;
signal NBCD:  std_logic_vector (4 downto 1);
signal NBCD10:  std_logic_vector (4 downto 1);
signal NBCD100:  std_logic_vector (4 downto 1);
signal NBCD0:  std_logic_vector (4 downto 1);
signal Validacion:  std_logic;
signal ControlP:  std_logic_vector (2 downto 1);	
signal Estados:  std_logic_vector (4 downto 1);
signal Numero:  std_logic_vector (26 downto 1);
signal Reinicio:  std_logic;
		
begin

--******************************************************--
--Instancias y Conectividad
--******************************************************
ContadorS: Contador port map (Reloj, Rest, Cnt_contador,Reinicio, NBCD);
Contador10S: Contador10 port map (Reloj, Rest10, Rest, Reinicio, NBCD10);
Contador100S: Contador100 port map (Reloj, Rest100, Rest10, Reinicio, NBCD100);
Contador0S: Contador0 port map (Reloj, Rest0, Rest100, Reinicio, NBCD0);
ConversorMOVdobleS: ConversorMOVdoble port map (NBCD10, Sieteseg, Sieteseg10);
Conversor100S: Conversor100 port map (NBCD100, Sieteseg100);
Conversor0S: Conversor0 port map (NBCD0, Sieteseg0);
ComparadorS: Comparador port map (NBCD, Rest);
Comparador10S: Comparador10 port map (NBCD10, Rest10);
Comparador100S: Comparador100 port map (NBCD100, Rest100);
Comparador0S: Comparador0 port map (NBCD0, Rest0);
ControlS: Control port map (INICIO, Reloj, Validacion, Reset, ControlP, Cnt_contador, Reinicio, Estados);
ContadorReferenciaS:   ContadorReferencia  port map (Reloj, ControlP, Numero); 
ComparadorReferenciaS: ComparadorReferencia port map (Numero, Validacion);

RestVER<= Rest;
	
End  SistemaArch;
