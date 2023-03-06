library ieee;
use ieee.std_logic_1164.all;

entity tab_func is
  port (
    entrada : in std_logic_vector(2 downto 0);
    display : out std_logic_vector(6 downto 0)
  );
end entity;

architecture Behavioral of tab_func is
begin
  with entrada select
    display <= "1000000" when "000",
    "1000110" when "001",
    "0000110" when "010",
    "0000110" when "011",
    "0010010" when "100",
    "0010010" when "101",
    "0010010" when "110",
    "0000000" when others;

end architecture;