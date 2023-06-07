library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity main is
  port (
    address : in std_logic_vector(3 downto 0);
    data : out std_logic_vector(6 downto 0));
end entity;

architecture behavioral of main is
signal dir_aux : integer;
begin

dir_aux <= conv_integer(unsigned(address));

inst_mem : work.memoryl (memoryl) port map(
	address => dir_aux,
	data => data
);
end architecture;