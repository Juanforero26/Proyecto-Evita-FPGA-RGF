library IEEE;
use IEEE.std_logic_1164.all;

entity MUX4 is
    port (
        
		  InA   : in std_logic_vector(19 downto 0);
		  InB   : in std_logic_vector(19 downto 0);
		  InC   : in std_logic_vector(19 downto 0);
		  InD	  : in std_logic_vector(19 downto 0);
		  Sel   : in std_logic_vector(3 downto 0) ;
 		  Output: out std_logic_vector(19 downto 0)
       
    );
end entity MUX4;

architecture behavioural of MUX4 is

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic_vector(3 downto 0);

begin

    auxSel <= Sel;
  
    -- La selección de entrada a poner en la salida..
    Output <= InA when auxSel = "1000" else
              InB when auxSel = "0100" else
				  InC when auxSel = "0010" else
				  InD when auxSel = "0001" else
              "00000000000000000000" ;

end architecture behavioural;
