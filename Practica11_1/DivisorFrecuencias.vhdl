library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DivisorFrecuencias is
  port (
    reloj : std_logic;
    div_clk : out std_logic;
    fast : in std_logic;
    pause : in std_logic
  );
end entity;

architecture behavioral of DivisorFrecuencias is
begin
  process (reloj)
    variable cuenta : std_logic_vector(27 downto 0) := X"0000000";
    variable limit : std_logic_vector(27 downto 0) := X"17D7840";
    variable tmp : std_logic := '0';
  begin
    if rising_edge(reloj) then
      if pause = '1' then
        cuenta := cuenta xor cuenta;
      end if;

      if cuenta >= limit then
        cuenta := X"0000000";
        tmp := not tmp;
      else
        cuenta := cuenta + 1;
      end if;
    end if;

    if fast = '0' then
      limit := X"17D7840";
    else
      limit := X"003D090";
    end if;

    div_clk <= tmp;
  end process;
end architecture;