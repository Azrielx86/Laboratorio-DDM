library ieee;
use ieee.std_logic_1164.all;

entity memoryl is
  generic (
    N : integer := 8;
    M : integer := 4
  );
  port (
    clk, writ : std_logic;
    address : in integer range 0 to 2 ** M - 1;
    data_in : in std_logic_vector(N - 1 downto 0);
    data_out : out std_logic_vector(N - 1 downto 0));
end entity;

architecture memoryl of memoryl is
  type memory is array(0 to 2 ** M - 1) of std_logic_vector(N - 1 downto 0);
  signal ram : memory;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if writ = '1' then
        ram(address) <= data_in;
      end if;
    end if;
  end process;
  data_out <= ram(address);
end architecture;