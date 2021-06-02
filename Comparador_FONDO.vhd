library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity Comparador_FONDO is 
 
 Port ( 

 Pantalla_X :in std_logic_vector(9 downto 0);
 Pantalla_y :in std_logic_vector(9 downto 0);
 --Futura ancla
 Salida_Fondo :out std_logic_vector(2 downto 0)
  
 );
 end Comparador_FONDO; 
 
 architecture Behavioral of Comparador_FONDO is 
 
SIGNAL PX :UNSIGNED(9 DOWNTO 0);
SIGNAL PY :UNSIGNED(9 DOWNTO 0);
SIGNAL Comp_control_t:std_logic;
Signal Salida_Fondo1,Salida_Fondo2,Salida_Fondo3,Salida_Fondo4,Salida_Fondo5,Salida_Fondo6,Salida_Fondo7,Salida_Fondo8 : Std_logic_vector(3 downto 0);
-----COLOCAR LAS POSICIONES FIJAS DEL ANCLA DE CADA LETRA
--G
CONSTANT XG: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;--lim blanco
CONSTANT YG: UNSIGNED(9 DOWNTO 0) := to_unsigned(35,10) ;
--A
CONSTANT XA: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;        
CONSTANT YA: UNSIGNED(9 DOWNTO 0) := to_unsigned(68,10) ;-- azul
--M
CONSTANT XM: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;
CONSTANT YM: UNSIGNED(9 DOWNTO 0) := to_unsigned(131,10) ;--blanco
--E
CONSTANT XE: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;
CONSTANT YE: UNSIGNED(9 DOWNTO 0) := to_unsigned(163,10) ;--morado
--O
CONSTANT XO: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;
CONSTANT YO: UNSIGNED(9 DOWNTO 0) := to_unsigned(227,10) ;--blanco
--V
CONSTANT XV: UNSIGNED(9 DOWNTO 0) := to_unsigned(501,10) ;
CONSTANT YV: UNSIGNED(9 DOWNTO 0) := to_unsigned(260,10) ;
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
 

					  
 Salida_Fondo <= "111" when (((PX>= XG) and (PX < XG+ 640))and((PY>=YG)and (PY< YG+32)) ) else 
              
  "011" when (((PX>= XA) and (PX < XA+ 640))and((PY>=YA)and (PY< YA+62)) ) else 
                  
 "111" when (((PX>= XM) and (PX < XG+ 640))and((PY>=YM)and (PY< YM+32)) ) else 
             
 "101" when (((PX>= XE) and (PX < XE+ 640))and((PY>=YE)and (PY< YE+62)) ) else 
               
  "111" when (((PX>= XO) and (PX < XO+ 640))and((PY>=YO)and (PY< YO+32)) ) else 
                  
 
                 "011"; 
--Salida_Fondo<= Salida_Fondo1 or Salida_Fondo2 or Salida_Fondo3 or Salida_Fondo4 or Salida_Fondo5 or Salida_Fondo6 or Salida_Fondo7 or Salida_Fondo8;


 
 end Behavioral;