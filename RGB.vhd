library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity RGB is 
 
 Port ( 
 clk: in std_logic;
 rst: in std_logic;
 H_Valor: in std_logic_vector(9 downto 0);
 V_Valor: in std_logic_vector(9 downto 0);
 OBJT:in std_logic_vector(2 downto 0);
 R:out std_logic;
 G:out std_logic;
 B:out std_logic
 
  
 );
 end RGB; 
 
 architecture Behavioral of RGB is 
 
 
 signal R_int, G_int, B_int: std_logic; 
 signal color: std_logic_vector (2 downto 0); 
 signal H_V_AUX: UNSIGNED (9 DOWNTO 0);
 signal V_V_AUX: UNSIGNED (9 DOWNTO 0);
 

 begin 
 
 -- utilizamos biestables de salida para evitar posibles Glitches
H_V_AUX<= unsigned(H_Valor);
V_V_AUX<= unsigned(V_Valor);

 -- Iniiciaizamos los biestables a cero 
 process (clk,rst,R_int,G_int,B_int) 
 begin 
 if rst = '1' then 
 
 R <= '0'; 
 G <= '0'; 
 B <= '0'; 
 elsif 
 
 
 
 clk='1' and clk'event then 
 R <= R_int; 
 G <= G_int; 
 B <= B_int; 
 end if; 
 end process;
 
 color (0) <= OBJT(0) when ((H_V_AUX >= 144) AND (H_V_AUX < 784) AND  (V_V_AUX >= 35) AND (V_V_AUX < 515)) else
 
			
			 '0'; -- Intérvalos blank (blank = 0)
 color (1) <= OBJT(1) when ((H_V_AUX >= 144) AND (H_V_AUX < 784) AND  (V_V_AUX >= 35) AND (V_V_AUX < 515)) else
 
			
			 '0';
 color (2) <= OBJT(2) when ((H_V_AUX >= 144) AND (H_V_AUX < 784) AND  (V_V_AUX >= 35) AND (V_V_AUX < 515)) else
 
			
			 '0';
 R_int <= color(2);
 G_int <= color(1); 
 B_int <= color(0); 
 end Behavioral;