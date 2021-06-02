LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ContadorHFuncionando IS 
	GENERIC		(	N				:	INTEGER	:= 10;
						C				:  UNSIGNED := "1100011111"; --"00000000000000000001000"
															
						R				:	UNSIGNED := "1100011111"
	);
	PORT			(	clk			:	IN STD_LOGIC;
						rst			:	IN STD_LOGIC;
						ena			:	IN STD_LOGIC;
						syn_clr		:	IN STD_LOGIC;
						max_tick		:	OUT STD_LOGIC;
						counter		:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						Hsync			: Out std_logic;
						H_on			: Out std_logic
						
						);
						
END ENTITY;

ARCHITECTURE rtl OF ContadorHFuncionando IS
	
	CONSTANT ZEROS			:	UNSIGNED(N-1 DOWNTO 0)	:= (OTHERS => '0');

	SIGNAL count_s			:	UNSIGNED(N-1 DOWNTO 0);
	SIGNAL count_next		:	UNSIGNED(N-1 DOWNTO 0);
	Signal Count_rst		: Std_logic;
	signal rsto :std_LOGIC;
	
	CONSTANT h_a: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(96,N) ;
	CONSTANT h_b: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(799,N) ;
	CONSTANT h_c: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(144,N) ;
	CONSTANT h_d: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(784,N) ;
	
BEGIN

	
	count_next <=		
						(OTHERS => '0' )  WHEN Count_rst = '1'			  ELSE
				
							count_s + 1       WHEN (ena = '1') ELSE
					
							(OTHERS => '0' )  WHEN syn_clr = '1'			  ELSE
							
							count_s;
							
							
	PROCESS(clk,rst,ena, syn_clr)
		VARIABLE temp	:	UNSIGNED(N-1 DOWNTO 0);
	BEGIN
		IF(rst ='1')	THEN
			temp := (OTHERS => '0');
		ELSIF (rising_edge(clk)) THEN
		   if (syn_clr = '1') then 
			 temp := (others => '0');
		elsIF (ena='1')	THEN
				temp := count_next;
			END IF;		

	   end if;
		counter <= STD_LOGIC_VECTOR(temp);
		count_s <= temp;
	END PROCESS;
	
	
	Count_rst<=	'1' WHEN count_s = R  ELSE '0';
	max_tick <= '1' WHEN count_s= h_b ELSE '0';
	Hsync <= '1' WHEN count_s >= h_a and count_s < h_b ELSE '0';
	H_on <= '1' WHEN count_s >= h_c and count_s < h_d ELSE '0';
	
END ARCHITECTURE;
							