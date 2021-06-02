library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

 

library ALTERA;
use ALTERA.altera_primitives_components.all;
--Declaracion de la entidad control
entity Control_movimiento_MOD is
    port(
            Rst :In Std_logic;
            Clk :In Std_logic;
            Start:In Std_logic;
            Pause:in std_logic;
            --Max tic y comparacion
            Timer_FPS:in std_logic;
            Comp_Botones :In std_logic;
            Fin_VGA :In std_logic;

 

            --Enables contadores y bloques
            Control_P1_P :Out std_logic;
            Control_P2_P :Out std_logic;
            Control_P3_P :Out std_logic;
            Control_P4_P :Out std_logic;
            Control_P5_P :Out std_logic;
            Control_P6_P :Out std_logic;
            Control_P7_P :Out std_logic;
--            Control_P8_P :Out std_logic;
--				Control_P9_P :Out std_logic;
--				Control_P10_P :Out std_logic;
--				Control_P11_P :Out std_logic;
--				Control_P12_P :Out std_logic;
--				Control_P13_P :Out std_logic;
--				Control_P14_P :Out std_logic;
				

 

            Control_Ac_P1:Out std_logic;
            Control_Ac_P2:Out std_logic;
            Control_Ac_P3:Out std_logic;
            Control_Ac_P4:Out std_logic;
            Control_Ac_P5:Out std_logic;
            Control_Ac_P6:Out std_logic;
            Control_Ac_P7:Out std_logic;
--            Control_Ac_P8:Out std_logic;
--				Control_Ac_P9:Out std_logic;
--				Control_Ac_P10:Out std_logic;
--				Control_Ac_P11:Out std_logic;
--				Control_Ac_P12:Out std_logic;
--				Control_Ac_P13:Out std_logic;
--				Control_Ac_P14:Out std_logic;
				
            Alm_Botones :Out std_logic;
            Control_INI_P1 :Out std_logic;
            Control_INI_P2 :Out std_logic;
            Control_INI_P3 :Out std_logic;
            Control_INI_P4 :Out std_logic;
            Control_INI_P5 :Out std_logic;
            Control_INI_P6 :Out std_logic;
            Control_INI_P7 :Out std_logic;
--            Control_INI_P8 :Out std_logic;
--				Control_INI_P9 :Out std_logic;
--				Control_INI_P10 :Out std_logic;
--				Control_INI_P11 :Out std_logic;
--				Control_INI_P12 :Out std_logic;
--				Control_INI_P13 :Out std_logic;
--				Control_INI_P14 :Out std_logic;
            Timer_e :Out std_logic
--            Estadoss:out std_logic_vector(6 downto 0)

 

            );
end entity Control_movimiento_MOD;
--Este bloque se encarga de llevar el debido proceso de las acciones del sistema, decidiendo segun corresponda y en el estado que se encuentre.

 

architecture Control_movimiento_MOD_arch of Control_movimiento_MOD is
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
    Control_P1_P           <=Q(1)or Q(6);
    Control_P2_P           <=Q(1)or Q(6);
    Control_P3_P           <=Q(1)or Q(6);
    Control_P4_P           <=Q(1)or Q(6);
    Control_P5_P           <=Q(1)or Q(6);
    Control_P6_P           <=Q(1)or Q(6);
    Control_P7_P           <=Q(1)or Q(6);
--    Control_P8_P           <=Q(1)or Q(6);
--	 Control_P9_P           <=Q(1)or Q(6);
--	 Control_P10_P           <=Q(1)or Q(6);
--	 Control_P11_P           <=Q(1)or Q(6);
--	 Control_P12_P           <=Q(1)or Q(6);
--	 Control_P13_P           <=Q(1)or Q(6);
--	 Control_P14_P           <=Q(1)or Q(6);
	 
    Control_Ac_P1               <=                    Q(3);
    Control_Ac_P2         <=                    Q(3);
    Control_Ac_P3         <=                    Q(3);
    Control_Ac_P4         <=                    Q(3);
    Control_Ac_P5         <=                    Q(3);
    Control_Ac_P6            <=                    Q(3);
    Control_Ac_P7         <=                    Q(3);
--    Control_Ac_P8         <=                    Q(3);
--	 Control_Ac_P9         <=                    Q(3);
--	 Control_Ac_P10         <=                    Q(3);
--	 Control_Ac_P11         <=                    Q(3);
--	 Control_Ac_P12         <=                    Q(3);
--	 Control_Ac_P13         <=                    Q(3);
--	 Control_Ac_P14         <=                    Q(3);
    Alm_Botones               <=            Q(2);
    Control_INI_P1       <=Q(1);
    Control_INI_P2       <=Q(1);
    Control_INI_P3       <=Q(1);
    Control_INI_P4       <=Q(1);
    Control_INI_P5       <=Q(1);
    Control_INI_P6       <=Q(1);
    Control_INI_P7       <=Q(1);
--    Control_INI_P8       <=Q(1);
--	 Control_INI_P9       <=Q(1);
--	 Control_INI_P10       <=Q(1);
--	 Control_INI_P11       <=Q(1);
--	 Control_INI_P12       <=Q(1);
--	 Control_INI_P13       <=Q(1);
--	 Control_INI_P14       <=Q(1);
	 
    Timer_e                  <=           Q(2)or Q(3)or Q(4);

 

end Control_movimiento_MOD_arch;