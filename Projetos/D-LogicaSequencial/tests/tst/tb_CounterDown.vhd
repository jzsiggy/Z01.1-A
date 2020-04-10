-- Elementos de Sistemas
-- tb_CounterDown.vhd

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_CounterDown is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_CounterDown is

	component CounterDown is
    port(
      clock:  in std_logic;
      q:      out std_logic_vector(2 downto 0)
      );
	end component;

	signal clk : std_logic := '0';
  signal q   : std_logic_vector(2 downto 0);

begin

	mapping: CounterDown port map(clk, q);

	clk <= not clk after 100 ps;

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    -- TESTE 1
    wait until clk'event and clk='0';
		assert(Q = "111")  report "Falha em teste 1" severity error;
    -- TESTE 2
    wait until clk'event and clk='0';
		assert(Q = "110")  report "Falha em teste 2" severity error;
    -- TESTE 3
    wait until clk'event and clk='0';
		assert(Q = "101")  report "Falha em teste 3" severity error;
    -- TESTE 4
    wait until clk'event and clk='0';
		assert(Q = "100")  report "Falha em teste 4" severity error;
    -- TESTE 5
    wait until clk'event and clk='0';
		assert(Q = "011")  report "Falha em teste 5" severity error;
    -- TESTE 6
    wait until clk'event and clk='0';
    assert(Q = "010")  report "Falha em teste 6" severity error;
    -- TESTE 7
    wait until clk'event and clk='0';
    assert(Q = "001")  report "Falha em teste 7" severity error;
    -- TESTE 8
    wait until clk'event and clk='0';
    assert(Q = "000")  report "Falha em teste 8" severity error;
    


    -- finish
    wait until clk'event and clk='0';
    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;