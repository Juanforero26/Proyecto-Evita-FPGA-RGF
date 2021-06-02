library IEEE;
USE ieee.std_logic_1164.all;

Entity Posicion_Jugador is
    port(
		  
		 clk: in std_Logic;
		 rst: in std_Logic;
       Nueva_Posicion			: In Std_logic_vector(19 downto 0);
		 Control_PJ				   : In Std_Logic;
		 Posicion_Ancla			: Out Std_logic_vector(19 downto 0)
		  
		  
    );
End Entity Posicion_Jugador;

architecture Posicion_Jugador_arch of Posicion_Jugador is
   
Signal D: Std_logic_vector(19 downto 0);	
Signal Q: Std_logic_vector(19 downto 0);	
Signal en: Std_Logic;

begin
en<= Control_PJ;
D<= Nueva_Posicion ;-- "01011001110011110000";
Posicion_Ancla<= Q ;


ALM_module_0: entity work.my_dff
	port map(
	
		   Reloj  => clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(0),	
			Qs		 => Q(0)	
	);
	
	ALM_module_1: entity work.my_dff
	port map(
	
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(1),	
			Qs		 => Q(1)	
			
	);
	
	ALM_module_2: entity work.my_dff
	port map(
	
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(2),	
			Qs		 => Q(2)
	);
	
	ALM_module_3: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(3),	
			Qs		 => Q(3)	
			
	);
	
	ALM_module_4: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(4),	
			Qs		 => Q(4)
			
	);
	
	ALM_module_5: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(5),	
			Qs		 => Q(5)
			
	);
	
	ALM_module_6: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(6),	
			Qs		 => Q(6)
	);
	
	ALM_module_7: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(7),	
			Qs		 => Q(7)
			
	);
	
	ALM_module_8: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(8),	
			Qs		 => Q(8)
			
	);
	
	ALM_module_9: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(9),	
			Qs		 => Q(9)
	);
	
	ALM_module_10: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(10),	
			Qs		 => Q(10)	
			
	);
	
	ALM_module_11: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(11),	
			Qs		 => Q(11)
			
	);
	
	ALM_module_12: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(12),	
			Qs		 => Q(12)	
			
	);
	
	ALM_module_13: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(13),	
			Qs		 => Q(13)	
			
	);
	
	ALM_module_14: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(14),	
			Qs		 => Q(14)	
			
	);
	
	ALM_module_15: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(15),	
			Qs		 => Q(15)	
			
	);
	
	ALM_module_16: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(16),	
			Qs		 => Q(16)	
			
	);
	
	ALM_module_17: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(17),	
			Qs		 => Q(17)	
			
	);
	
	ALM_module_18: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(18),	
			Qs		 => Q(18)	
			
	);
	
	ALM_module_19: entity work.my_dff
	port map(
	
			
			Reloj=> clk,	
			Clear	 => rst,	
			Preset => '0',
			Enable => en,	
			Numero => D(19),	
			Qs		 => Q(19)	
			
	);
	
	
End architecture Posicion_Jugador_arch;