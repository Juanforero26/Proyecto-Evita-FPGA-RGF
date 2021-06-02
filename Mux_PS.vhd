library IEEE;
use IEEE.std_logic_1164.all;
 use ieee.numeric_std.all;
 

entity Mux_PS is
    port (
        
          LetraP: In Std_logic_vector(2 downto 0);
          LetraA: In Std_logic_vector(2 downto 0);
          LetraU: In Std_logic_vector(2 downto 0);
          LetraS: In Std_logic_vector(2 downto 0);
          LetraE: In Std_logic_vector(2 downto 0);
         
          
          Enable_PS:in std_logic;
          Comp_Mux_PS :In Std_logic_vector(2 downto 0);
          Salida_Mux_PS:            Out Std_logic_vector(2 downto 0)
       
    );
     
    
    
end entity Mux_PS;

 

architecture behavioural of Mux_PS is

 

    -- Señal auxiliar para hacer más legible la selección.
    signal auxSel : std_logic_vector(2 downto 0);

 

begin

 

    auxSel <= Comp_Mux_PS;
  
    -- La selección de entrada a poner en la salida..
    Salida_Mux_PS <= 
                  LetraP  when ( Enable_PS = '1' and auxSel = "001") else --Monacho
                  LetraA  when ( Enable_PS = '1' and  auxSel = "010") else
                  LetraU  when ( Enable_PS = '1' and auxSel = "011") else
                  LetraS  when ( Enable_PS = '1'  and auxSel = "100") else
                  LetraE  when ( Enable_PS = '1' and auxSel = "101") else
                                    "111" ;

 

end architecture behavioural;