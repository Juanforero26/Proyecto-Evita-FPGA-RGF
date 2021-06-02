LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-------------------------------------
ENTITY Visible_F_tb IS
END ENTITY Visible_F_tb;
-------------------------------------
ARCHITECTURE testbench OF Visible_F_tb IS

  
					signal	Control_Visible_F_tb		:	 STD_LOGIC := '0';
					signal	clk_tb						:	 STD_LOGIC := '0';
					signal   rst_tb						:	 STD_LOGIC := '0';
					signal	Npulsos_tb		  			:	 STD_LOGIC_VECTOR(1 DOWNTO 0);
					signal	HsyncValor_tb				:	 STD_LOGIC_VECTOR(9 DOWNTO 0);
					signal	VsyncValor_tb				:	 STD_LOGIC_VECTOR(9 DOWNTO 0);
					signal 	H_Video_On1_tb				:	 STD_LOGIC;
					signal 	V_Video_On1_tb				:	 STD_LOGIC;
					signal	Hsync1_tb						:	 STD_LOGIC;
					signal	Vsync1_tb						:	 STD_LOGIC;
					signal cl_tb:std_LOGIC;
		
					Signal R_tb 							:std_Logic_vector(3 downto 0);
					Signal G_tb							: std_Logic_vector(3 downto 0);	
					Signal B_tb							: std_Logic_vector(3 downto 0);
					Signal MUX_visible_tb:std_Logic_vector(2 downto 0);
					
					
	
					
	
	
BEGIN	--CLOCK GENERATION:------------------------
	clk_tb <= not clk_tb after 100ps; -- 50MHz clock generation
	--RESET GENERATION:------------------------
	rst_tb <= '0' after 10ps ,'1' after 100ps  ;
	Control_Visible_F_tb <= '1' after 100ps ;
	
	
	
	dut: ENTITY work.Visible_F
	
		  port MAP(
				  Control_visible_F			=>Control_Visible_F_tb,
				  clk							=>clk_tb,
				  rst							=>rst_tb,
				   MUX_visible => MUX_visible_tb,
				  HsyncValor				=>HsyncValor_tb,
				  VsyncValor				=>VsyncValor_tb,
				 			
				  Hsync1			=> Hsync1_tb,			
		        Vsync1		=> Vsync1_tb,
				  clk25MHz => cl_tb,
					Rs=>R_tb,
					Gs=>G_tb,
					Bs=>B_tb
				  
			 );

						
END ARCHITECTURE testbench;