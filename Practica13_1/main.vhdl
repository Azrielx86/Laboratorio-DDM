library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity main is
  port (
    clk : std_logic;
    writ : in std_logic;
    address : in std_logic_vector(3 downto 0);
    data_in : in std_logic_vector(3 downto 0);
    display_out : out std_logic_vector(6 downto 0));
end entity;

architecture behavioral of main is
  signal dir_aux : integer;
  signal div_clk : std_logic;
  signal data : std_logic_vector(3 downto 0);
  
begin

  dir_aux <= conv_integer(unsigned(address));

  inst_mem : work.memoryl (memoryl) generic map(4, 4) port map(
  clk => div_clk,
  writ => writ,
  address => dir_aux,
  data_in => data_in,
  data_out => data
  );

  div_freq : work.DivisorFrecuencias (behavioral) port map(
  reloj => clk,
  div_clk => div_clk
  );

  inst_dec : work.decoder (behavioral) port map(
  input => data,
  output => display_out
  );
end architecture;