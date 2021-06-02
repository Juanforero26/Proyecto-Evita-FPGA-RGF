library IEEE;
USE ieee.std_logic_1164.all;

Entity Movimiento_Jugador is
    port(
        Botones					: In Std_logic_vector(3 downto 0);
		  Posicion_JugadorX		: In Std_logic_vector(9 downto 0);
		  Posicion_JugadorY		: In Std_logic_vector(9 downto 0);
		  Nueva_Posicion			: Out Std_logic_vector(19 downto 0)
		  
    );
End Entity Movimiento_Jugador;

architecture Movimiento_Jugador_arch of Movimiento_Jugador is
   
	--signals
signal Up,Down :std_logic_vector(10 downto 0);
signal Lft,Rght:std_logic_vector(10 downto 0);
signal PosY,PosX: std_logic_vector(10 downto 0);
signal Up_MUX, Down_MUX, Lft_MUX,Rght_MUX :std_logic_vector(19 downto 0);
   --Salen coordenadas X&Y 
begin

PosY <= '0' & Posicion_JugadorY;
PosX <= '0' & Posicion_JugadorX;
Up_MUX <= Posicion_JugadorX & UP(9 downto 0);
Down_MUX <= Posicion_JugadorX & Down(9 downto 0);
Lft_MUX <= Lft(9 downto 0) & Posicion_JugadorY;
Rght_MUX <= Rght(9 downto 0) & Posicion_JugadorY;
   --modulos
   Arriba: entity work.Full_Sub
	port map(
	OP1	=> PosY,
   OP2   => "00000001010",--20 = 10100
	Carry_in  =>'0',
	Total => Up
	);
	
	Abajo: entity work.Full_adder
	port map(
	OP1	=> PosY,
   OP2   => "00000001010",--20
	Carry_in  =>'0',
	Total => Down
	);
	
	Izquierda: entity work.Full_Sub
	port map(
	OP1	=> PosX,
   OP2   => "00000001010",--20
	Carry_in  =>'0',
	Total => Lft
	);
	
	Derecha: entity work.Full_adder
	port map(
	OP1	=> PosX,
   OP2   => "00000001010",--20
	Carry_in  =>'0',
	Total => Rght
	);
	
  --MUX
  
  MUX: entity work.MUX4
	port map(
	     InA    => Up_MUX,
		  InB    => Down_MUX,
		  InC    => Lft_MUX,
		  InD	   => Rght_MUX,
		  Sel    => Botones,
 		  Output => Nueva_Posicion
	);  

End architecture Movimiento_Jugador_arch;