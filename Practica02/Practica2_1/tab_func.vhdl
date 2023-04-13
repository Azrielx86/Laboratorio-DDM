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
    display <= "1001111" when "000", -- 1
    "0010010" when "001", -- 2
    "0010010" when "010", -- 2
    "0010010" when "011", -- 2
    "0000110" when "100", -- 3
    "0000110" when "101", -- 3
    "0000110" when "110", -- 3
    "1111111" when others;

end architecture;