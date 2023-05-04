library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity palabras is
  port (
    clock : std_logic;
    display : out std_logic_vector(6 downto 0)
  );
end entity;

architecture behavioral of palabras is
  signal Qin : std_logic_vector(2 downto 0) := "000";
begin
  process (clock)
    variable cuenta : std_logic_vector(2 downto 0) := "000";
  begin
    if rising_edge(clock) then
      cuenta := cuenta + 1;
    end if;
    Qin <= cuenta;
  end process;

  process (Qin)
  begin
    case Qin is
      when "000" => display <= "0001001"; --H
      when "001" => display <= "1000000"; --O
      when "010" => display <= "1000111"; --L
      when "011" => display <= "0001000"; --A
      when "100" => display <= "0001100"; --P
      when "101" => display <= "1000000"; --O
      when "110" => display <= "1000111"; --L
      when "111" => display <= "1000000"; --O
      when others => display <= "1111111"; --OFF
    end case;
  end process;
end architecture;