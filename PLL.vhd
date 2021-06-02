LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY PLL IS 
 port(
  clk: in std_logic;
  rst: in std_logic;
  clk_s: out std_logic
 
 );
END ENTITY PLL;

ARCHITECTURE Behavioural OF PLL IS
 
 signal Salida:std_logic;

 
BEGIN

Division_frecuencia: PROCESS(clk,rst)
    BEGIN
		  IF(rst='1')THEN	
				Salida    <= '0';
        ELSIF(clk'EVENT AND clk='1') THEN
            Salida    <= NOT Salida;
        END IF;
    END PROCESS;

clk_s<=Salida;

END ARCHITECTURE;