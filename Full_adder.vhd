library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------
entity Full_adder is 
	port (
	OP1	:in std_logic_vector (10 downto 0);
   OP2  :in std_logic_vector (10 downto 0);
	Carry_in :in std_logic;
	Total :out std_logic_vector(10 downto 0)
		);

	end entity Full_adder;
--------------------------------------------------
Architecture structural of Full_adder is 
signal C_1, C_2, C_3, C_4, C_5, C_6, C_7, C_8, C_9, C_10, C_11, C_12, C_13, C_14 :std_logic;
begin
	
	Fulladdermodule_0: entity work.Full_adderOne
	port map(
	A => OP1(0),
	B => OP2(0),
	Cin => Carry_in,
	Res => Total(0),
	Cout => C_1
	);
	
	Fulladdermodule_1: entity work.Full_adderOne
	port map(
	A => OP1(1),
	B => OP2(1),
	Cin => C_1,
	Res => Total(1),
	Cout => C_2
	);
	
	Fulladdermodule_2: entity work.Full_adderOne
	port map(
	A => OP1(2),
	B => OP2(2),
	Cin => C_2,
	Res => Total(2),
	Cout => C_3
	);
	
	Fulladdermodule_3: entity work.Full_adderOne
	port map(
	A => OP1(3),
	B => OP2(3),
	Cin => C_3,
	Res => Total(3),
	Cout => C_4
	);
	
	Fulladdermodule_4: entity work.Full_adderOne
	port map(
	A => OP1(4),
	B => OP2(4),
	Cin => C_4,
	Res => Total(4),
	Cout => C_5
	);
	
	Fulladdermodule_5: entity work.Full_adderOne
	port map(
	A => OP1(5),
	B => OP2(5),
	Cin => C_5,
	Res => Total(5),
	Cout => C_6
	);
	
	Fulladdermodule_6: entity work.Full_adderOne
	port map(
	A => OP1(6),
	B => OP2(6),
	Cin => C_6,
	Res => Total(6),
	Cout => C_7
	);
	
	Fulladdermodule_7: entity work.Full_adderOne
	port map(
	A => OP1(7),
	B => OP2(7),
	Cin => C_7,
	Res => Total(7),
	Cout => C_8
	);
	
	Fulladdermodule_8: entity work.Full_adderOne
	port map(
	A => OP1(8),
	B => OP2(8),
	Cin => C_8,
	Res => Total(8),
	Cout => C_9
	);
	
	Fulladdermodule_9: entity work.Full_adderOne
	port map(
	A => OP1(9),
	B => OP2(9),
	Cin => C_9,
	Res => Total(9),
	Cout => C_10
	);
	
	Fulladdermodule_10: entity work.Full_adderOne
	port map(
	A => OP1(10),
	B => OP2(10),
	Cin => C_10,
	Res => Total(10),
	Cout => C_11
	);
--	
--	Fulladdermodule_11: entity work.Full_adderOne
--	port map(
--	A => OP1(11),
--	B => OP2(11),
--	Cin => C_11,
--	Res => Total(11),
--	Cout => C_12
--	);
--	
--	Fulladdermodule_12: entity work.Full_adderOne
--	port map(
--	A => OP1(12),
--	B => OP2(12),
--	Cin => C_12,
--	Res => Total(12),
--	Cout => C_13
--	);
--	
--	Fulladdermodule_13: entity work.Full_adderOne
--	port map(
--	A => OP1(13),
--	B => OP2(13),
--	Cin => C_13,
--	Res => Total(13),
--	Cout => C_14
--	);
--	
	
	
	

end architecture structural; 
	
