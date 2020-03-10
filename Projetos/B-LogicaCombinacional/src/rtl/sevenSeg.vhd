library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
		bcd0, bcd1, bcd2, bcd3: in  std_logic_vector(3 downto 0);
		led0, led1, led2, led3: out std_logic_vector(6 downto 0)
	);	
	end entity;

architecture arch of sevenSeg is
begin

	with bcd0 select

	led0(6 downto 0) <= "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0011000" when "1001",
				"1111111" when others;
	
	with bcd1 select
	

	led1(6 downto 0) <= "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0011000" when "1001",
				"1111111" when others;
	with bcd2 select
	led2(6 downto 0) <= "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0011000" when "1001",
				"1111111" when others;
	with bcd3 select
	led3(6 downto 0) <= "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0011000" when "1001",
				"1111111" when others;
				
end architecture;
