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
  signal Qin : std_logic_vector(1 downto 0) := "00";
begin
  process (clock)
    variable cuenta : std_logic_vector(1 downto 0) := "00";
  begin
    if rising_edge(clock) then
      cuenta := cuenta + 1;
    end if;
    Qin <= cuenta;
  end process;

  process (Qin)
  begin
    case Qin is
      when "00" => display <= "0001001";
      when "01" => display <= "1000000";
      when "10" => display <= "1000111";
      when "11" => display <= "0001000";
      when others => display <= "1111111";
    end case;
  end process;
end architecture;