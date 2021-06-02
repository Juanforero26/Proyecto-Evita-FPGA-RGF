LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY contador_universal IS 
	GENERIC		(	N				:	INTEGER	:= 23;
						C				:  UNSIGNED := "01001100010010110100000"; --"01001100010010110100000"
						R				:	UNSIGNED := "01001100010010110100000"
	);
	PORT			(	clk			:	IN STD_LOGIC;
						rst			:	IN STD_LOGIC;
						ena			:	IN STD_LOGIC;
						syn_clr		:	IN STD_LOGIC;
						load			:	IN STD_LOGIC;
						up				:	IN STD_LOGIC;
						d				:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
						max_tick		:	OUT STD_LOGIC;
						min_tick		:	OUT STD_LOGIC;
						counter		:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
						
END ENTITY;
--(OTHERS => '0' ) WHEN syn_clr= '1'			    ELSE
ARCHITECTURE rtl OF contador_universal IS
	--CONSTANT C				:	UNSIGNED(N-1 DOWNTO 0)	:= (OTHERS => '1' );
	CONSTANT ZEROS			:	UNSIGNED(N-1 DOWNTO 0)	:= (OTHERS => '0');

	SIGNAL count_s			:	UNSIGNED(N-1 DOWNTO 0);
	SIGNAL count_next		:	UNSIGNED(N-1 DOWNTO 0);
	Signal Count_rst		: Std_logic;
	signal rsto :std_LOGIC;
	
BEGIN

   
	
	count_next <=		
							(OTHERS => '0' )  WHEN Count_rst = '1'			  ELSE
							UNSIGNED(d)    WHEN load =   '1'			     ELSE
							count_s + 1       WHEN (ena = '1' AND up= '1') ELSE
							count_s - 1       WHEN (ena = '1' AND up= '0') ELSE
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
			if (count_s = C ) then
				max_tick <= '1';
						
		else max_tick <= '0';
	
		end if;
		END IF;
		counter <= STD_LOGIC_VECTOR(temp);
		count_s <= temp;
	END PROCESS;
	
	--max_tick <= '1' WHEN count_s = C  ELSE '0';
	min_tick <= '1' WHEN count_s = ZEROS ELSE '0';
	Count_rst<=	'1' WHEN count_s = R  ELSE '0';
	
END ARCHITECTURE;
							