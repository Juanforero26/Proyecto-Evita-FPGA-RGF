library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;
---------------------------------------------------------------

---------------------------------------------------------------
entity debounce is
				
	port(
	-------------------------Entradas------------------------
	Clk :in std_logic;
	Rst :in std_logic;
	Switch :in std_logic;
	-------------------------Salidas-------------------------
   Pressed:out std_logic
	
		);
		
end entity debounce;
---------------------------------------------------------------
architecture structural of debounce is 
--asignaciones
	signal SS1,SS2, SS3: std_logic_vector(7 downto 0);
	signal TC, TE, TCL, DB, TC1, TE1, TE2, TC2:std_logic;
	
begin
Pressed <= DB;


--component instantation (inicializacion de componentes)
DBModule_0: entity work.debounce_control

	port map( 
	      ------------Clocks y linea de reset
			Rst => Rst,	
			Clk => Clk,	
			-------------Inputs--------------------------
			Button => Switch, 
			Timer_control => TC,
			Timer_control1 => TC1,
			Timer_control2 => TC2,
			---------------Outputs-----------------------
			Timer_e => TE,
			Timer_e1=> TE1,
			Timer_c => TCL,
			Timer_e2 => TE2,
			deb_sw => DB

			 
			
				);

Timer_1:entity work.Cronometro
   generic map(
						Cm	=>	"0010",
				      Rm => "0010",		
					   Cs	=> "0000",
			         Rs => "0000",			
					   Cd	=> "0000",
			         Rd => "0000"			
						) 
	
	port map( 
	
					go => TE,
					clk => Clk,
					rst => Rst,
					clear => TCL,
					MM => TC
--					S1 => SS1,
--					S2 => SS2,
--					S3 => SS3
	
	);

Timer_2:entity work.Cronometro
   generic map(
						Cm	=>	"0001",
				      Rm => "0001",		
					   Cs	=> "0000",
			         Rs => "0000",			
					   Cd	=> "0000",
			         Rd => "0000"			
						) 
	
	port map( 
	
					go => TE2,
					clk => Clk,
					rst => Rst,
					clear => TCL,
					MM => TC2
--					S1 => SS1,
--					S2 => SS2,
--					S3 => SS3
	
	);

Timer_3:entity work.Cronometro
   generic map(
						Cm	=>	"0010",
				      Rm => "0010",		
					   Cs	=> "0000",
			         Rs => "0000",			
					   Cd	=> "0000",
			         Rd => "0000"			
						) 
	
	port map( 
	
					go => TE1,
					clk => Clk,
					rst => Rst,
					clear => TCL,
					MM => TC1
--					S1 => SS1,
--					S2 => SS2,
--					S3 => SS3
	
	);	
	



end architecture structural; 