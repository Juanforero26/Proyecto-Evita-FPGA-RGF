
library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adderOne is
    port (
        Res, Cout : out std_logic;
        A, B, Cin : in std_logic
    );
end entity;

architecture arch of Full_adderOne is
begin

   Res <= ((not Cin) and (not A) and B)
        or ((not Cin) and A and (not B))
        or (Cin and (not A) and (not B))
        or (Cin and A and B);

    Cout <= (Cin and B) or (A and B) or (Cin and A);

end architecture;