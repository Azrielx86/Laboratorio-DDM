library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tab_func is
  port (
    x, y, z : in std_logic;
    salida : out std_logic);
end tab_func;

architecture Behavioral of tab_func is
begin
  salida <= (x and (not y)) or ((not x) and z);
end Behavioral;