library IEEE;
USE ieee.std_logic_1164.all;

Entity Visible_F is --Control vga del sistem 
    port(
        Control_Visible_F			: In Std_logic;
		  clk							: In Std_Logic;
		  rst							: In Std_logic; 
		  MUX_visible				: In std_logic_vector(2 downto 0);
		  
		  HsyncValor				: Out Std_Logic_vector(9 downto 0);
		  VsyncValor				: Out Std_Logic_vector(9 downto 0);
		 

		  Hsync1						: Out Std_logic;
		  Vsync1						: Out Std_logic;
		  
		  clk25MHz:out std_Logic;
		  Contador525s:out std_Logic;
		  Contador800s:out std_Logic;
		  Rs							:Out std_Logic_vector(3 downto 0);
		  Gs							:Out std_Logic_vector(3 downto 0);	
		  Bs							:Out std_Logic_vector(3 downto 0)
		  
    );
End Entity Visible_F;

architecture Visible_F_arch of Visible_F is
  

signal clear,en1,clk1, en2,en3 ,en4,en5,en6,en8,en7,en9,en10,Max_fn, m,m1,m2,m3,m4,m5,m6,m7,m8, en_2, en_3,R_s,G_s,B_s: std_logic;
 
  
  
Signal VvideoOn,HvideoOn,Contador_2_Pulsos, Contador800 ,Contador525,Contador_520,ContadorVvideoOn,Contador16px,ContadorHvideoOn,ContadorVvideoOn1, Contador48px,Contador33px,ContadorRetraceH,ContadorRetraceV, Contador10, Control_10, Control_Retraceh,Control_contador16,Blank ,Control_contador640,Control_contador48,Control_Contador33, C_Pulsos, Contador_RTV, H_Vid_On, V_Vid_On, H_sync, V_sync, Control_clear, Contador_480px: Std_Logic;
Signal Hvalor,V680: Std_logic_vector(9 downto 0);
Signal Pulsos,VRetraceV: Std_Logic_vector(1 downto 0);
Signal V16: Std_Logic_vector(4 downto 0);
Signal HVOn: Std_Logic_vector(5 downto 0);
Signal VVOn: Std_Logic_vector(5 downto 0);
Signal VRetraceH: Std_Logic_vector(6 downto 0);
Signal V480,V480P : Std_Logic_vector(8 downto 0);
Signal Count10: Std_Logic_vector(3 downto 0);
Signal video_on: std_logic;
Signal Vvalor :std_Logic_vector(9 downto 0);
begin
video_on <= HvideoOn and VvideoOn;
clear<=not Control_Visible_F;
HsyncValor<=Hvalor;
VsyncValor<=Vvalor;
clk25MHz<=clk1;

Rs(0)<=R_s;
Rs(1)<=R_s;		
Rs(2)<=R_s;		
Rs(3)<=R_s;				

Gs(0)<=G_s;
Gs(1)<=G_s;		
Gs(2)<=G_s;		
Gs(3)<=G_s;				

Bs(0)<=B_s;
Bs(1)<=B_s;		
Bs(2)<=B_s;		
Bs(3)<=B_s;				
--clk1<= clk;
Contador800s <= Contador800;
Contador525s <= Contador525;

PLLa: entity work.PLL
	Port Map(
		clk=>clk,
		rst=>rst,
		clk_s=>clk1);

ContadorHFun:entity work.ContadorHFuncionando
	Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>Control_Visible_F,
						syn_clr		=>clear,
						max_tick		=>Contador800,
			
						counter		=>Hvalor,
						Hsync			=>Hsync1,
						H_on			=>HvideoOn
			
			);

ContadorVFun:entity work.ContadorVFuncionando
	Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>Contador800,
						syn_clr		=>clear,
						max_tick		=>Contador525,

						counter		=>Vvalor,
						Vsync			=>Vsync1,
						V_on			=>VvideoOn
		);
	
RGB1: entity work.RGB
 Port map(
					clk => clk1,
 rst=>rst,
 H_Valor=> Hvalor,
 V_Valor=> Vvalor,
 OBJT=> MUX_visible,
 R=>R_s,
 G=>G_s,
 B=>B_s
 
					
					); 
						
End architecture Visible_F_arch;