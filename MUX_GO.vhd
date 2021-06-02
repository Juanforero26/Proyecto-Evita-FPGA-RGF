library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
 

entity MUX_GO is
    port (
        
          LetraG: In Std_logic_vector(2 downto 0);
          LetraA: In Std_logic_vector(2 downto 0);
          LetraM: In Std_logic_vector(2 downto 0);
          LetraE1: In Std_logic_vector(2 downto 0);
          LetraO: In Std_logic_vector(2 downto 0);
          LetraV: In Std_logic_vector(2 downto 0);
          LetraE2: In Std_logic_vector(2 downto 0);
          LetraR: In Std_logic_vector(2 downto 0);
          
          EnableGO:In std_logic;
          Comp_MUX_GO :In Std_logic_vector(3 downto 0);
          Salida_MUX_GO:            Out Std_logic_vector(2 downto 0)
       
    );
     
    
    
end entity MUX_GO;

 

architecture behavioural of MUX_GO is

 

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic_vector(3 downto 0);

 

begin

 

    auxSel <= Comp_MUX_GO;
  
    -- La selección de entrada a poner en la salida..
    Salida_MUX_GO <= 
                  LetraG  when (EnableGO = '1' and auxSel = "0001") else --Monacho
                  LetraA  when (EnableGO = '1' and auxSel = "0010") else
                  LetraM  when (EnableGO = '1' and auxSel = "0011") else
                  LetraE1 when (EnableGO = '1' and auxSel = "0100") else
                  LetraO  when (EnableGO = '1' and auxSel = "0101") else
                  LetraV  when (EnableGO = '1' and auxSel = "0110") else
                  LetraE2 when (EnableGO = '1' and auxSel = "0111") else
                  LetraR  when (EnableGO = '1' and auxSel = "1000") else
                    "111" ;

 

end architecture behavioural;