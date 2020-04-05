-- Elementos de Sistemas
-- by Luciano Soares
-- Ram512.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram512 is

	component Ram64 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 5 downto 0);
			output:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Mux8Way16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				c:   in  STD_LOGIC_VECTOR(15 downto 0);
				d:   in  STD_LOGIC_VECTOR(15 downto 0);
				e:   in  STD_LOGIC_VECTOR(15 downto 0);
				f:   in  STD_LOGIC_VECTOR(15 downto 0);
				g:   in  STD_LOGIC_VECTOR(15 downto 0);
				h:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC_VECTOR( 2 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component DMux8Way is
		port (
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;

	signal load0, load1, load2, load3, load4, load5, load6, load7 : STD_LOGIC;
	signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin
	REGISTRA1: Ram64 port map(clock,input,load0, address(5 downto 0), output0);
	REGISTRA2: Ram64 port map(clock,input,load1, address(5 downto 0), output1);
	REGISTRA3: Ram64 port map(clock,input,load2, address(5 downto 0), output2);
	REGISTRA4: Ram64 port map(clock,input,load3, address(5 downto 0), output3);
	REGISTRA5: Ram64 port map(clock,input,load4, address(5 downto 0), output4);
	REGISTRA6: Ram64 port map(clock,input,load5, address(5 downto 0), output5);
	REGISTRA7: Ram64 port map(clock,input,load6, address(5 downto 0), output6);
	REGISTRA8: Ram64 port map(clock,input,load7, address(5 downto 0), output7);
	MUX: Mux8Way16 port map( output0,output1,output2,output3,output4,output5,output6,output7,address(8 downto 6),output);
	DMUX: DMux8Way port map( load,address(8 downto 6),load0,load1,load2,load3,load4,load5,load6,load7);  


end architecture;
