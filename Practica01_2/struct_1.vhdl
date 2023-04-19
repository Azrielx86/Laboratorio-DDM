library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity struct_1 is
  port (
    a0 : in std_logic;
    a1 : in std_logic;
    salida : out std_logic_vector(2 downto 0));
end entity;

architecture BEHAVIORAL of struct_1 is
begin
  salida <= "001" when a0 = '0' and a1 = '0' else
    "010" when a0 = '1' and a1 = '0' else
    "011" when a0 = '0' and a1 = '1' else
    "100" when a0 = '1' and a1 = '1' else
    "000";
end BEHAVIORAL;