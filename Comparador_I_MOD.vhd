library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity Comparador_I_MOD is 
 
 Port ( 

 Pantalla_X :in std_logic_vector(9 downto 0);
 Pantalla_y :in std_logic_vector(9 downto 0);
 --Futura ancla
 Compa_Letra_G :out std_logic;
 Compa_Letra_A :out std_logic;
 Compa_Letra_M :out std_logic;
 Compa_Letra_E :out std_logic;
 Compa_Letra_O :out std_logic;
 Compa_Letra_V :out std_logic;
 Compa_Letra_E2 :out std_logic;
 Compa_Letra_R :out std_logic;
 Game_over_MUX :out std_logic_vector(3 downto 0)
  
 );
 end Comparador_I_MOD; 
 
 architecture Behavioral of Comparador_I_MOD is 
 
SIGNAL PX :UNSIGNED(9 DOWNTO 0);
SIGNAL PY :UNSIGNED(9 DOWNTO 0);
SIGNAL Comp_control_t:std_logic;
Signal Game_over_MUX1,Game_over_MUX2,Game_over_MUX3,Game_over_MUX4,Game_over_MUX5,Game_over_MUX6,Game_over_MUX7,Game_over_MUX8 : Std_logic_vector(3 downto 0);
-----COLOCAR LAS POSICIONES FIJAS DEL ANCLA DE CADA LETRA
--G
CONSTANT XG: UNSIGNED(9 DOWNTO 0) := to_unsigned(336,10) ;
CONSTANT YG: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--A
CONSTANT XA: UNSIGNED(9 DOWNTO 0) := to_unsigned(369,10) ;        
CONSTANT YA: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--M
CONSTANT XM: UNSIGNED(9 DOWNTO 0) := to_unsigned(402,10) ;
CONSTANT YM: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--E
CONSTANT XE: UNSIGNED(9 DOWNTO 0) := to_unsigned(435,10) ;
CONSTANT YE: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--O
CONSTANT XO: UNSIGNED(9 DOWNTO 0) := to_unsigned(468,10) ;
CONSTANT YO: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--V
CONSTANT XV: UNSIGNED(9 DOWNTO 0) := to_unsigned(501,10) ;
CONSTANT YV: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--E2
CONSTANT XE2: UNSIGNED(9 DOWNTO 0) := to_unsigned(534,10) ;
CONSTANT YE2: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;
--R
CONSTANT XR: UNSIGNED(9 DOWNTO 0) := to_unsigned(567,10) ;
CONSTANT YR: UNSIGNED(9 DOWNTO 0) := to_unsigned(200,10) ;

 

 begin 
-- X<= unsigned(Ancla_X);
-- Y<= unsigned(Ancla_Y);
 PX <= unsigned(Pantalla_X);
 PY <= unsigned(Pantalla_y);
 
 Compa_Letra_G <= '1' when (((PX>= XG) and (PX < XG+ 32))and((PY>=YG)and (PY< YG+32)) ) else 
                 '0'; 
Compa_Letra_A <= '1' when (((PX>= XA) and (PX < XA+ 32))and((PY>=YA)and (PY< YA+32)) ) else 
                 '0'; 
 Compa_Letra_M <= '1' when (((PX>= XM) and (PX < XM+ 32))and((PY>=YM)and (PY< YM+32)) ) else 
                 '0'; 
 Compa_Letra_E <= '1' when (((PX>= XE) and (PX < XE+ 32))and((PY>=YE)and (PY< YE+32)) ) else 
                 '0'; 
 Compa_Letra_O <= '1' when (((PX>= XO) and (PX < XO+ 32))and((PY>=YO)and (PY< YO+32)) ) else 
                 '0'; 
 Compa_Letra_V <= '1' when (((PX>= XV) and (PX < XV+ 32))and((PY>=YV)and (PY< YV+32)) ) else 
                 '0';
 Compa_Letra_E2 <= '1' when (((PX>= XE2) and (PX < XE2+ 32))and((PY>=YE2)and (PY< YE2+32)) ) else 
                 '0';  
 Compa_Letra_R <= '1' when (((PX>= XR) and (PX < XR+ 32))and((PY>=YR)and (PY< YR+32)) ) else 
                 '0'; 
					  
 Game_over_MUX <= "0001" when (((PX>= XG) and (PX < XG+ 32))and((PY>=YG)and (PY< YG+32)) ) else 
              
  "0010" when (((PX>= XA) and (PX < XA+ 32))and((PY>=YA)and (PY< YA+32)) ) else 
                  
 "0011" when (((PX>= XM) and (PX < XM+ 32))and((PY>=YM)and (PY< YM+32)) ) else 
             
 "0100" when (((PX>= XE) and (PX < XE+ 32))and((PY>=YE)and (PY< YE+32)) ) else 
               
  "0101" when (((PX>= XO) and (PX < XO+ 32))and((PY>=YO)and (PY< YO+32)) ) else 
                  
  "0110" when (((PX>= XV) and (PX < XV+ 32))and((PY>=YV)and (PY< YV+32)) ) else 
                 
  "0111" when (((PX>= XE2) and (PX < XE2+ 32))and((PY>=YE2)and (PY< YE2+32)) ) else 
             
  "1000" when (((PX>= XR) and (PX < XR+ 32))and((PY>=YR)and (PY< YR+32)) ) else 
                 "0000"; 
--Game_over_MUX<= Game_over_MUX1 or Game_over_MUX2 or Game_over_MUX3 or Game_over_MUX4 or Game_over_MUX5 or Game_over_MUX6 or Game_over_MUX7 or Game_over_MUX8;


 
 end Behavioral;