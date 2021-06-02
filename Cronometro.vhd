library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;
---------------------------------------------------------------

---------------------------------------------------------------
entity Cronometro is
	GENERIC		(	Cm				:  UNSIGNED :=  "1010";
						Rm          :  UNSIGNED :=  "1010";
					   Cs				:  UNSIGNED :=  "0010";
						Rs          :  UNSIGNED :=  "0010";
					   Cd				:  UNSIGNED :=  "0000";
					   Rd          :  UNSIGNED :=  "0000"	--"01100011"
						
	);
	port(
	go: in std_logic;
	clk: in std_logic;
	rst:in std_logic;
	clear: in std_logic;
	MM: out std_logic
--	S1: out std_logic_vector(7 downto 0);
--	S2: out std_logic_vector(7 downto 0);
--	S3: out std_logic_vector(7 downto 0)
		);
end entity Cronometro;
---------------------------------------------------------------
architecture structural of Cronometro is 

	signal Cent: std_logic_vector(3 downto 0);
	Signal p: std_logic_vector(22 downto 0);
   signal Seg, Dec: std_logic_vector(3 downto 0);
	signal en1, en2,en3 ,Max_fn, m,m1,m2,m3, en_2, en_3: std_logic;
	signal Salida_SS1, Salida_SS2,Salida_SS3: std_logic_vector(7 downto 0);
begin
--salida de la igualdad
MM <= Max_fn and en2 and en3;
en_2 <= en2 and m;
en_3 <= en3 and m2;
--S1<= Salida_SS1;
--S2<= Salida_SS2;
--S3<= Salida_SS3;
--component instantation (inicializacion de componentes)
CronometroModule_0: entity work.contador_universal
-- generic map(
--						N => 23,
--					C => "00000000000000000000010",--colocar valor gigante
--					R => "00000000000000000000011"
--				) 
	port map( 
	
						clk	=>	clk,	
						rst	=>	rst,	
						ena	=>	go,	
						syn_clr	=>	clear,
						load	=>	'0',	
						up		=>	'1',	
						d		=>	"00000000000000000000000",	
						max_tick	=>	en1,
						min_tick	=>	m,
						counter	=> p	
	);

CronometroModule_1: entity work.contador_universal --Milesimas
   generic map(
						N => 4,
						C => Cm,
						R => Rm
						) 
	
	port map( 
	
						clk	=>	clk,	
						rst	=>	rst,	
						ena	=>	en1,	
						syn_clr	=>	clear,
						load	=>	'0',	
						up		=>	'1',	
						d		=>	"0000",	
						max_tick	=>	en2,
						min_tick	=>	m1,
						counter	=> Cent
	);

CronometroModule_2: entity work.contador_universal --Seg
   generic map(
						N => 4,
						C => Cs,
						R => Rs
						) 
	
	port map( 
	
						clk	=>	clk,	
						rst	=>	rst,	
						ena	=>	en_2,	
						syn_clr	=>	clear,
						load	=>	'0',	
						up		=>	'1',	
						d		=>	"0000",	
						max_tick	=>	en3,
						min_tick	=>	m2,
						counter	=> Seg
	);
	
CronometroModule_6: entity work.contador_universal --Milesimas
   generic map(
						N => 4,
						C => Cd,
						R => Rd
						) 
	
	port map( 
	
						clk	=>	clk,	
						rst	=>	rst,	
						ena	=>	en_3,
						syn_clr	=>	clear,
						load	=>	'0',	
						up		=>	'1',	
						d		=>	"0000",	
						max_tick	=>	Max_fn,
						min_tick	=>	m3,
						counter	=> Dec
	);
--CronometroModule_3: entity work.S7seg1 
--	Port Map(
--			Entrada1 	 => Cent,
--			SalidaS7seg1 => Salida_SS1
--				);
				
--CronometroModule_4: entity work.S7seg1 
--	Port Map(
--			Entrada1 	 => Seg,
--			SalidaS7seg1 => Salida_SS2
--				);
--CronometroModule_5: entity work.S7seg1 
--	Port Map(
--			Entrada1 	 => Dec,
--			SalidaS7seg1 => Salida_SS3
			--	);

end architecture structural; 