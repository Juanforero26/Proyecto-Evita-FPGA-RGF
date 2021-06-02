library IEEE;
use IEEE.std_logic_1164.all;

use ieee.numeric_std.all; 

entity MUX is
    port (
        
          Monacho1: In Std_logic_vector(2 downto 0);
          Monacho2: In Std_logic_vector(2 downto 0);
          Monacho3: In Std_logic_vector(2 downto 0);
          Monacho4: In Std_logic_vector(2 downto 0);
          Monacho5: In Std_logic_vector(2 downto 0);
          Monacho6: In Std_logic_vector(2 downto 0);
          Monacho7: In Std_logic_vector(2 downto 0);
          Monacho8: In Std_logic_vector(2 downto 0);
			 Monacho9: In Std_logic_vector(2 downto 0);
			 Monacho10: In Std_logic_vector(2 downto 0);
			 Monacho11: In Std_logic_vector(2 downto 0);
			 Monacho12: In Std_logic_vector(2 downto 0);
			 Monacho13: In Std_logic_vector(2 downto 0);
			 Monacho14: In Std_logic_vector(2 downto 0);
			 Monacho15: In Std_logic_vector(2 downto 0);
			 Monacho16: In Std_logic_vector(2 downto 0);
			 Monacho17: In Std_logic_vector(2 downto 0);
			 Monacho18: In Std_logic_vector(2 downto 0);
          Jugador: In Std_logic_vector(2 downto 0);
          GameOver: In Std_logic_vector(2 downto 0);
          Pause: In Std_logic_vector(2 downto 0);
			 Background :In Std_logic_vector(2 downto 0);
          Comp_Mux :In Std_logic_vector(4 downto 0);
          Salida_Mux_Obj:            Out Std_logic_vector(2 downto 0)
       
    );
end entity MUX;

 

architecture behavioural of MUX is

 

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic_vector(4 downto 0);

 

begin

 

    auxSel <= Comp_Mux;
  
    -- La selección de entrada a poner en la salida..
    Salida_Mux_Obj <= 
                  Monacho1 when auxSel = "00001" else --Monacho
                  Monacho2 when auxSel = "00010" else
                  Monacho3 when auxSel = "00011" else
                  Monacho4 when auxSel = "00100" else
                  Monacho5 when auxSel = "00101" else
                  Monacho6 when auxSel = "00110" else
                  Monacho7 when auxSel = "00111" else
                  Monacho8 when auxSel = "01000" else
                  Jugador  when auxSel = "01001" else
                  GameOver when auxSel = "01010" else
                  Pause    when auxSel = "01011" else
						Monacho9 when auxSel = "01100" else
						Monacho10 when auxSel = "01101" else
						Monacho11 when auxSel = "01110" else
						Monacho12 when auxSel = "01111" else
						Monacho13 when auxSel = "10000" else
						Monacho14 when auxSel = "10001" else
						Monacho15 when auxSel = "10010" else
						Monacho16 when auxSel = "10011" else
						Monacho17 when auxSel = "10100" else
						Monacho18 when auxSel = "10101" else
						
              Background ;

 

end architecture behavioural;