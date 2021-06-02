Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
----------------------------------------------
Entity debounce_control Is
	Port(
			------------Clocks y linea de reset
			Rst  :In Std_logic;
			Clk	:In Std_logic;
			-------------Inputs--------------------------
			Button :in std_logic;
			Timer_control :in std_logic;
			Timer_control1 :in std_logic;
			Timer_control2 :in std_logic;
			---------------Outputs-----------------------
			Timer_e : out std_logic;
			Timer_e1:out std_logic;
			Timer_c : out std_logic;
			Timer_e2: out std_logic;
			deb_sw : out std_logic
			
			);
end entity debounce_control;
			
Architecture Arch of debounce_control is

	Type State is(State0,State1,State2, State3, State4, State5, State6, State7);---- Se ponen la cantidad de states que se necesiten por estados que tengamos
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
	
	Process(Button,Pr_State,Timer_control, Timer_control1, Timer_control2)
		Begin	
			Case Pr_State is
			
				When State0 =>
					deb_sw <= '0'; 
					Timer_e <= '0'; 
					Timer_e1 <= '0';
					Timer_c <=  '1';
					Timer_e2 <= '0';
		
				--TODAS LAS SEÑALESS!!!!
					If( Button = '0')Then --AA El valor que se quiera segun logica 
					 
					Nx_State<=State0;
					
					Else			
					Nx_State<=State1;	
					End If;
					
				When State1 =>
					deb_sw <=  '0';
					Timer_e <= '1'; 
					Timer_e1 <= '0';
					Timer_c <=  '0';
					Timer_e2 <= '0';
			
			
					If( Timer_control = '1' and Button = '1' )Then 
					 
					Nx_State<=State2;
					
					Else 
					
					Nx_State <= State1;
				-- Se pondria condicion 
					End If;
				
				When State2 =>
				
					deb_sw <=  '0';
					Timer_e <= '0'; 
					Timer_e1 <= '0';
					Timer_c <=  '0';
				   Timer_e2 <= '0';	
					Nx_State <= State3;	
			
				When State3 =>
				
					deb_sw <=  '0';
					Timer_e <= '0';
					Timer_e1 <= '1';	
					Timer_c <= '0';
					Timer_e2 <= '0';
		
			
					If( Timer_control1 = '1' and Button = '1' )Then 
					 
					Nx_State<=State4;
					
					Else 
					
					Nx_State <= State3;
				-- Se pondria condicion 
					End If;
					
				
					
				When State4 =>
				deb_sw <=  '0';
				Timer_e<= '0';
				Timer_e1 <= '0'; 
				Timer_c <= '0';
				Timer_e2 <= '1';

			
					If( Timer_control2 = '1' and Button = '1' )Then 
					 
					Nx_State<=State5;
					
					Else 
					
					Nx_State <= State4;
				-- Se pondria condicion 
					End If;
				
				When State5 =>
				deb_sw <=  '1';
				Timer_e <= '0'; 
				Timer_e1 <= '0';
				Timer_c <= '1';
				
					
				Nx_State <= State6;
				
				When State6 =>
				deb_sw <=  '1';
				Timer_e <= '0'; 
				Timer_e1 <= '0';
				Timer_c <= '1';
				
					
				Nx_State <= State7;
				
				When State7 =>
				deb_sw <=  '1';
				Timer_e <= '0'; 
				Timer_e1 <= '0';
				Timer_c <= '1';
				
					
				Nx_State <= State0;
				
				
							
			End Case;
		End Process;
	End Architecture Arch;