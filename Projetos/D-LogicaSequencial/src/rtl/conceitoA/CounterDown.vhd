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

	signal que: std_logic_vector(2 downto 0) := "000";

begin
	process(clock)
		begin

		if (rising_edge(clock)) then

				if (que="111") then		
					que <= "110";	
				elsif (que="110") then	
					que <= "101";	
				elsif (que="101") then	
					que <= "100";	
				elsif (que="100") then	
					que <= "011";	
				elsif (que="011") then	
					que <= "010";	
				elsif (que="010") then	
					que <= "001";	
				elsif (que="001") then	
					que <= "000";	
				elsif (que="000") then	
					que <= "111";	

				end if;

		end if;

	end process;

	q <= que;

end architecture;