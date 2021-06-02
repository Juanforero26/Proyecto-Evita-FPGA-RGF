 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity COMPARADOR_PS is 
 
 Port ( 

 Pantalla_X :in std_logic_vector(9 downto 0);
 Pantalla_y :in std_logic_vector(9 downto 0);
 --Futura ancla
 Compa_Letra_P :out std_logic;
 Compa_Letra_A :out std_logic;
 Compa_Letra_U :out std_logic;
 Compa_Letra_S :out std_logic;
 Compa_Letra_E :out std_logic;

 
 Pause_MUX :out std_logic_vector(2 downto 0)
  
 );
 end COMPARADOR_PS; 
 
 architecture Behavioral of COMPARADOR_PS is 
 
SIGNAL PX :UNSIGNED(9 DOWNTO 0);
SIGNAL PY :UNSIGNED(9 DOWNTO 0);
SIGNAL Comp_control_t:std_logic;
Signal Pause_MUX1,Pause_MUX2,Pause_MUX3,Pause_MUX4,Pause_MUX5 :Std_logic_vector(2 downto 0);
-----COLOCAR LAS POSICIONES FIJAS DEL ANCLA DE CADA LETRA
--p
CONSTANT XG: UNSIGNED(9 DOWNTO 0) := to_unsigned(384,10) ;
CONSTANT YG: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--A
CONSTANT XA: UNSIGNED(9 DOWNTO 0) := to_unsigned(417,10) ;        
CONSTANT YA: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--u
CONSTANT XM: UNSIGNED(9 DOWNTO 0) := to_unsigned(450,10) ;
CONSTANT YM: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--s
CONSTANT XE: UNSIGNED(9 DOWNTO 0) := to_unsigned(483,10) ;
CONSTANT YE: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--e
CONSTANT XO: UNSIGNED(9 DOWNTO 0) := to_unsigned(516,10) ;
CONSTANT YO: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;



 begin 
-- X<= unsigned(Ancla_X);
-- Y<= unsigned(Ancla_Y);
 PX <= unsigned(Pantalla_X);
 PY <= unsigned(Pantalla_y);
 
 Compa_Letra_P <= '1' when (((PX>= XG) and (PX < XG+ 32))and((PY>=YG)and (PY< YG+32)) ) else 
                 '0'; 
Compa_Letra_A <= '1' when (((PX>= XA) and (PX < XA+ 32))and((PY>=YA)and (PY< YA+32)) ) else 
                 '0'; 
 Compa_Letra_U <= '1' when (((PX>= XM) and (PX < XM+ 32))and((PY>=YM)and (PY< YM+32)) ) else 
                 '0'; 
 Compa_Letra_S <= '1' when (((PX>= XE) and (PX < XE+ 32))and((PY>=YE)and (PY< YE+32)) ) else 
                 '0'; 
 Compa_Letra_E <= '1' when (((PX>= XO) and (PX < XO+ 32))and((PY>=YO)and (PY< YO+32)) ) else 
                 '0'; 
            
					  
 Pause_MUX <= "001" when (((PX>= XG) and (PX < XG+ 32))and((PY>=YG)and (PY< YG+32)) ) else 
                 
 "010" when (((PX>= XA) and (PX < XA+ 32))and((PY>=YA)and (PY< YA+32)) ) else 
                
 "011" when (((PX>= XM) and (PX < XM+ 32))and((PY>=YM)and (PY< YM+32)) ) else 
                
 "100" when (((PX>= XE) and (PX < XE+ 32))and((PY>=YE)and (PY< YE+32)) ) else 
                 
"101" when (((PX>= XO) and (PX < XO+ 32))and((PY>=YO)and (PY< YO+32)) ) else 
                 "000"; 

--Pause_MUX<= Pause_MUX1 or Pause_MUX2 or Pause_MUX3 or Pause_MUX4 or Pause_MUX5;

 
 end Behavioral;