-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

 

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

 

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

 

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000"
    );
end entity;

 

architecture arch of PC is

 

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

<<<<<<< HEAD
 

 component Mux2Way16 is
   port (
     a:   in  STD_LOGIC_VECTOR(15 downto 0);
     b:   in  STD_LOGIC_VECTOR(15 downto 0);
     sel: in  STD_LOGIC;
     q:   out STD_LOGIC_VECTOR(15 downto 0)
     );
 end component;

 

  component Register16 is
    port(
        clock:   in STD_LOGIC;
        input:   in STD_LOGIC_VECTOR(15 downto 0);
        load:    in STD_LOGIC;
        output: out STD_LOGIC_VECTOR(15 downto 0)
      );
   end component;

   SIGNAL pcout, incout, muxincout, muxloadout, muxresetout: STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";
=======
  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
>>>>>>> upstream/master

begin

  INC: Inc16 port map (pcout, incout);
  MUXINC: Mux2Way16 port map(pcout, incout, increment, muxincout);
  MUXLOAD: Mux2Way16 port map(muxincout, input, load, muxloadout);
  MUXRESET: Mux2Way16 port map(muxloadout, "0000000000000000", reset, muxresetout);
  REGISTER1: Register16 port map (clock, muxresetout, '1', pcout);
  output <= pcout;


end architecture;