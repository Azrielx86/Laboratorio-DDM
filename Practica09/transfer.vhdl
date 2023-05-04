library ieee;
use ieee.std_logic_1164.all;

entity transfer is
  port (
    clk : in std_logic;
    q : out std_logic_vector(6 downto 0);
    d : in std_logic_vector(6 downto 0)
  );
end entity;

architecture behavioral of transfer is
begin
  process (clk)
  begin
    if rising_edge(clk) then
      q <= d;
    end if;
  end process;
end behavioral;