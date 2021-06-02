-- Sumador completo de 1 bit
library IEEE;
use IEEE.std_logic_1164.all;

entity OneBitSub is
    port (
        Res, Cout : out std_logic;
        A, B, Cin : in std_logic
    );
end entity;

architecture arch of OneBitSub is
begin

    Res <= (Cin and (not A) and (not B))
        or ((not Cin) and (not A) and B)
        or (Cin and A and B)
        or ((not Cin) and A and (not B));

    Cout <= (Cin and (not A))
        or (Cin and B)
        or ((not A) and B);

end architecture;