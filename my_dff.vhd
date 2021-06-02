library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library ALTERA;
use ALTERA.altera_primitives_components.all;

--Declaracion de la entidad my_dff

entity my_dff is
	port(
		Reloj:in std_logic;
		Clear:in std_logic;
		Numero	:in  std_logic;
		Enable	:in  std_logic;
		Preset   :in std_logic;
		Qs			:out std_logic
		

			);
end entity my_dff;
architecture my_dff_arch of my_dff is

--Este bloque se encarga de almacenar los datos que vienen del deco_numeros para posteriormente utilizarlos

	signal Q ,D:std_logic; 
	Signal E, C, P :std_logic;

	


	component dffe is
	port(
		d,clk,clrn,prn, ena: in std_logic;
		Q: out std_logic

			);
	end component dffe;

	begin

	--Se definen los flipflops que almacenaran la informacion y de que manera seran utilizados.
	E<=Enable;
   C <= not (Clear);
	P <= not (Preset);
	D <= Numero;
	
	
	

	f0: dffe port map(D,Reloj,C,P,E,Q); 
	

	
	Qs<=Q;
	

end my_dff_arch;