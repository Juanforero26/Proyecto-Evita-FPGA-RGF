library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity Comparador_Botones is 
 
 Port ( 

		BotonUp									:in std_logic;
		BotonDown								:in std_logic;
		BotonLeft								:in std_logic;
		BotonRight								:in std_logic;
		Comp_Botones							:Out Std_logic
  
 );
 end Comparador_Botones; 
 
 architecture Behavioral of Comparador_Botones is 
 
Signal Botones:Std_logic_vector(3 downto 0);


 

 begin 
 Botones(0)<=(BotonUp);
 Botones(1)<=(BotonDown);
 Botones(2)<=(BotonLeft);
 Botones(3)<=(BotonRight);

 
 Comp_Botones<= '1' when Botones = "1000" else
					 '1' when Botones = "0100" else
					 '1' when Botones = "0010" else
					 '1' when Botones = "0001" else
					 '0';
						
 
 
 end Behavioral;