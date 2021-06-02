library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 

 use ieee.numeric_std.all;

 entity Comparador_GAME_OVER is 
 
 Port ( 


 --ANCLA JUGADORES
 Ancla_X  :in std_logic_vector(9 downto 0);
 Ancla_Y :in std_logic_vector(9 downto 0);
 --ANCLA PERSONAS
 Ancla_X1  :in std_logic_vector(9 downto 0);
 Ancla_Y1  :in std_logic_vector(9 downto 0);
 Ancla_X2  :in std_logic_vector(9 downto 0);
 Ancla_Y2  :in std_logic_vector(9 downto 0);
 Ancla_X3  :in std_logic_vector(9 downto 0);
 Ancla_Y3  :in std_logic_vector(9 downto 0);
 Ancla_X4  :in std_logic_vector(9 downto 0);
 Ancla_Y4  :in std_logic_vector(9 downto 0);
 Ancla_X5  :in std_logic_vector(9 downto 0);
 Ancla_Y5  :in std_logic_vector(9 downto 0);
 Ancla_X6  :in std_logic_vector(9 downto 0);
 Ancla_Y6  :in std_logic_vector(9 downto 0);
 Ancla_X7  :in std_logic_vector(9 downto 0);
 Ancla_Y7  :in std_logic_vector(9 downto 0);
 Ancla_X8  :in std_logic_vector(9 downto 0);
 Ancla_Y8  :in std_logic_vector(9 downto 0);
 Ancla_X9  :in std_logic_vector(9 downto 0);
 Ancla_Y9  :in std_logic_vector(9 downto 0);
 Ancla_X10  :in std_logic_vector(9 downto 0);
 Ancla_Y10  :in std_logic_vector(9 downto 0);
 Ancla_X11  :in std_logic_vector(9 downto 0);
 Ancla_Y11  :in std_logic_vector(9 downto 0);
 Ancla_X12  :in std_logic_vector(9 downto 0);
 Ancla_Y12  :in std_logic_vector(9 downto 0);
 Ancla_X13  :in std_logic_vector(9 downto 0);
 Ancla_Y13  :in std_logic_vector(9 downto 0);
 Ancla_X14  :in std_logic_vector(9 downto 0);
 Ancla_Y14  :in std_logic_vector(9 downto 0);
 Ancla_X15  :in std_logic_vector(9 downto 0);
 Ancla_Y15  :in std_logic_vector(9 downto 0);
 Ancla_X16  :in std_logic_vector(9 downto 0);
 Ancla_Y16  :in std_logic_vector(9 downto 0);
 Ancla_X17  :in std_logic_vector(9 downto 0);
 Ancla_Y17  :in std_logic_vector(9 downto 0);
 Ancla_X18  :in std_logic_vector(9 downto 0);
 Ancla_Y18  :in std_logic_vector(9 downto 0);
 
 Comp_Game_Over:Out std_logic
 );
 end Comparador_GAME_OVER; 
 
 architecture Behavioral of Comparador_GAME_OVER is 
 
SIGNAL PX :UNSIGNED(9 DOWNTO 0);
SIGNAL PY :UNSIGNED(9 DOWNTO 0);

--CONSTANT X: UNSIGNED(9 DOWNTO 0) := to_unsigned(359,10) ;
--CONSTANT Y: UNSIGNED(9 DOWNTO 0) := to_unsigned(240,10) ;

SIGNAL X1:UNSIGNED(9 DOWNTO 0);
SIGNAL Y1:UNSIGNED(9 DOWNTO 0);
SIGNAL X2:UNSIGNED(9 DOWNTO 0);
SIGNAL Y2:UNSIGNED(9 DOWNTO 0);
SIGNAL X3:UNSIGNED(9 DOWNTO 0);
SIGNAL Y3:UNSIGNED(9 DOWNTO 0);
SIGNAL X4:UNSIGNED(9 DOWNTO 0);
SIGNAL Y4:UNSIGNED(9 DOWNTO 0);
SIGNAL X5:UNSIGNED(9 DOWNTO 0);
SIGNAL Y5:UNSIGNED(9 DOWNTO 0);
SIGNAL X6:UNSIGNED(9 DOWNTO 0);
SIGNAL Y6:UNSIGNED(9 DOWNTO 0);
SIGNAL X7:UNSIGNED(9 DOWNTO 0);
SIGNAL Y7:UNSIGNED(9 DOWNTO 0);
SIGNAL X8:UNSIGNED(9 DOWNTO 0);
SIGNAL Y8:UNSIGNED(9 DOWNTO 0);
SIGNAL X9:UNSIGNED(9 DOWNTO 0);
SIGNAL Y9:UNSIGNED(9 DOWNTO 0);
SIGNAL X10:UNSIGNED(9 DOWNTO 0);
SIGNAL Y10:UNSIGNED(9 DOWNTO 0);
SIGNAL X11:UNSIGNED(9 DOWNTO 0);
SIGNAL Y11:UNSIGNED(9 DOWNTO 0);
SIGNAL X12:UNSIGNED(9 DOWNTO 0);
SIGNAL Y12:UNSIGNED(9 DOWNTO 0);
SIGNAL X13:UNSIGNED(9 DOWNTO 0);
SIGNAL Y13:UNSIGNED(9 DOWNTO 0);
SIGNAL X14:UNSIGNED(9 DOWNTO 0);
SIGNAL Y14:UNSIGNED(9 DOWNTO 0);
SIGNAL X15:UNSIGNED(9 DOWNTO 0);
SIGNAL Y15:UNSIGNED(9 DOWNTO 0);
SIGNAL X16:UNSIGNED(9 DOWNTO 0);
SIGNAL Y16:UNSIGNED(9 DOWNTO 0);
SIGNAL X17:UNSIGNED(9 DOWNTO 0);
SIGNAL Y17:UNSIGNED(9 DOWNTO 0);
SIGNAL X18:UNSIGNED(9 DOWNTO 0);
SIGNAL Y18:UNSIGNED(9 DOWNTO 0);





 

 begin 
 
 X1<= unsigned(Ancla_X1);
 Y1<= unsigned(Ancla_Y1);
 X2<= unsigned(Ancla_X2);
 Y2<= unsigned(Ancla_Y2);
 X3<= unsigned(Ancla_X3);
 Y3<= unsigned(Ancla_Y3);
 X4<= unsigned(Ancla_X4);
 Y4<= unsigned(Ancla_Y4);
 X5<= unsigned(Ancla_X5);
 Y5<= unsigned(Ancla_Y5);
 X6<= unsigned(Ancla_X6);
 Y6<= unsigned(Ancla_Y6);
 X7<= unsigned(Ancla_X7);
 Y7<= unsigned(Ancla_Y7);
 X8<= unsigned(Ancla_X8);
 Y8<= unsigned(Ancla_Y8);
 X9<= unsigned(Ancla_X9);
 Y9<= unsigned(Ancla_Y9);
 X10<= unsigned(Ancla_X10);
 Y10<= unsigned(Ancla_Y10);
 X11<= unsigned(Ancla_X11);
 Y11<= unsigned(Ancla_Y11);
 X12<= unsigned(Ancla_X12);
 Y12<= unsigned(Ancla_Y12);
 X13<= unsigned(Ancla_X13);
 Y13<= unsigned(Ancla_Y13);
 X14<= unsigned(Ancla_X14);
 Y14<= unsigned(Ancla_Y14);
 X15<= unsigned(Ancla_X15);
 Y15<= unsigned(Ancla_Y15);
 X16<= unsigned(Ancla_X16);
 Y16<= unsigned(Ancla_Y16);
 X17<= unsigned(Ancla_X17);
 Y17<= unsigned(Ancla_Y17);
 X18<= unsigned(Ancla_X18);
 Y18<= unsigned(Ancla_Y18);
 
 
 
 PX <= unsigned(Ancla_X);
 PY <= unsigned(Ancla_y);
 
Comp_Game_Over <= '1' when (((PX <= X1) and (PX > X1+ 32))and((PY <= Y1)and (PY > Y1 +32)) ) else
						'1' when (((PX >= X1) and (PX < X1+ 32))and((PY >= Y1)and (PY < Y1 +32)) ) else
						
						'1' when (((PX <= X2) and (PX > X2+ 32))and((PY <= Y2)and (PY > Y2 +32)) ) else 
						'1' when (((PX >= X2) and (PX < X2+ 32))and((PY >= Y2)and (PY < Y2 +32)) ) else
						
                  '1' when (((PX <= X3) and (PX > X3+ 32))and((PY <= Y3)and (PY > Y3 +32)) ) else
					   '1' when (((PX >= X3) and (PX < X3+ 32))and((PY >= Y3)and (PY < Y3 +32)) ) else	
						
                  '1' when (((PX <= X4) and (PX > X4+ 32))and((PY <= Y4)and (PY > Y4 +32)) ) else
					   '1' when (((PX >= X4) and (PX < X4+ 32))and((PY >= Y4)and (PY < Y4 +32)) ) else
						
						'1' when (((PX <= X5) and (PX > X5+ 32))and((PY <= Y5)and (PY > Y5 +32)) ) else 
						'1' when (((PX >= X5) and (PX < X5+ 32))and((PY >= Y5)and (PY < Y5 +32)) ) else
						
                  '1' when (((PX <= X6) and (PX > X6+ 32))and((PY <= Y6)and (PY > Y6 +32)) ) else 
						'1' when (((PX >= X6) and (PX < X6+ 32))and((PY >= Y6)and (PY < Y6 +32)) ) else
						
                  '1' when (((PX <= X7) and (PX > X7+ 32))and((PY <= Y7)and (PY > Y7 +32)) ) else
					   '1' when (((PX >= X7) and (PX < X7+ 32))and((PY >= Y7)and (PY < Y7 +32)) ) else
						
						'1' when (((PX <= X8) and (PX > X8+ 32))and((PY <= Y8)and (PY > Y8 +32)) ) else
					   '1' when (((PX >= X8) and (PX < X8+ 32))and((PY >= Y8)and (PY < Y8 +32)) ) else
						
						'1' when (((PX <= X9) and (PX > X9+ 32))and((PY <= Y9)and (PY > Y9 +32)) ) else 
						'1' when (((PX >= X9) and (PX < X9+ 32))and((PY >= Y9)and (PY < Y9 +32)) ) else
						
						'1' when (((PX <= X10) and (PX > X10+ 32))and((PY <= Y10)and (PY > Y10 +32)) ) else
					   '1' when (((PX >= X10) and (PX < X10+ 32))and((PY >= Y10)and (PY < Y10 +32)) ) else	
						
						'1' when (((PX <= X11) and (PX > X11+ 32))and((PY <= Y11)and (PY > Y11 +32)) ) else
					   '1' when (((PX >= X11) and (PX < X11+ 32))and((PY >= Y11)and (PY < Y11 +32)) ) else	
						
						'1' when (((PX <= X12) and (PX > X12+ 32))and((PY <= Y12)and (PY > Y12 +32)) ) else
					   '1' when (((PX >= X12) and (PX < X12+ 32))and((PY >= Y12)and (PY < Y12 +32)) ) else
						
						'1' when (((PX <= X13) and (PX > X13+ 32))and((PY <= Y13)and (PY > Y13 +32)) ) else 
						'1' when (((PX >= X13) and (PX < X13+ 32))and((PY >= Y13)and (PY < Y13 +32)) ) else
						
						'1' when (((PX <= X14) and (PX > X14+ 32))and((PY <= Y14)and (PY > Y14 +32)) ) else 
						'1' when (((PX >= X14) and (PX < X14+ 32))and((PY >= Y14)and (PY < Y14 +32)) ) else
						
						'1' when (((PX <= X15) and (PX > X15+ 32))and((PY <= Y15)and (PY > Y15 +32)) ) else 
						'1' when (((PX >= X15) and (PX < X15+ 32))and((PY >= Y15)and (PY < Y15 +32)) ) else
						
						'1' when (((PX <= X16) and (PX > X16+ 32))and((PY <= Y16)and (PY > Y16 +32)) ) else 
						'1' when (((PX >= X16) and (PX < X16+ 32))and((PY >= Y16)and (PY < Y16 +32)) ) else
						
						'1' when (((PX <= X17) and (PX > X17+ 32))and((PY <= Y17)and (PY > Y17 +32)) ) else 
						'1' when (((PX >= X17) and (PX < X17+ 32))and((PY >= Y17)and (PY < Y17 +32)) ) else
						
						'1' when (((PX <= X18) and (PX > X18+ 32))and((PY <= Y18)and (PY > Y18 +32)) ) else 
						'1' when (((PX >= X18) and (PX < X18+ 32))and((PY >= Y18)and (PY < Y18 +32)) ) else
						
						
						
						'0'; 					  


 
 end Behavioral;