LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ContadorVFuncionando IS 
	GENERIC		(	N				:	INTEGER	:= 10;
						C				:  UNSIGNED := "1000001100"; --"00000000000000000001000"
															
						R				:	UNSIGNED := "1000001100" 
	);
	PORT			(	clk			:	IN STD_LOGIC;
						rst			:	IN STD_LOGIC;
						ena			:	IN STD_LOGIC;
						syn_clr		:	IN STD_LOGIC;
					
						max_tick		:	OUT STD_LOGIC;
					
						counter		:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						Vsync			: Out std_logic;
						V_on			: Out std_logic
						
						);
						
END ENTITY;

ARCHITECTURE rtl OF ContadorVFuncionando IS
	
	CONSTANT ZEROS			:	UNSIGNED(N-1 DOWNTO 0)	:= (OTHERS => '0');

	SIGNAL count_s			:	UNSIGNED(N-1 DOWNTO 0);
	SIGNAL count_next		:	UNSIGNED(N-1 DOWNTO 0);
	Signal Count_rst		: Std_logic;
	signal rsto :std_LOGIC;
	CONSTANT v_a: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(2,N) ;
	CONSTANT v_b: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(524,N) ;
	CONSTANT v_c: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(35,N) ;
	CONSTANT v_d: UNSIGNED(N-1 DOWNTO 0) := to_unsigned(515,N) ;
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
	max_tick <= '1' WHEN count_s= v_b ELSE '0';
	Vsync <= '1' WHEN count_s >= v_a and count_s < v_b ELSE '0';
	V_on <= '1' WHEN count_s >= v_c and count_s < v_d ELSE '0';
	
	
END ARCHITECTURE;
							