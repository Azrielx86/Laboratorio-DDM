library ieee;
use ieee.std_logic_1164.all;

entity memoryl is
  port (
    address : in integer range 0 to 9;
    data : out std_logic_vector(6 downto 0));
end entity;

architecture memoryl of memoryl is
  type memory is array(0 to 9) of std_logic_vector(6 downto 0);
  constant rom : memory := (
    "0000001",
    "1001111",
    "0010010",
    "0000110",
    "1001100",
    "0100100",
    "0100000",
    "0001111",
    "0000000",
    "0001100"
  );

begin
  data <= rom(address);
end architecture;