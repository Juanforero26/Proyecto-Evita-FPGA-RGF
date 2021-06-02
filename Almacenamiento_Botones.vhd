library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library ALTERA;
use ALTERA.altera_primitives_components.all;

entity Almacenamiento_Botones is
	port(
		clk										:in std_logic;
		rst										:in std_logic;
		BotonUp									:in std_logic;
		BotonDown								:in std_logic;
		BotonLeft								:in std_logic;
		BotonRight								:in std_logic;
		Alm_Botones								:In Std_logic;
		Botones									:out std_logic_vector(3 downto 0)
			);
end entity Almacenamiento_Botones;
architecture Almacenamiento_Botones_arch of Almacenamiento_Botones is
--se ubican los component
component dffe is
port(d, clk, clrn, prn, ena: in std_logic;
q: out std_logic
);
end component;
signal D,igual_tmp: std_logic_vector (3 downto 0);
signal E: std_logic;
signal Q: std_logic_vector (3 downto 0);
signal reinicio: std_logic;
begin

D(0)<= BotonUp;
D(1)<= BotonDown;
D(2)<= BotonLeft;
D(3)<= BotonRight;


E <= Alm_Botones;
reinicio<= ((not rst) );


FF0: dffe port map (D(0), clk, reinicio, '1', E ,Q(0));
FF1: dffe port map (D(1), clk, reinicio, '1', E ,Q(1));
FF2: dffe port map (D(2), clk, reinicio, '1', E ,Q(2));
FF3: dffe port map (D(3), clk, reinicio, '1', E ,Q(3));

Botones<=Q;


end Almacenamiento_Botones_arch;