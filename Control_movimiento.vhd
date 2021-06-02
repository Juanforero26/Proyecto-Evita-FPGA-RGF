Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
----------------------------------------------
Entity Control_movimiento Is
Port(
Rst :In Std_logic;
Clk :In Std_logic;
Start:In Std_logic;
Pause:In Std_logic;
--Max tic y comparacion
Timer_FPS:in std_logic;
Comp_Botones :In std_logic;
Fin_VGA :In std_logic;

--Enables contadores y bloques
Control_PJ :Out std_logic;
Control_A_PA:Out std_logic;
Alm_Botones :Out std_logic;
Control_Er :Out std_logic;
Timer_e :Out std_logic

);
end entity Control_movimiento; 

architecture Control_movimiento_arch of Control_movimiento is
--Este bloque se encarga de llevar el debido proceso de las acciones del sistema, decidiendo segun corresponda y en el estado que se encuentre.

 


component dffe is
port(d, clk, clrn, prn, ena: in std_logic;
q: out std_logic
);
end component;
signal D,igual_tmp: std_logic_vector (6 downto 0);
signal E: std_logic;
signal Q,Estados: std_logic_vector (6 downto 0);
signal reinicio,Reloj: std_logic;
begin

    
    D(0)<=('0');
    D(1)<=(Q(0)or (Q(1)and(not Start))or(Q(2)and(not Start)and(not Comp_Botones))or (Q(2)and(not Start)and( Comp_Botones)));
    D(2)<=(Q(1) and Start)or(Q(2)and (Start)and(not Comp_Botones))or(Q(6));
    D(3)<=(Q(2)and Start and Comp_Botones);
    D(4)<=(Q(3)or (Q(4)and(not Timer_FPS)));
    D(5)<=( (Q(4)and (Timer_FPS)))or(Q(5)and(not Pause)and (not Fin_VGA)) or (Q(5)and(Pause)and (not Fin_VGA)) or (Q(5)and(Pause)and (Fin_VGA));
    D(6)<=(Q(5)and(not Pause)and Fin_VGA);
    

 

 


    E <= '1';
    reinicio<= (not Rst);
    Reloj<=Clk;

 


    FF0: dffe port map (D(0), Reloj, '1', reinicio, E ,Q(0));
    FF1: dffe port map (D(1), Reloj, reinicio, '1', E ,Q(1));
    FF2: dffe port map (D(2), Reloj, reinicio, '1', E ,Q(2));
    FF3: dffe port map (D(3), Reloj, reinicio, '1',E ,Q(3));
    FF4: dffe port map (D(4), Reloj, reinicio, '1', E ,Q(4));
    FF5: dffe port map (D(5), Reloj, reinicio, '1', E ,Q(5));
    FF6: dffe port map (D(6), Reloj, reinicio, '1', E ,Q(6));


 

 

 

 

    Estados<=Q;
	 
    Control_PJ         <= Q(1)or Q(6);
    Control_A_PA        <= Q(3);    
    Alm_Botones          <= Q(2);
    Control_Er       <= Q(1);
    Timer_e              <= Q(2)or Q(3)or Q(4);

 

end Control_movimiento_arch;