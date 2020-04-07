-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is

begin
	process (clock) begin

		if (q = "000") then
			q <= "111";
		elsif (q = "111") then
			q <= "110";
		elsif (q = "110") then
			q <= "101";
		elsif (q = "101") then
			q <= "100";
		elsif (q = "100") then
			q <= "011";
		elsif (q = "011") then
			q <= "010";
		elsif (q = "010") then
			q <= "001";
		elsif (q = "001") then
			q <= "000";
		end if;

	end process;

end architecture;
