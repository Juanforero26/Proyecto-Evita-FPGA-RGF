library IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity JUEGO_VGA is
   port(
       
		 clk :in std_logic;
		 rst: in std_logic;
		 Start:in std_logic;
		 Pausa:in std_logic;
		 B_Arriba: in std_logic;
		 B_Abajo: in std_logic; 
		 B_Izquierda:in std_logic;
		 B_Derecha: in std_logic;
       R:out std_logic_vector(3 downto 0);
		 G:out std_logic_vector(3 downto 0);
		 B:out std_logic_vector(3 downto 0);
		 HS:out std_logic;
		 VS:out std_logic
		  
    );
End Entity JUEGO_VGA;

architecture JUEGO_VGA_arch of JUEGO_VGA is
-------------------------------------------------------------------------------------------
signal Trash0, Trash1, Trash2, Trash3, Trash4, Trash5, Trash6,Trash7,Trash8,Trash9,Trash10,Trash11,Trash12,Trash13,Trash14,Trash15,Trash16,Trash17,Trash18,Trash19,Trash20,Trash21,Trash22,Trash23,Trash24,Trash25,Trash26,Trash27,Trash28,Trash29,Trash30,Trash31,Trash32,Trash33,Trash34,Trash35,Trash36,Trash37,Trash38,Trash39,Trash40,Trash41,Trash42,Trash43,Trash44,Trash45,Trash46,Trash47,Trash48,Trash49,Trash50,Trash51,Trash52,Trash53,Trash54,Trash55,Trash56,Trash57,Trash58,Trash59,Trash60,Trash61,Trash62,Trash63,Trash64,Trash65,Trash66,Trash67,Trash68,Trash69,Trash70,Trash71,Trash72,Trash73,Trash74,Trash75,Trash76,Trash77,Trash78,Trash79,Trash80:std_logic; --basura
----------------------------------------------------------------------------------------------
signal G_O_Control,clk1:std_logic; --INDICADOR DE GAME OVER 
signal VE, ENABLE_GO, ENABLE_PS:std_logic; --habilitadores
signal  Screen_X, Screen_Y: std_logic_vector(9 downto 0); --señales de conteo 
signal Salida_MUX:std_logic_vector(2 downto 0); --salidas de MUXes
signal C_525, C_800:std_logic; --señales para el fin vga de control movimiento 
signal Fin_VGAC:std_logic;
signal P1_MUX,P2_MUX,P3_MUX,P4_MUX,P5_MUX,P6_MUX,P7_MUX,P8_MUX,P9_MUX,P10_MUX,P11_MUX,P12_MUX,P13_MUX,P14_MUX,P15_MUX,P16_MUX,P17_MUX,P18_MUX,J_MUX,GM_MUX,PS_MUX,LETRA_A,LETRA_A2,LETRA_E,LETRA_E2,LETRA_E3,LETRA_G,LETRA_M,LETRA_O,LETRA_P,LETRA_R,LETRA_S,LETRA_U,LETRA_V :std_logic_vector(2 downto 0);--entradas para mux
signal  PARAGO :std_logic_vector(3 downto 0); --seleccion de MUXES
signal PARA_VISIBLE:std_logic_vector(4 downto 0);
signal PARAPS, F_MUX:std_logic_vector(2 downto 0); --seleccion mux pausa
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
signal Pos_XY_X,Pos_XY_Y,Pos_XY_X_P1,Pos_XY_Y_P1,Pos_XY_X_P2,Pos_XY_Y_P2,Pos_XY_X_P3,Pos_XY_Y_P3,Pos_XY_X_P4,Pos_XY_Y_P4,Pos_XY_X_P5,Pos_XY_Y_P5,Pos_XY_X_P6,Pos_XY_Y_P6,Pos_XY_X_P7,Pos_XY_Y_P7,Pos_XY_X_P8,Pos_XY_Y_P8:std_logic_vector(9 downto 0); --entradas al comparador general de cada personaje
signal C_P1_e,C_P2_e,C_P3_e,C_P4_e,C_P5_e,C_P6_e,C_P7_e,C_P8_e,C_J_e:std_logic; --habilitadores para las ROM de los personajes y el jugador
signal CLG_e,CLA_e,CLM_e,CLE_e,CLO_e,CLV_e,CLE2_e,CLR_e:std_logic; --habilitadores para las ROM de las letras de GAME OVER 
signal CLP_e,CLA2_e,CLU_e,CLS_e,CLE3_e:std_logic; --habilitadores para las ROM de las letras PAUSE
signal Control_pos_P1,Control_pos_P2,Control_pos_P3,Control_pos_P4,Control_pos_P5,Control_pos_P6,Control_pos_P7,Control_pos_P8,
Control_pos_P9,Control_pos_P10,Control_pos_P11,Control_pos_P12,Control_pos_P13,Control_pos_P14,Control_pos_P15,Control_pos_P16,Control_pos_P17,Control_pos_P18:std_logic; --habilitadores de los almacenamientos de posicion que van a ser comparados
signal Control_A_P1,Control_A_P2,Control_A_P3,Control_A_P4,Control_A_P5,Control_A_P6,Control_A_P7,Control_A_P8,
Control_A_P9,Control_A_P10,Control_A_P11,Control_A_P12,Control_A_P13,Control_A_P14,Control_A_P15,Control_A_P16,Control_A_P17,Control_A_P18:std_logic; --habilitadores de los almacenamientos que van a ser operados en el bloque de MOVIMIENTO_JUGADOR 
signal Control_P1,Control_P2,Control_P3,Control_P4,Control_P5,Control_P6,Control_P7,Control_P8:std_logic; --determinan la posicion inicial de cada monachito excepto del jugador
signal Go_time_P1,Time_up_1,Clr_P1, Clr_P2, Clr_P3: std_logic; --habilita el Timer de fps para los monachitos
signal Go_time, Time_up,Clr,Time_up_2, Go_time_P2, Go_time_P3, Time_up_3 :std_logic;--habilita timer fps del jugador
signal Comp_BotonesC, Control_A, Control_pos, ALM_E, Control_Ernie : std_logic; --salidas y entradas del control de movimiento del jugador
signal Inicio, Inicio_IMG, Control_Pause, Control_G_O : std_logic; 
signal Pos_XY_P1, Ancla_P1, Actual_P1,Op_P1,Pos_XY_P2, Ancla_P2, Actual_P2,Op_P2,Pos_XY_P3, Ancla_P3, Actual_P3,Op_P3,Pos_XY_P4, Ancla_P4, Actual_P4,Op_P4,Pos_XY_P5, Ancla_P5, Actual_P5,Op_P5,Pos_XY_P6, Ancla_P6, Actual_P6,Op_P6,Pos_XY_P7, Ancla_P7, Actual_P7,Op_P7,Pos_XY_P8, Ancla_P8, Actual_P8,Op_P8,Ancla_J,Actual,Op,Pos_XY , Pos_XY_P9,Pos_XY_P10,Pos_XY_P11,Pos_XY_P12,Pos_XY_P13,Pos_XY_P14,Pos_XY_P15 ,Pos_XY_P16 ,Pos_XY_P17 ,Pos_XY_P18  : std_logic_vector (19 downto 0); --Nuevas Posiciones y Anclas 
signal ContadorP1_ROM,ContadorP2_ROM,ContadorP3_ROM,ContadorP4_ROM,ContadorP5_ROM,ContadorP6_ROM,ContadorP7_ROM,ContadorP8_ROM, ContadorJ_ROM:std_logic_vector(9 downto 0); --ADRESS DE MEMORIAS
signal Actual_X_P1,Actual_X_P2,Actual_X_P3, Actual_X_P4, Actual_X_P5, Actual_X_P6, Actual_X_P7, Actual_X_P8,Actual_X :std_logic_vector(9 downto 0); --Entradas en x al bloque de movimiento
signal Actual_Y_P1,Actual_Y_P2,Actual_Y_P3, Actual_Y_P4, Actual_Y_P5, Actual_Y_P6, Actual_Y_P7, Actual_Y_P8,Actual_Y :std_logic_vector(9 downto 0); --Entradas en y al bloque de movimiento 


--ENTRADAS A COMPARACIon
signal Buttons :std_logic_vector(3 downto 0); 
signal Arriba, Abajo,Izquierda, Derecha :std_logic; --BOTONES



--BOTONES
signal ContadorG_ROM,ContadorA_ROM,ContadorM_ROM,ContadorE_ROM,ContadorO_ROM,ContadorV_ROM,ContadorE2_ROM,ContadorR_ROM,ContadorP_ROM,ContadorA2_ROM,ContadorU_ROM,ContadorS_ROM,ContadorE3_ROM :std_logic_vector(9 downto 0);
--del 8 al 14 que faltaron
signal Control_P9,Control_P10,Control_P11,Control_P12,Control_P13,Control_P14,Control_P15,Control_P16,Control_P17,Control_P18,Comp_reinicio_P1,Comp_reinicio_P2,Comp_reinicio_P3,Comp_reinicio_P4,Comp_reinicio_P5,Comp_reinicio_P6,Comp_reinicio_P7
,Comp_reinicio_P8,Comp_reinicio_P9,Comp_reinicio_P10,Comp_reinicio_P11,Comp_reinicio_P12,Comp_reinicio_P13,Comp_reinicio_P14,Comp_reinicio_P15,Comp_reinicio_P16,Comp_reinicio_P17,Comp_reinicio_P18,Comp_reinicio_Ernie: Std_logic;
signal Op_P9,Op_P10,Op_P11,Op_P12,Op_P13,Op_P15,Op_P16,Op_P17,Op_P18,Op_P14 : std_logic_vector(19 downto 0);
signal Pos_XY_X_P9,Pos_XY_X_P10,Pos_XY_X_P11,Pos_XY_X_P12,Pos_XY_X_P13,Pos_XY_X_P14,Pos_XY_X_P15,Pos_XY_X_P16,Pos_XY_X_P17,Pos_XY_X_P18: Std_logic_vector(9 downto 0);
Signal Pos_XY_Y_P9,Pos_XY_Y_P10,Pos_XY_Y_P11,Pos_XY_Y_P12,Pos_XY_Y_P13,Pos_XY_Y_P14,Pos_XY_Y_P15,Pos_XY_Y_P16,Pos_XY_Y_P17,Pos_XY_Y_P18 : Std_logic_vector(9 downto 0);
Signal Ancla_P9,Ancla_P10,Ancla_P11,Ancla_P12,Ancla_P13,Ancla_P14,Ancla_P15,Ancla_P16,Ancla_P17,Ancla_P18 : Std_logic_vector(19 downto 0);
Signal Actual_X_P9,Actual_X_P10,Actual_X_P11,Actual_X_P12,Actual_X_P13,Actual_X_P14,Actual_X_P15,Actual_X_P16,Actual_X_P17,Actual_X_P18: Std_logic_vector(9 downto 0);
Signal Actual_Y_P9,Actual_Y_P10,Actual_Y_P11,Actual_Y_P12,Actual_Y_P13,Actual_Y_P14,Actual_Y_P15,Actual_Y_P16,Actual_Y_P17,Actual_Y_P18 :Std_logic_vector(9 downto 0);
Signal Actual_P9,Actual_P10,Actual_P11,Actual_P12,Actual_P13,Actual_P14,Actual_P15,Actual_P16,Actual_P17,Actual_P18 : Std_logic_vector(19 downto 0);
--Signal Pos_XY_P9,Pos_XY_P10,Pos_XY_P11,Pos_XY_P12,Pos_XY_P13,Pos_XY_P14 :Std_logic_vector(19 downto 0);
Signal ContadorP9_ROM,ContadorP10_ROM,ContadorP11_ROM,ContadorP12_ROM,ContadorP13_ROM,ContadorP14_ROM,ContadorP15_ROM,ContadorP16_ROM,ContadorP17_ROM,ContadorP18_ROM: Std_logic_vector(9 downto 0);
Signal Trash81,Trash82,Trash83,Trash84,Trash85,Trash86,Trash87,Trash88,Trash89,Trash90,Trash91,Trash92,Trash93,Trash94,Trash95,Trash96,
Trash97,Trash98,Trash99,Trash100,Trash101,Trash102,Trash103,Trash104,Trash105,Trash106,Trash107,Trash108,Trash109,Trash110,Trash111,Trash112,Trash113,Trash114,Trash115,Trash116,Trash117,Trash118,Trash119,Trash120,Trash121,Trash122, Trash123,Trash124 : Std_logic;
Signal C_P9_e,C_P10_e,C_P11_e,C_P12_e,C_P13_e,C_P14_e,C_P15_e,C_P16_e,C_P17_e,C_P18_e : Std_logic;
signal OP1X, OP1Y,OP2X, OP2Y,OP3X, OP3Y,OP4X, OP4Y,OP5X, OP5Y,OP6X, OP6Y,OP7X, OP7Y,OP8X, OP8Y,OP9X, OP9Y,OP10X, OP10Y,OP11X, OP11Y,OP12X, OP12Y,OP13X, OP13Y,OP14X, OP14Y,OP15X, OP15Y,OP16X, OP16Y,OP17X, OP17Y,OP18X, OP18Y  :std_logic_vector (9 downto 0);

CONSTANT OP1X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;
CONSTANT OP1Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP2X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(240,10) ;
CONSTANT OP2Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP3X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(336,10) ;
CONSTANT OP3Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP4X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(432,10) ;
CONSTANT OP4Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP5X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(528,10) ;
CONSTANT OP5Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP6X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(624,10) ;
CONSTANT OP6Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP7X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(720,10) ;
CONSTANT OP7Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(99,10) ;
CONSTANT OP8X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(176,10) ;
CONSTANT OP8Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP9X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(288,10) ;
CONSTANT OP9Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP10X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(384,10) ;
CONSTANT OP10Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP11X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(480,10) ;
CONSTANT OP11Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP12X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(576,10) ;
CONSTANT OP12Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP13X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(672,10) ;
CONSTANT OP13Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(195,10) ;
CONSTANT OP14X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(144,10) ;
CONSTANT OP14Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(291,10) ;
CONSTANT OP15X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(240,10) ;
CONSTANT OP15Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(291,10) ;
CONSTANT OP16X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(336,10) ;
CONSTANT OP16Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(291,10) ;
CONSTANT OP17X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(432,10) ;
CONSTANT OP17Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(291,10) ;
CONSTANT OP18X_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(528,10) ;
CONSTANT OP18Y_U: UNSIGNED(9 DOWNTO 0) := to_unsigned(291,10) ;

begin

Control_pos_P14 <= Control_pos_P8;
Control_pos_P15 <= Control_pos_P9;
Control_pos_P16 <= Control_pos_P10;
Control_pos_P17 <= Control_pos_P11;
Control_pos_P18 <= Control_pos_P12;
Control_P14     <= Control_P8;
Control_P15     <= Control_P9;
Control_P16     <= Control_P10;
Control_P17     <= Control_P11;
Control_P18     <= Control_P12;
Control_A_P14   <= Control_A_P8;
Control_A_P15   <= Control_A_P9;
Control_A_P16   <= Control_A_P10;
Control_A_P17   <= Control_A_P11;
Control_A_P18   <= Control_A_P12;


OP1X <= std_logic_vector(OP1X_U);
OP1Y <= std_logic_vector(OP1Y_U);
OP2X <= std_logic_vector(OP2X_U);
OP2Y <= std_logic_vector(OP2Y_U);
OP3X <= std_logic_vector(OP3X_U);
OP3Y <= std_logic_vector(OP3Y_U);
OP4X <= std_logic_vector(OP4X_U);
OP4Y <= std_logic_vector(OP4Y_U);
OP5X <= std_logic_vector(OP5X_U);
OP5Y <= std_logic_vector(OP5Y_U);
OP6X <= std_logic_vector(OP6X_U);
OP6Y <= std_logic_vector(OP6Y_U);
OP7X <= std_logic_vector(OP7X_U);
OP7Y <= std_logic_vector(OP7Y_U);
OP8X <= std_logic_vector(OP8X_U);
OP8Y <= std_logic_vector(OP8Y_U);
OP9X <= std_logic_vector(OP9X_U);
OP9Y <= std_logic_vector(OP9Y_U);
OP10X <= std_logic_vector(OP10X_U);
OP10Y <= std_logic_vector(OP10Y_U);
OP11X <= std_logic_vector(OP11X_U);
OP11Y <= std_logic_vector(OP11Y_U);
OP12X <= std_logic_vector(OP12X_U);
OP12Y <= std_logic_vector(OP12Y_U);
OP13X <= std_logic_vector(OP13X_U);
OP13Y <= std_logic_vector(OP13Y_U);
OP14X <= std_logic_vector(OP14X_U);
OP14Y <= std_logic_vector(OP14Y_U);
OP15X <= std_logic_vector(OP15X_U);
OP15Y <= std_logic_vector(OP15Y_U);
OP16X <= std_logic_vector(OP16X_U);
OP16Y <= std_logic_vector(OP16Y_U);
OP17X <= std_logic_vector(OP17X_U);
OP17Y <= std_logic_vector(OP17Y_U);
OP18X <= std_logic_vector(OP18X_U);
OP18Y <= std_logic_vector(OP18Y_U);

-------------------------------
Fin_VGAC <= C_525 and C_800; --termina la zona de muestreo
---------------------PARA EL JUGADOR -----------------------------------------------------------------------------------
Pos_XY_X<= Ancla_J(19 downto 10);
Pos_XY_Y<= Ancla_J(9 downto 0);
Actual_X<= Actual (19 downto 10);
Actual_Y<= Actual (9 downto 0);
Op <=  "01110100000111011011" when (Control_Ernie = '1' or Comp_reinicio_Ernie='1') else Pos_XY; --"01011001110110111111" "01011001110000100101"
Clr <= not Go_time;
------------------PARA COMPARADOR DE POSICION------------------------------------------------------------------------------
Pos_XY_X_P1<= Ancla_P1(19 downto 10);
Pos_XY_Y_P1<= Ancla_P1(9 downto 0);
Pos_XY_X_P2<= Ancla_P2(19 downto 10);
Pos_XY_Y_P2<= Ancla_P2(9 downto 0);
Pos_XY_X_P3<= Ancla_P3(19 downto 10);
Pos_XY_Y_P3<= Ancla_P3(9 downto 0);
Pos_XY_X_P4<= Ancla_P4(19 downto 10);
Pos_XY_Y_P4<= Ancla_P4(9 downto 0);
Pos_XY_X_P5<= Ancla_P5(19 downto 10);
Pos_XY_Y_P5<= Ancla_P5(9 downto 0);
Pos_XY_X_P6<= Ancla_P6(19 downto 10);
Pos_XY_Y_P6<= Ancla_P6(9 downto 0);
Pos_XY_X_P7<= Ancla_P7(19 downto 10);
Pos_XY_Y_P7<= Ancla_P7(9 downto 0);
Pos_XY_X_P8<= Ancla_P8(19 downto 10);
Pos_XY_Y_P8<= Ancla_P8(9 downto 0);
Pos_XY_X_P9<= Ancla_P9(19 downto 10);
Pos_XY_Y_P9<= Ancla_P9(9 downto 0);
Pos_XY_X_P10<= Ancla_P10(19 downto 10);
Pos_XY_Y_P10<= Ancla_P10(9 downto 0);
Pos_XY_X_P11<= Ancla_P11(19 downto 10);
Pos_XY_Y_P11<= Ancla_P11(9 downto 0);
Pos_XY_X_P12<= Ancla_P12(19 downto 10);
Pos_XY_Y_P12<= Ancla_P12(9 downto 0);
Pos_XY_X_P13<= Ancla_P13(19 downto 10);
Pos_XY_Y_P13<= Ancla_P13(9 downto 0);
Pos_XY_X_P14<= Ancla_P14(19 downto 10);
Pos_XY_Y_P14<= Ancla_P14(9 downto 0);
Pos_XY_X_P15<= Ancla_P15(19 downto 10);
Pos_XY_Y_P15<= Ancla_P15(9 downto 0);
Pos_XY_X_P16<= Ancla_P16(19 downto 10);
Pos_XY_Y_P16<= Ancla_P16(9 downto 0);
Pos_XY_X_P17<= Ancla_P17(19 downto 10);
Pos_XY_Y_P17<= Ancla_P17(9 downto 0);
Pos_XY_X_P18<= Ancla_P18(19 downto 10);
Pos_XY_Y_P18<= Ancla_P18(9 downto 0);

---------------PARA MOVIMIENTO DE CADA MONACHO-----------------------------------------------------------------------------------
Actual_X_P1<= Actual_P1 (19 downto 10);
Actual_Y_P1<= Actual_P1 (9 downto 0);
Actual_X_P2<= Actual_P2 (19 downto 10);
Actual_Y_P2<= Actual_P2 (9 downto 0);
Actual_X_P3<= Actual_P3 (19 downto 10);
Actual_Y_P3<= Actual_P3 (9 downto 0);
Actual_X_P4<= Actual_P4 (19 downto 10);
Actual_Y_P4<= Actual_P4 (9 downto 0);
Actual_X_P5<= Actual_P5 (19 downto 10);
Actual_Y_P5<= Actual_P5 (9 downto 0);
Actual_X_P6<= Actual_P6 (19 downto 10);
Actual_Y_P6<= Actual_P6 (9 downto 0);
Actual_X_P7<= Actual_P7 (19 downto 10);
Actual_Y_P7<= Actual_P7 (9 downto 0);
Actual_X_P8<= Actual_P8 (19 downto 10);
Actual_Y_P8<= Actual_P8 (9 downto 0);
Actual_X_P9<= Actual_P9 (19 downto 10);
Actual_Y_P9<= Actual_P9 (9 downto 0);
Actual_X_P10<= Actual_P10 (19 downto 10);
Actual_Y_P10<= Actual_P10 (9 downto 0);
Actual_X_P11<= Actual_P11 (19 downto 10);
Actual_Y_P11<= Actual_P11 (9 downto 0);
Actual_X_P12<= Actual_P12 (19 downto 10);
Actual_Y_P12<= Actual_P12 (9 downto 0);
Actual_X_P13<= Actual_P13 (19 downto 10);
Actual_Y_P13<= Actual_P13 (9 downto 0);
Actual_X_P14<= Actual_P14 (19 downto 10);
Actual_Y_P14<= Actual_P14 (9 downto 0);
Actual_X_P15<= Actual_P15 (19 downto 10);
Actual_Y_P15<= Actual_P15 (9 downto 0);
Actual_X_P16<= Actual_P16 (19 downto 10);
Actual_Y_P16<= Actual_P16 (9 downto 0);
Actual_X_P17<= Actual_P17 (19 downto 10);
Actual_Y_P17<= Actual_P17 (9 downto 0);
Actual_X_P18<= Actual_P18 (19 downto 10);
Actual_Y_P18<= Actual_P18 (9 downto 0);

-----------------------------TIMER MONACHOS----------------------------------------------------------------------------------------------------
Clr_P1 <= not Go_time_P1;
Clr_P2 <= not Go_time_P2;
VE <= Inicio_IMG or Control_G_O or Control_Pause;
---------------------------------------------------------------------------MONACHOS------------------------------------------------------------------
Op_P1 <= OP1X & OP1Y            when (Control_P1 = '1' or Comp_reinicio_P1 ='1')  else Pos_XY_P1; --"01011001110110111111" -la que esta actualmente es 144x35
Op_P2 <= OP2X & OP2Y  when (Control_P2 = '1' )  	 else
			OP1X & OP1Y when	Comp_reinicio_P2 ='1' else 
										  Pos_XY_P2;  
										  
Op_P3 <= OP3X & OP3Y  when (Control_P3 = '1' )  	 else
			OP1X & OP1Y when	Comp_reinicio_P3 ='1' else 
										  Pos_XY_P3;  
Op_P4 <= OP4X & OP4Y  when (Control_P4 = '1' )  	 else
			OP1X & OP1Y when Comp_reinicio_P4 ='1' else 
										  Pos_XY_P4;  
Op_P5 <= OP5X & OP5Y  when (Control_P5 = '1' )  	 else
			OP1X & OP1Y when	Comp_reinicio_P5 ='1' else 
										  Pos_XY_P5;  
Op_P6 <= OP6X & OP6Y  when (Control_P6 = '1' )  	 else
			OP1X & OP1Y when	Comp_reinicio_P6 ='1' else 
										  Pos_XY_P6;  
Op_P7 <= OP7X & OP7Y  when (Control_P7 = '1' )  	 else
			OP1X & OP1Y when	Comp_reinicio_P7 ='1' else 
										  Pos_XY_P7;  
										  ------------------------FILA 1
Op_P8 <= OP8X & OP8Y  when (Control_P8 = '1' )  	 else
			OP8X & OP8Y when	Comp_reinicio_P8 ='1' else 
										  Pos_XY_P8;  
Op_P9 <= OP9X & OP9Y  when (Control_P9 = '1' )  	 else
		OP8X & OP8Y when	Comp_reinicio_P9 ='1' else 
										  Pos_XY_P9;  
Op_P10 <= OP10X & OP10Y  when (Control_P10 = '1' )  	 else
			OP8X & OP8Y when	Comp_reinicio_P10 ='1' else 
										  Pos_XY_P10;  
Op_P11 <= OP11X & OP11Y  when (Control_P11 = '1' )  	 else
			 OP8X & OP8Y when	Comp_reinicio_P11 ='1' else 
										  Pos_XY_P11;  
Op_P12 <= OP12X & OP12Y  when (Control_P12 = '1' )  	 else
			 OP8X & OP8Y when	Comp_reinicio_P12 ='1' else 
										  Pos_XY_P12;  
Op_P13 <= OP13X & OP13Y  when (Control_P13 = '1' )  	 else
			 OP8X & OP8Y   when	Comp_reinicio_P13 ='1' else 
										  Pos_XY_P13;  
------------------------------------------------------------------------------FILA 2 										  
Op_P14 <= OP14X & OP14Y when (Control_P14 = '1' )  	 else
			 OP14X & OP14Y when	Comp_reinicio_P14 ='1' else 
										  Pos_XY_P14;  
Op_P15 <= OP15X & OP15Y when (Control_P15 = '1' )  	 else
			 OP14X & OP14Y when	Comp_reinicio_P15 ='1' else 
									  Pos_XY_P15;  
Op_P16 <= OP16X & OP16Y when (Control_P16 = '1' )  	 else
			 OP14X & OP14Y when	Comp_reinicio_P16 ='1' else 
			 							  Pos_XY_P16;  
Op_P17 <= OP17X & OP17Y when (Control_P17 = '1' )  	 else
			 OP14X & OP14Y when	Comp_reinicio_P17 ='1' else 
										  Pos_XY_P17;  
Op_P18 <= OP18X & OP18Y when (Control_P18 = '1' )  	 else
			 OP14X & OP14Y when	Comp_reinicio_P18 ='1' else 
										  Pos_XY_P18;  

-- x separado cada 64 , para los segundos 64 en los mismos x pero en el y separado 64
--
---------------------------------------------------------------------------LETRAS---------------------------------------------------------------------
TIMER_FPS: entity work.Cronometro
		GENERIC MAP		(	Cm				=>  "0001",
						Rm          => "0001",
					   Cs				=>  "0000",
						Rs          =>  "0000",
					   Cd				=>  "0000",
					   Rd          =>  "0000"	
						
	)
	port map( 
	go  => Go_time,
	clk => clk,
	rst => rst,
	clear=> Clr,
	MM  => Time_up
	
		);
		
TIMER_NIVEL_PERSONA_1: entity work.Cronometro --ESTE ES EL MISMO PARA TODOS
	GENERIC MAP		(	Cm				=>  "0011",
							Rm          =>  "0011",
							Cs				=>  "0000",
							Rs          =>  "0000",
							Cd				=>  "0000",
							Rd          =>  "0000"	
						
	)
	port map( 
	go  => Go_time_P1,
	clk => clk,
	rst => rst,
	clear=> Clr_P1,
	MM  => Time_up_1
	
		);	
		
TIMER_NIVEL_PERSONA_2: entity work.Cronometro --ESTE ES EL MISMO PARA TODOS
	GENERIC MAP		(	Cm				=>  "0111",
							Rm          =>  "0111",
							Cs				=>  "0000",
							Rs          =>  "0000",
							Cd				=>  "0000",
							Rd          =>  "0000"	
						
	)
	port map( 
	go  => Go_time_P2,
	clk => clk,
	rst => rst,
	clear=> Clr_P2,
	MM  => Time_up_2
	
		);	

TIMER_NIVEL_PERSONA_3: entity work.Cronometro --ESTE ES EL MISMO PARA TODOS
	GENERIC MAP		(	Cm				=>  "0001",
							Rm          =>  "0001",
							Cs				=>  "0000",
							Rs          =>  "0000",
							Cd				=>  "0000",
							Rd          =>  "0000"	
						
	)
	port map( 
	go  => Go_time_P3,
	clk => clk,
	rst => rst,
	clear=> Clr_P3,
	MM  => Time_up_3
	
		);	
----LETRA G---------------------------------------------------------------------------------------------------------------------------------------------------------------			
ROM_G : entity work.LETRAG
 Port map(
 
 		address	=> ContadorG_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_G
 
 );
 
CONTADOR_G: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLG_e,
						syn_clr		=>'0',
						max_tick		=>Trash10,
			--			min_tick		=>m1,
						counter		=>ContadorG_ROM,
						Hsync			=>Trash11,
						H_on			=>Trash12
			
			);						
----LETRA A-------------------------------
ROM_A : entity work.LETRAA
 Port map(
 
 		address	=> ContadorA_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_A
 
 );
 
CONTADOR_A: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLA_e,
						syn_clr		=>'0',
						max_tick		=>Trash13,
			--			min_tick		=>m1,
						counter		=>ContadorA_ROM,
						Hsync			=>Trash14,
						H_on			=>Trash15
						);
-----------LETRA M----------------------------------
ROM_M : entity work.LETRAM
 Port map(
 
 		address	=> ContadorM_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_M
 
 );
 
CONTADOR_M: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLM_e,
						syn_clr		=>'0',
						max_tick		=>Trash16,
			--			min_tick		=>m1,
						counter		=>ContadorM_ROM,
						Hsync			=>Trash17,
						H_on			=>Trash18
						);
---------------LETRA E----------------------------------------
ROM_E : entity work.LETRAE
 Port map(
 
 		address	=> ContadorE_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_E
 
 );
 
CONTADOR_E: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLE_e,
						syn_clr		=>'0',
						max_tick		=>Trash19,
			--			min_tick		=>m1,
						counter		=>ContadorE_ROM,
						Hsync			=>Trash20,
						H_on			=>Trash21
						);	
	
-----LETRA O---------------------------------------------
ROM_O : entity work.LETRAO
 Port map(
 
 		address	=> ContadorO_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_O
 
 );
 
CONTADOR_O: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLO_e,
						syn_clr		=>'0',
						max_tick		=>Trash22,
			--			min_tick		=>m1,
						counter		=>ContadorO_ROM,
						Hsync			=>Trash23,
						H_on			=>Trash24
						);	
						
--------------LETRA V-------------------------------------------------------------------
ROM_V : entity work.LETRAV
 Port map(
 
 		address	=> ContadorV_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_V
 
 );
 
CONTADOR_V: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLV_e,
						syn_clr		=>'0',
						max_tick		=>Trash25,
			--			min_tick		=>m1,
						counter		=>ContadorV_ROM,
						Hsync			=>Trash26,
						H_on			=>Trash27
						);
-------------------LETRA R-------------------------------------

ROM_R : entity work.LETRAR
 Port map(
 
 		address	=> ContadorR_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_R
 
 );
 
CONTADOR_R: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLR_e,
						syn_clr		=>'0',
						max_tick		=>Trash28,
			--			min_tick		=>m1,
						counter		=>ContadorR_ROM,
						Hsync			=>Trash29,
						H_on			=>Trash30
						);
						
-------------------------LETRA P--------------------------------
ROM_P : entity work.LETRAP
 Port map(
 
 		address	=> ContadorP_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_P
 
 );
 
CONTADOR_P: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLP_e,
						syn_clr		=>'0',
						max_tick		=>Trash31,
			--			min_tick		=>m1,
						counter		=>ContadorP_ROM,
						Hsync			=>Trash32,
						H_on			=>Trash33
						);
						
----------------------LETRA U---------------------------------------
ROM_U : entity work.LETRAU
 Port map(
 
 		address	=> ContadorU_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_U
 
 );
 
CONTADOR_U: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLU_e,
						syn_clr		=>'0',
						max_tick		=>Trash34,
			--			min_tick		=>m1,
						counter		=>ContadorU_ROM,
						Hsync			=>Trash35,
						H_on			=>Trash36
						);
						
---------------------LETRA S----------------------------------
ROM_S : entity work.LETRAS
 Port map(
 
 		address	=> ContadorS_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_S
 
 );
 
CONTADOR_S: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLS_e,
						syn_clr		=>'0',
						max_tick		=>Trash37,
			--			min_tick		=>m1,
						counter		=>ContadorS_ROM,
						Hsync			=>Trash38,
						H_on			=>Trash39
						);
						
---------------------LETRA E2----------------------------------
ROM_E2 : entity work.LETRAE
 Port map(
 
 		address	=> ContadorE2_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_E2
 
 );
 
CONTADOR_E2: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLE2_e,
						syn_clr		=>'0',
						max_tick		=>Trash40,
			--			min_tick		=>m1,
						counter		=>ContadorE2_ROM,
						Hsync			=>Trash41,
						H_on			=>Trash42
						);
-----------------
ROM_A2 : entity work.LETRAA
 Port map(
 
 		address	=> ContadorA2_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_A2
 
 );
 
CONTADOR_A2: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLA2_e,
						syn_clr		=>'0',
						max_tick		=>Trash13,
			--			min_tick		=>m1,
						counter		=>ContadorA2_ROM,
						Hsync			=>Trash78,
						H_on			=>Trash79
						);	
	
------------------------
ROM_E3 : entity work.LETRAE
 Port map(
 
 		address	=> ContadorE3_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> LETRA_E3
 
 );
 
CONTADOR_E3: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>CLE3_e,
						syn_clr		=>'0',
						max_tick		=>Trash79,
			--			min_tick		=>m1,
						counter		=>ContadorE3_ROM,
						Hsync			=>Trash69,
						H_on			=>Trash68
						);	

--------------------------------------------------------------------------MOVIMIENTO JUGADOR----------------------------------------------------------
MOVIMIENTO_ERNIE: entity work. Movimiento_Jugador
	Port map (
		  Botones               => Buttons,		 			
		  Posicion_JugadorX		=> Actual_X,
		  Posicion_JugadorY		=> Actual_Y,
		  Nueva_Posicion			=> Pos_XY
	
	
	);
	
NTIRREBOTE_ARRIBA: entity work. debounce
	Port map(
			Clk =>clk,
			Rst =>rst,
			Switch => B_Arriba,
			-------------------------Salidas-------------------------
			Pressed => Arriba
			
	
	
	);
	
ANTIRREBOTE_ABAJO: entity work. debounce
	Port map(
			Clk =>clk,
			Rst =>rst,
			Switch =>B_Abajo ,
			-------------------------Salidas-------------------------
			Pressed => Abajo
			
	
	
	);

ANTIRREBOTE_IZQUIERDA: entity work. debounce
	Port map(
			Clk =>clk,
			Rst =>rst,
			Switch => B_Izquierda,
			-------------------------Salidas-------------------------
			Pressed => Izquierda
			
	
	
	);
	
ANTIRREBOTE_DERECHA: entity work. debounce
	Port map(
			Clk =>clk,
			Rst =>rst,
			Switch => B_Derecha,
			-------------------------Salidas-------------------------
			Pressed => Derecha
			
	
	
	);
	
Comparador_botones: entity work. Comparador_Botones
	 Port Map ( 

		BotonUp									=>Arriba,
		BotonDown								=>Abajo,
		BotonLeft								=>Izquierda,
		BotonRight								=>Derecha,
		Comp_Botones							=>Comp_BotonesC
		);
		
ALMACENAMIENTO_BOTONES: entity work. Almacenamiento_Botones
	Port Map(
		clk										=>clk,							
		rst										=>rst,
		BotonUp									=>Arriba,
		BotonDown								=>Abajo,
		BotonLeft								=>Izquierda,
		BotonRight								=>Derecha,
		Alm_Botones								=>ALM_E,
		Botones									=>Buttons );
--------------------------------------------------------------------------POSICION JUGADOR---------------------------------------------------------------

		
POSICION_DE_ERNIE_COMP: entity work.Posicion_Jugador
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op ,			
		 Control_PJ		=> Control_pos,		   
		 Posicion_Ancla	=> Ancla_J		




	);
	
POSICION_DE_ERNIE_ACTUAL_OP: entity work.Posicion_Jugador

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_J,			
		 Control_PJ		=> Control_A,		   
		 Posicion_Ancla	=> Actual		




	);
--------------------------------------------------------------------------ROM Y CONTADOR JUGADOR----------------------------
ROM_JUGADOR : entity work.Yodita
 Port map(
 
 		address	=> ContadorJ_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> J_MUX
 
 );
 
CONTADOR_MEMORIA: entity work.ContadorHFuncionando
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_J_e,
						syn_clr		=>'0',
						max_tick		=>Trash10,
			--			min_tick		=>m1,
						counter		=>ContadorJ_ROM,
						Hsync			=>Trash1,
						H_on			=>Trash0
			
			);	
--------------------------------------------------------------------------MOVIMIENTOS-----------------------------------------
MOVIMIENTO_PERSONA1: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P1,
		  Posicion_JugadorY		=> Actual_Y_P1,
		  Nueva_Posicion			=> Pos_XY_P1
	
	
	);		
	
MOVIMIENTO_PERSONA2: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P2,
		  Posicion_JugadorY		=> Actual_Y_P2,
		  Nueva_Posicion			=> Pos_XY_P2
	
	
	);	

MOVIMIENTO_PERSONA3: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P3,
		  Posicion_JugadorY		=> Actual_Y_P3,
		  Nueva_Posicion			=> Pos_XY_P3
	
	
	);	

MOVIMIENTO_PERSONA4: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P4,
		  Posicion_JugadorY		=> Actual_Y_P4,
		  Nueva_Posicion			=> Pos_XY_P4
	
	
	);	
	
MOVIMIENTO_PERSONA5: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P5,
		  Posicion_JugadorY		=> Actual_Y_P5,
		  Nueva_Posicion			=> Pos_XY_P5
	
	
	);	
	
MOVIMIENTO_PERSONA6: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P6,
		  Posicion_JugadorY		=> Actual_Y_P6,
		  Nueva_Posicion			=> Pos_XY_P6
	
	
	);	
	
MOVIMIENTO_PERSONA7: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P7,
		  Posicion_JugadorY		=> Actual_Y_P7,
		  Nueva_Posicion			=> Pos_XY_P7
	
	
	);	
	
MOVIMIENTO_PERSONA8: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P8,
		  Posicion_JugadorY		=> Actual_Y_P8,
		  Nueva_Posicion			=> Pos_XY_P8
	
	
	);	

MOVIMIENTO_PERSONA9: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P9,
		  Posicion_JugadorY		=> Actual_Y_P9,
		  Nueva_Posicion			=> Pos_XY_P9
	
	
	);	

MOVIMIENTO_PERSONA10: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P10,
		  Posicion_JugadorY		=> Actual_Y_P10,
		  Nueva_Posicion			=> Pos_XY_P10
	
	
	);	
	
MOVIMIENTO_PERSONA11: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P11,
		  Posicion_JugadorY		=> Actual_Y_P11,
		  Nueva_Posicion			=> Pos_XY_P11
	
	
	);	
	
MOVIMIENTO_PERSONA12: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P12,
		  Posicion_JugadorY		=> Actual_Y_P12,
		  Nueva_Posicion			=> Pos_XY_P12
	
	
	);	

	
MOVIMIENTO_PERSONA13: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P13,
		  Posicion_JugadorY		=> Actual_Y_P13,
		  Nueva_Posicion			=> Pos_XY_P13
	
	
	);	
	
MOVIMIENTO_PERSONA14: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P14,
		  Posicion_JugadorY		=> Actual_Y_P14,
		  Nueva_Posicion			=> Pos_XY_P14
	
	
	);	
	
MOVIMIENTO_PERSONA15: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P15,
		  Posicion_JugadorY		=> Actual_Y_P15,
		  Nueva_Posicion			=> Pos_XY_P15
	
	
	);	
	
MOVIMIENTO_PERSONA16: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P16,
		  Posicion_JugadorY		=> Actual_Y_P16,
		  Nueva_Posicion			=> Pos_XY_P16
	
	
	);	
	
MOVIMIENTO_PERSONA17: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P17,
		  Posicion_JugadorY		=> Actual_Y_P17,
		  Nueva_Posicion			=> Pos_XY_P17
	
	
	);	
	
MOVIMIENTO_PERSONA18: entity work. Movimiento_Jugador
	Port map (
		  Botones               => "0001",		 			
		  Posicion_JugadorX		=> Actual_X_P18,
		  Posicion_JugadorY		=> Actual_Y_P18,
		  Nueva_Posicion			=> Pos_XY_P18
	
	
	);	
	
	
--------------------------------------------------------------------------POSICIONES MONACHITOS--------------------------------
POSICION_DE_PERSONA_1_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P1 ,			
		 Control_PJ		=> Control_pos_P1,		   
		 Posicion_Ancla	=> Ancla_P1		
	);
	
POSICION_DE_PERSONA_1_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P1,			
		 Control_PJ		=> Control_A_P1,		   
		 Posicion_Ancla	=> Actual_P1		




	);
	
POSICION_DE_PERSONA_2_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P2 ,			
		 Control_PJ		=> Control_pos_P2,		   
		 Posicion_Ancla	=> Ancla_P2		




	);
	
POSICION_DE_PERSONA_2_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P2,			
		 Control_PJ		=> Control_A_P2,		   
		 Posicion_Ancla	=> Actual_P2		




	);

POSICION_DE_PERSONA_3_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P3 ,			
		 Control_PJ		=> Control_pos_P3,		   
		 Posicion_Ancla	=> Ancla_P3		




	);
	
POSICION_DE_PERSONA_3_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P3,			
		 Control_PJ		=> Control_A_P3,		   
		 Posicion_Ancla	=> Actual_P3		




	);
	
POSICION_DE_PERSONA_4_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P4,			
		 Control_PJ		=> Control_pos_P4,		   
		 Posicion_Ancla	=> Ancla_P4		




	);
	
POSICION_DE_PERSONA_4_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P4,			
		 Control_PJ		=> Control_A_P4,		   
		 Posicion_Ancla	=> Actual_P4		




	);
	
POSICION_DE_PERSONA_5_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P5 ,			
		 Control_PJ		=> Control_pos_P5,		   
		 Posicion_Ancla	=> Ancla_P5		




	);
	
POSICION_DE_PERSONA_5_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P5,			
		 Control_PJ		=> Control_A_P5,		   
		 Posicion_Ancla	=> Actual_P5		




	);
	
POSICION_DE_PERSONA_6_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P6 ,			
		 Control_PJ		=> Control_pos_P6,		   
		 Posicion_Ancla	=> Ancla_P6		




	);
	
POSICION_DE_PERSONA_6_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P6,			
		 Control_PJ		=> Control_A_P6,		   
		 Posicion_Ancla	=> Actual_P6		




	);
	
POSICION_DE_PERSONA_7_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P7 ,			
		 Control_PJ		=> Control_pos_P7,		   
		 Posicion_Ancla	=> Ancla_P7		




	);
	
POSICION_DE_PERSONA_7_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P7,			
		 Control_PJ		=> Control_A_P7,		   
		 Posicion_Ancla	=> Actual_P7		




	);
	
POSICION_DE_PERSONA_8_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P8 ,			
		 Control_PJ		=> Control_pos_P8,		   
		 Posicion_Ancla	=> Ancla_P8	 );
	
POSICION_DE_PERSONA_8_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P8,			
		 Control_PJ		=> Control_A_P8,		   
		 Posicion_Ancla	=> Actual_P8	);
POSICION_DE_PERSONA_9_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P9 ,			
		 Control_PJ		=> Control_pos_P9,		   
		 Posicion_Ancla	=> Ancla_P9	 );
	
POSICION_DE_PERSONA_9_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P9,			
		 Control_PJ		=> Control_A_P9,		   
		 Posicion_Ancla	=> Actual_P9	);
		 
POSICION_DE_PERSONA_10_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P10 ,			
		 Control_PJ		=> Control_pos_P10,		   
		 Posicion_Ancla	=> Ancla_P10	 );
	
POSICION_DE_PERSONA_10_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P10,			
		 Control_PJ		=> Control_A_P10,		   
		 Posicion_Ancla	=> Actual_P10	);
		 
POSICION_DE_PERSONA_11_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P11 ,			
		 Control_PJ		=> Control_pos_P11,		   
		 Posicion_Ancla	=> Ancla_P11	 );
	
POSICION_DE_PERSONA_11_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P11,			
		 Control_PJ		=> Control_A_P11,		   
		 Posicion_Ancla	=> Actual_P11	);
		 
POSICION_DE_PERSONA_12_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P12 ,			
		 Control_PJ		=> Control_pos_P12,		   
		 Posicion_Ancla	=> Ancla_P12	 );
	
POSICION_DE_PERSONA_12_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P12,			
		 Control_PJ		=> Control_A_P12,		   
		 Posicion_Ancla	=> Actual_P12	);
		 
POSICION_DE_PERSONA_13_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P13 ,			
		 Control_PJ		=> Control_pos_P13,		   
		 Posicion_Ancla	=> Ancla_P13	 );
	
POSICION_DE_PERSONA_13_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P13,			
		 Control_PJ		=> Control_A_P13,		   
		 Posicion_Ancla	=> Actual_P13	);
		 
POSICION_DE_PERSONA_14_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P14 ,			
		 Control_PJ		=> Control_pos_P14,		   
		 Posicion_Ancla	=> Ancla_P14	 );
	
POSICION_DE_PERSONA_14_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P14,			
		 Control_PJ		=> Control_A_P14,		   
		 Posicion_Ancla	=> Actual_P14	);
		 
POSICION_DE_PERSONA_15_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P15 ,			
		 Control_PJ		=> Control_pos_P15,		   
		 Posicion_Ancla	=> Ancla_P15	 );
	
POSICION_DE_PERSONA_16_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P16,			
		 Control_PJ		=> Control_A_P16,		   
		 Posicion_Ancla	=> Actual_P16	);
		 
POSICION_DE_PERSONA_16_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P16 ,			
		 Control_PJ		=> Control_pos_P16,		   
		 Posicion_Ancla	=> Ancla_P16	 );
	
POSICION_DE_PERSONA_17_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P17,			
		 Control_PJ		=> Control_A_P17,		   
		 Posicion_Ancla	=> Actual_P17	);
		 
POSICION_DE_PERSONA_17_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P17 ,			
		 Control_PJ		=> Control_pos_P17,		   
		 Posicion_Ancla	=> Ancla_P17	 );
	
POSICION_DE_PERSONA_18_ACTUAL_OP: entity work.Posicion_Jugador --UNO POR MONACHITO

 Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Ancla_P18,			
		 Control_PJ		=> Control_A_P18,		   
		 Posicion_Ancla	=> Actual_P18	);
		 
POSICION_DE_PERSONA_18_A_COMPARADOR_I: entity work.Posicion_Jugador --UNO POR MONACHITO
	Port map(
		 clk => clk,
		 rst => rst,
       Nueva_Posicion => Op_P18 ,			
		 Control_PJ		=> Control_pos_P18,		   
		 Posicion_Ancla	=> Ancla_P18	 );
	

	
--------------------------------------------------------------------------ROM MONACHITO----------------------------------------
ROM_PERSONA_1: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP1_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P1_MUX
 
 );
		
CONTADOR_PERSONA_1:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P1_e,
						syn_clr		=>'0',
						max_tick		=>Trash16,
			--			min_tick		=>m1,
						counter		=>ContadorP1_ROM,
						Hsync			=>Trash7,
						H_on			=>Trash8
			
			);	
		
ROM_PERSONA_2: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP2_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P2_MUX
 
 );
		
CONTADOR_PERSONA_2:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P2_e,
						syn_clr		=>'0',
						max_tick		=>Trash62,
			--			min_tick		=>m1,
						counter		=>ContadorP2_ROM,
						Hsync			=>Trash61,
						H_on			=>Trash60
			
			);		
		
ROM_PERSONA_3: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP3_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P3_MUX
 
 );
		
CONTADOR_PERSONA_3:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P3_e,
						syn_clr		=>'0',
						max_tick		=>Trash59,
			--			min_tick		=>m1,
						counter		=>ContadorP3_ROM,
						Hsync			=>Trash58,
						H_on			=>Trash57
			
			);		
			

ROM_PERSONA_4: entity work.buba
 Port map(
 
 		address	=> ContadorP4_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P4_MUX
 
 );
		
CONTADOR_PERSONA_4:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P4_e,
						syn_clr		=>'0',
						max_tick		=>Trash56,
			--			min_tick		=>m1,
						counter		=>ContadorP4_ROM,
						Hsync			=>Trash55,
						H_on			=>Trash54
			
			);		

ROM_PERSONA_5: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP5_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P5_MUX
 
 );
		
CONTADOR_PERSONA_5:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P5_e,
						syn_clr		=>'0',
						max_tick		=>Trash53,
			--			min_tick		=>m1,
						counter		=>ContadorP5_ROM,
						Hsync			=>Trash52,
						H_on			=>Trash51
			
			);			
			
ROM_PERSONA_6: entity work.buba
 Port map(
 
 		address	=> ContadorP6_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P6_MUX
 
 );
		
CONTADOR_PERSONA_6:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P6_e,
						syn_clr		=>'0',
						max_tick		=>Trash50,
			--			min_tick		=>m1,
						counter		=>ContadorP6_ROM,
						Hsync			=>Trash49,
						H_on			=>Trash48
			
			);		
			
ROM_PERSONA_7: entity work.buba
 Port map(
 
 		address	=> ContadorP7_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P7_MUX
 
 );
		
CONTADOR_PERSONA_7:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P7_e,
						syn_clr		=>'0',
						max_tick		=>Trash45,
			--			min_tick		=>m1,
						counter		=>ContadorP7_ROM,
						Hsync			=>Trash46,
						H_on			=>Trash47
			
			);		
			
ROM_PERSONA_8: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP8_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P8_MUX
 
 );
		
CONTADOR_PERSONA_8:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P8_e,
						syn_clr		=>'0',
						max_tick		=>Trash9,
			--			min_tick		=>m1,
						counter		=>ContadorP8_ROM,
						Hsync			=>Trash43,
						H_on			=>Trash44
			
			);
ROM_PERSONA_9: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP9_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P9_MUX
 
 );
		
CONTADOR_PERSONA_9:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P9_e,
						syn_clr		=>'0',
						max_tick		=>Trash80,
			--			min_tick		=>m1,
						counter		=>ContadorP9_ROM,
						Hsync			=>Trash81,
						H_on			=>Trash82
			
			);

ROM_PERSONA_10: entity work.buba
 Port map(
 
 		address	=> ContadorP10_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P10_MUX
 
 );
		
CONTADOR_PERSONA_10:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P10_e,
						syn_clr		=>'0',
						max_tick		=>Trash83,
			--			min_tick		=>m1,
						counter		=>ContadorP10_ROM,
						Hsync			=>Trash84,
						H_on			=>Trash85
			
			);
ROM_PERSONA_11: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP11_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P11_MUX
 
 );
		
CONTADOR_PERSONA_11:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P11_e,
						syn_clr		=>'0',
						max_tick		=>Trash86,
			--			min_tick		=>m1,
						counter		=>ContadorP11_ROM,
						Hsync			=>Trash87,
						H_on			=>Trash88
			
			);
ROM_PERSONA_12: entity work.buba
 Port map(
 
 		address	=> ContadorP12_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P12_MUX
 
 );
		
CONTADOR_PERSONA_12:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P12_e,
						syn_clr		=>'0',
						max_tick		=>Trash89,
			--			min_tick		=>m1,
						counter		=>ContadorP12_ROM,
						Hsync			=>Trash90,
						H_on			=>Trash91
			
			);
ROM_PERSONA_13: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP13_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P13_MUX
 
 );
		
CONTADOR_PERSONA_13:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P13_e,
						syn_clr		=>'0',
						max_tick		=>Trash92,
			--			min_tick		=>m1,
						counter		=>ContadorP13_ROM,
						Hsync			=>Trash93,
						H_on			=>Trash94
			
			);
ROM_PERSONA_14: entity work.buba
 Port map(
 
 		address	=> ContadorP14_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P14_MUX
 
 );
		
CONTADOR_PERSONA_14:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P14_e,
						syn_clr		=>'0',
						max_tick		=>Trash95,
			--			min_tick		=>m1,
						counter		=>ContadorP14_ROM,
						Hsync			=>Trash96,
						H_on			=>Trash97
			
			);

ROM_PERSONA_15: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP15_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P15_MUX
 
 );
		
CONTADOR_PERSONA_15:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P15_e,
						syn_clr		=>'0',
						max_tick		=>Trash110,
			--			min_tick		=>m1,
						counter		=>ContadorP15_ROM,
						Hsync			=>Trash111,
						H_on			=>Trash112
			
			);
			

ROM_PERSONA_16: entity work.buba
 Port map(
 
 		address	=> ContadorP16_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P16_MUX
 
 );
		
CONTADOR_PERSONA_16:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P16_e,
						syn_clr		=>'0',
						max_tick		=>Trash113,
			--			min_tick		=>m1,
						counter		=>ContadorP16_ROM,
						Hsync			=>Trash114,
						H_on			=>Trash115
			
			);

ROM_PERSONA_17: entity work.darthmaul
 Port map(
 
 		address	=> ContadorP17_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P17_MUX
 
 );
		
CONTADOR_PERSONA_17:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P17_e,
						syn_clr		=>'0',
						max_tick		=>Trash116,
			--			min_tick		=>m1,
						counter		=>ContadorP17_ROM,
						Hsync			=>Trash117,
						H_on			=>Trash118
			
			);

ROM_PERSONA_18: entity work.buba
 Port map(
 
 		address	=> ContadorP18_ROM,
		clock		=> clk,
		rden		=> '1',
		q		=> P18_MUX
 
 );
		
CONTADOR_PERSONA_18:entity work.ContadorHFuncionando --HACERLO POR CADA MONACHITO
 generic map(
					N => 10,
					C => "1111111111",
					R => "1111111111"
					) 
Port map(
						clk			=>clk1,
						rst			=>rst,
						ena			=>C_P18_e,
						syn_clr		=>'0',
						max_tick		=>Trash119,
			--			min_tick		=>m1,
						counter		=>ContadorP18_ROM,
						Hsync			=>Trash120,
						H_on			=>Trash121
			
			);

			
---------------------------------------------------------------------------CONTROLES DE MOVIMIENTO Y GENERAL---------------------------------------------
CONTROL_MAESTRO: entity work.Control_General

	Port map(
	
	Rst => rst,
   Clk => clk,
   Inicio => Start,
   Pause => Pausa,
--Max tic y comparacion
   Game_Over_comp => G_O_Control,
----------------------------
   Start_FSM => Inicio,
	Start_IMG => Inicio_IMG,
   Pause_FSM => Control_Pause,
   Game_Over_Start => Control_G_O

	
	);

Control_Movimiento: entity work. Control_movimiento
	Port map(
			Rst 					=>rst,
			Clk 					=>clk,
			Start             =>Inicio,
			Pause             => Control_Pause,
			--Max tic y comparacion
			Timer_FPS         => Time_up,
			Comp_Botones 		=>Comp_BotonesC,
       	Fin_VGA 				=>Fin_VGAC,
			
			--Enables contadores y bloques
			Control_PJ 			=>Control_pos,
			Control_A_PA		=>Control_A,
			Alm_Botones 		=>ALM_E,
			Control_Er        => Control_Ernie,
			Timer_e				=> Go_time
			


);

Control_Movimiento_Monachitos: entity work. Control_movimiento_MOD

port map (

Rst => rst,
Clk => clk,
Start => Inicio,
Pause => Control_Pause,
--Max tic y comparacion
Timer_FPS => Time_up_1,
Comp_Botones =>'1',
Fin_VGA => Fin_VGAC,

--Enables contadores y bloques
Control_P1_P => Control_pos_P1,
Control_P2_P => Control_pos_P2,
Control_P3_P => Control_pos_P3,
Control_P4_P => Control_pos_P4,
Control_P5_P => Control_pos_P5,
Control_P6_P => Control_pos_P6,
Control_P7_P => Control_pos_P7,



Control_Ac_P1 => Control_A_P1,
Control_Ac_P2 => Control_A_P2,
Control_Ac_P3 => Control_A_P3,
Control_Ac_P4 => Control_A_P4,
Control_Ac_P5 => Control_A_P5,
Control_Ac_P6 => Control_A_P6,
Control_Ac_P7 => Control_A_P7,


Alm_Botones => Trash6,
Control_INI_P1 => Control_P1,
Control_INI_P2 => Control_P2,
Control_INI_P3 => Control_P3,
Control_INI_P4 => Control_P4,
Control_INI_P5 => Control_P5,
Control_INI_P6 => Control_P6,
Control_INI_P7 => Control_P7,


Timer_e => Go_time_P1


);

Control_Movimiento_Monachitos_F2: entity work. Control_movimiento_MOD

port map (

Rst => rst,
Clk => clk,
Start => Inicio,
Pause => Control_Pause,
--Max tic y comparacion
Timer_FPS => Time_up_2,
Comp_Botones =>'1',
Fin_VGA => Fin_VGAC,

--Enables contadores y bloques
Control_P1_P => Control_pos_P8,
Control_P2_P => Control_pos_P9,
Control_P3_P => Control_pos_P10,
Control_P4_P => Control_pos_P11,
Control_P5_P => Control_pos_P12,
Control_P6_P => Control_pos_P13,
Control_P7_P => Trash124,



Control_Ac_P1 => Control_A_P8,
Control_Ac_P2 => Control_A_P9,
Control_Ac_P3 => Control_A_P10,
Control_Ac_P4 => Control_A_P11,
Control_Ac_P5 => Control_A_P12,
Control_Ac_P6 => Control_A_P13,
Control_Ac_P7 => Trash123,


Alm_Botones => Trash106,
Control_INI_P1 => Control_P8,
Control_INI_P2 => Control_P9,
Control_INI_P3 => Control_P10,
Control_INI_P4 => Control_P11,
Control_INI_P5 => Control_P12,
Control_INI_P6 => Control_P13,
Control_INI_P7 => Trash101,


Timer_e => Go_time_P2


);

--Control_Movimiento_Monachitos_F3: entity work. Control_movimiento_MOD
--
--port map (
--
--Rst => rst,
--Clk => clk,
--Start => Inicio,
--Pause => Control_Pause,
----Max tic y comparacion
--Timer_FPS => Time_up_3,
--Comp_Botones =>'1',
--Fin_VGA => Fin_VGAC,
--
----Enables contadores y bloques
--Control_P1_P => Control_pos_P14,
--Control_P2_P => Control_pos_P15,
--Control_P3_P => Control_pos_P16,
--Control_P4_P => Control_pos_P17,
--Control_P5_P => Control_pos_P18,
--Control_P6_P => Trash102,
--Control_P7_P => Trash103,
--
--
--
--Control_Ac_P1 => Control_A_P14,
--Control_Ac_P2 => Control_A_P15,
--Control_Ac_P3 => Control_A_P16,
--Control_Ac_P4 => Control_A_P17,
--Control_Ac_P5 => Control_A_P18,
--Control_Ac_P6 => Trash104,
--Control_Ac_P7 => Trash105,
--
--
--Alm_Botones => Trash107,
--Control_INI_P1 => Control_P14,
--Control_INI_P2 => Control_P15,
--Control_INI_P3 => Control_P16,
--Control_INI_P4 => Control_P17,
--Control_INI_P5 => Control_P18,
--Control_INI_P6 => Trash108,
--Control_INI_P7 => Trash109,
--
--
--Timer_e => Go_time_P3
--
--
--);
---------------------------------------------------------------------------COMPARADORES-------------------------------------------------------------------
COMPARADORPAUSA:entity work.COMPARADOR_PS
Port map (

 Pantalla_X => Screen_X ,
 Pantalla_y => Screen_Y ,
 --Futura ancla
 Compa_Letra_P => CLP_e,
 Compa_Letra_A => CLA2_e,
 Compa_Letra_U => CLU_e,
 Compa_Letra_S => CLS_e,
 Compa_Letra_E => CLE3_e,
 
 Pause_MUX => PARAPS


);

COMPARADOR_GAMEO_ROM: entity work.Comparador_I_MOD	
port map (

 Pantalla_X => Screen_X ,
 Pantalla_y => Screen_Y ,
 --Futura ancla
 Compa_Letra_G => CLG_e,
 Compa_Letra_A => CLA_e,
 Compa_Letra_M => CLM_e,
 Compa_Letra_E => CLE_e,
 Compa_Letra_O => CLO_e,
 Compa_Letra_V => CLV_e,
 Compa_Letra_E2 => CLE2_e,
 Compa_Letra_R => CLR_e,
 Game_over_MUX => PARAGO

);

Comparador_GameO: entity work.Comparador_GAME_OVER
	Port map(
					 
	              --ANCLA JUGADORES
					  Ancla_X => Pos_XY_X,
					  Ancla_Y=>  Pos_XY_Y,
					 --ANCLA PERSONAS
					 Ancla_X1  => Pos_XY_X_P1 ,
					 Ancla_Y1  => Pos_XY_Y_P1,
					 Ancla_X2  => Pos_XY_X_P2,
					 Ancla_Y2  => Pos_XY_Y_P2,
					 Ancla_X3  => Pos_XY_X_P3,
					 Ancla_Y3  => Pos_XY_Y_P3,
					 Ancla_X4  => Pos_XY_X_P4,
					 Ancla_Y4  => Pos_XY_Y_P4,
					 Ancla_X5  => Pos_XY_X_P5,
					 Ancla_Y5  => Pos_XY_Y_P5,
					 Ancla_X6  => Pos_XY_X_P6,
					 Ancla_Y6  => Pos_XY_Y_P6,
					 Ancla_X7  => Pos_XY_X_P7,
					 Ancla_Y7  => Pos_XY_Y_P7,
					 Ancla_X8  => Pos_XY_X_P8,
					 Ancla_Y8  => Pos_XY_Y_P8,
					 Ancla_X9  => Pos_XY_X_P9,
					 Ancla_Y9  => Pos_XY_Y_P9,
					 Ancla_X10  => Pos_XY_X_P10,
					 Ancla_Y10  => Pos_XY_Y_P10,
					 Ancla_X11  => Pos_XY_X_P11,
					 Ancla_Y11  => Pos_XY_Y_P11,
					 Ancla_X12  => Pos_XY_X_P12,
					 Ancla_Y12  => Pos_XY_Y_P12,
					 Ancla_X13  => Pos_XY_X_P13,
					 Ancla_Y13  => Pos_XY_Y_P13,
					 Ancla_X14  => Pos_XY_X_P14,
					 Ancla_Y14  => Pos_XY_Y_P14,
					 Ancla_X15  => Pos_XY_X_P15,
					 Ancla_Y15  => Pos_XY_Y_P15,
					 Ancla_X16  => Pos_XY_X_P16,
					 Ancla_Y16  => Pos_XY_Y_P16,
					 Ancla_X17  => Pos_XY_X_P17,
					 Ancla_Y17  => Pos_XY_Y_P17,
					 Ancla_X18  => Pos_XY_X_P18,
					 Ancla_Y18  => Pos_XY_Y_P18,
					 Comp_Game_Over => G_O_Control
					 
					  
					 );
					 
COMPARADOR_GENERAL: entity work.Comparador_MONACHOS
	Port map(
	Game_Over => Control_G_O,
	Pausa => Control_Pause,
   Pantalla_X  => Screen_X ,
   Pantalla_y => Screen_Y,
 --Futura ancla
	 Ancla_X   => Pos_XY_X, 
	 Ancla_Y	  => Pos_XY_Y,
	 Ancla_X1  => Pos_XY_X_P1 ,
	 Ancla_Y1  => Pos_XY_Y_P1,
	 Ancla_X2  => Pos_XY_X_P2,
	 Ancla_Y2  => Pos_XY_Y_P2,
	 Ancla_X3  => Pos_XY_X_P3,
	 Ancla_Y3  => Pos_XY_Y_P3,
	 Ancla_X4  => Pos_XY_X_P4,
	 Ancla_Y4  => Pos_XY_Y_P4,
	 Ancla_X5  => Pos_XY_X_P5,
	 Ancla_Y5  => Pos_XY_Y_P5,
	 Ancla_X6  => Pos_XY_X_P6,
	 Ancla_Y6  => Pos_XY_Y_P6,
	 Ancla_X7  => Pos_XY_X_P7,
	 Ancla_Y7  => Pos_XY_Y_P7,
	 Ancla_X8  => Pos_XY_X_P8,
	 Ancla_Y8  => Pos_XY_Y_P8,
	 Ancla_X9  => Pos_XY_X_P9,
	 Ancla_Y9  => Pos_XY_Y_P9,
	 Ancla_X10  => Pos_XY_X_P10,
	 Ancla_Y10  => Pos_XY_Y_P10,
	 Ancla_X11  => Pos_XY_X_P11,
	 Ancla_Y11  => Pos_XY_Y_P11,
	 Ancla_X12  => Pos_XY_X_P12,
	 Ancla_Y12  => Pos_XY_Y_P12,
	 Ancla_X13  => Pos_XY_X_P13,
	 Ancla_Y13  => Pos_XY_Y_P13,
	 Ancla_X14  => Pos_XY_X_P14,
	 Ancla_Y14  => Pos_XY_Y_P14,
	 Ancla_X15  => Pos_XY_X_P15,
	 Ancla_Y15  => Pos_XY_Y_P15,
	 Ancla_X16  => Pos_XY_X_P16,
	 Ancla_Y16  => Pos_XY_Y_P16,
	 Ancla_X17  => Pos_XY_X_P17,
	 Ancla_Y17  => Pos_XY_Y_P17,
	 Ancla_X18  => Pos_XY_X_P18,
	 Ancla_Y18  => Pos_XY_Y_P18,
	 
	 ------------enables para los contadores 
	 Comp_control_1=> C_P1_e ,
	 Comp_control_2=> C_P2_e,
	 Comp_control_3=> C_P3_e,
	 Comp_control_4=> C_P4_e,
	 Comp_control_5=> C_P5_e,
	 Comp_control_6=> C_P6_e,
	 Comp_control_7 => C_P7_e,
	 Comp_control_8 => C_P8_e,
	 Comp_control_9 => C_P9_e,
	 Comp_control_10 => C_P10_e,
	 Comp_control_11 => C_P11_e,
	 Comp_control_12 => C_P12_e,
	 Comp_control_13 => C_P13_e,
	 Comp_control_14 => C_P14_e,
	 Comp_control_15 => C_P15_e,
	 Comp_control_16 => C_P16_e,
	 Comp_control_17 => C_P17_e,
	 Comp_control_18 => C_P18_e,
	 Comp_jugador => C_J_e,
	 -------------habilitadores de los muxes de pausa y game over
	 Comp_Game_Over => ENABLE_GO,
	 Comp_Pausa => ENABLE_PS,
	 -------------seleccion para el mux principal
	 MUX_MMONACHOS => PARA_VISIBLE, 
	 ------------habilitadores reinicio de pos
	 Comp_reinicio_1 => Comp_reinicio_P1, 
	 Comp_reinicio_2 => Comp_reinicio_P2,
	 Comp_reinicio_3 => Comp_reinicio_P3,
	 Comp_reinicio_4 => Comp_reinicio_P4,
	 Comp_reinicio_5 => Comp_reinicio_P5,
 	 Comp_reinicio_6 => Comp_reinicio_P6,
	 Comp_reinicio_7 => Comp_reinicio_P7,
	 Comp_reinicio_8 => Comp_reinicio_P8,
	 Comp_reinicio_9 => Comp_reinicio_P9,
	 Comp_reinicio_10 => Comp_reinicio_P10,
	 Comp_reinicio_11 => Comp_reinicio_P11,
	 Comp_reinicio_12 => Comp_reinicio_P12,
	 Comp_reinicio_13 => Comp_reinicio_P13,
	 Comp_reinicio_14 => Comp_reinicio_P14,
	 Comp_reinicio_15 => Comp_reinicio_P15,
	 Comp_reinicio_16 => Comp_reinicio_P16,
	 Comp_reinicio_17 => Comp_reinicio_P17,
	 Comp_reinicio_18 => Comp_reinicio_P18,
	 Comp_reinicio_jugador => Comp_reinicio_Ernie
		);
		
		
Comparador_f: entity work.Comparador_FONDO
		 Port map( 

 Pantalla_X =>Screen_X,
 Pantalla_y =>Screen_Y, 
 --Futura ancla
 Salida_Fondo => F_MUX
  
 );
 
 ---------------------------------------------------------------------------MUXES---------------------------------------------------------------------------
 MUX_VISIBLE: entity work.MUX
 port Map(
       
          Monacho1            => P1_MUX,
          Monacho2            => P2_MUX,
          Monacho3            => P3_MUX,
          Monacho4            => P4_MUX,
          Monacho5            => P5_MUX,
          Monacho6            => P6_MUX,
          Monacho7            => P7_MUX,
          Monacho8            => P8_MUX,
			 Monacho9            => P9_MUX,
			 Monacho10            => P10_MUX,
			 Monacho11            => P11_MUX,
			 Monacho12            => P12_MUX,
			 Monacho13            => P13_MUX,
			 Monacho14            => P14_MUX,
			 Monacho15            => P15_MUX,
			 Monacho16            => P16_MUX,
			 Monacho17            => P17_MUX,
			 Monacho18            => P18_MUX,
			 Jugador             => J_MUX,
          GameOver          	=> GM_MUX,
          Pause            	=> PS_MUX,
			 Background          => F_MUX,
          Comp_Mux          	=> PARA_VISIBLE,
          Salida_Mux_Obj   	=> Salida_MUX
      
    );

MUX_GAME_OVER: entity work.MUX_GO

port map (
        
          LetraG => LETRA_G,
          LetraA => LETRA_A,
          LetraM => LETRA_M,
          LetraE1 => LETRA_E,
          LetraO => LETRA_O,
          LetraV => LETRA_V,
          LetraE2 => LETRA_E2,
          LetraR => LETRA_R,
          
          EnableGO => ENABLE_GO,
          Comp_MUX_GO => PARAGO,
          Salida_MUX_GO => GM_MUX   
       
    );
     	 
MUX_PAUSA: entity work. Mux_PS

port map (

          LetraP => LETRA_P,
          LetraA => LETRA_A2,
          LetraU => LETRA_U,
          LetraS => LETRA_S,
          LetraE => LETRA_E3,
         
          
          Enable_PS => ENABLE_PS,
          Comp_Mux_PS => PARAPS,
          Salida_Mux_PS => PS_MUX

);

---------------------------------------------------------------------------------------------------VGA------------------------------------------------------------------
BLOQUE_PARA_EL_VGA: entity work.Visible_F
	Port map(
						  Control_Visible_F => VE,	
						  clk			=>clk,
						  rst			=>rst,
					     MUX_visible => Salida_MUX,
						  
						  HsyncValor				=>Screen_X,
						  VsyncValor				=>Screen_Y,
						 
						  Hsync1						=>HS,
						  Vsync1					   =>VS,
						  
						  clk25MHz => clk1,
						  Contador525s => C_525,
		              Contador800s => C_800,
						  Rs							=>R,
						  Gs							=>G,	
						  Bs							=>B
			);

End architecture JUEGO_VGA_arch;

