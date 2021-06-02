Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
----------------------------------------------
Entity Control_General Is
Port(
Rst :In Std_logic;
Clk :In Std_logic;
Inicio :In std_logic;
Pause :In std_logic;
--Max tic y comparacion
Game_Over_comp :In std_logic;
----------------------------
Start_FSM :Out std_logic;
Start_IMG :Out std_logic;
Pause_FSM:Out std_logic;
Game_Over_Start :Out std_logic

);
end entity Control_General;
Architecture Arch of Control_General is

 Type State is(State0,State1,State2,State3, State4 ); --State6, State7, State8,State9);---- Se ponen la cantidad de states que se necesiten por estados que tengamos
Signal Pr_State,Nx_State:State;

Begin
	Process(Rst,Clk)
		Begin
			If(Rst='1')Then
				Pr_State<=State0;
			Elsif(Rising_edge(Clk))Then
				Pr_State<=Nx_State;
			End If;
			End Process;

			Process(Inicio, Game_Over_comp, Pause)
				Begin
					Case Pr_State is
						When State0 =>
						------------enables--------------------------
						Start_FSM <= '0';
						Start_IMG <= '0';
						Pause_FSM <= '0';
						Game_Over_Start <= '0'; 
							
						--TODAS LAS SEÑALESS!!!!
						If( Inicio = '1') Then --AA El valor que se quiera segun logica
							Nx_State<=State1;
						Else
						--
							Nx_State<=State0;
						End If;
						--LOS IF SON CM LAS "EX" DE LOS DATA
						When State1 =>
						------------enables--------------------------
						Start_FSM <= '1';
						Start_IMG <= '1';
						Pause_FSM <= '0';
						Game_Over_Start <= '0'; 	
						
						If( Game_Over_comp = '1') Then --AA El valor que se quiera segun logica
							Nx_State<=State2;
						Elsif (Pause ='1') then 
							Nx_State <= State3;
						Else
							Nx_State<=State1;
						End If;

						When State2 =>
						Start_FSM <= '0';
						Start_IMG <= '0';
						Pause_FSM <= '0';
						Game_Over_Start <= '1';
						
						If( Inicio = '1') Then --AA El valor que se quiera segun logica
							Nx_State<=State4;
						Else
							Nx_State<=State2;
						End If;
						
						When State3 =>
						Start_FSM <= '1';
						Start_IMG <= '0';
						Pause_FSM <= '1';
						Game_Over_Start <= '0';
						
						If( Pause = '1') Then --AA El valor que se quiera segun logica
							Nx_State<=State3;
						Else
							Nx_State<=State1;
						End If;
						
						
						When State4 =>
						Start_FSM <= '0';
						Start_IMG <= '0';
						Pause_FSM <= '0';
						Game_Over_Start <= '1';
						
						If( Inicio = '1') Then --AA El valor que se quiera segun logica
							Nx_State<=State4;
						Else
							Nx_State<=State0;
						End If;
						




End Case;
End Process;
End Architecture Arch;