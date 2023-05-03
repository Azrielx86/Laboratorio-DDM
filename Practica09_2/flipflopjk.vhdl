library ieee;
use ieee.std_logic_1164.all;

entity flipflopjk is
  port (
    clk : in std_logic;
    reset : in std_logic;
    j : in std_logic;
    k : in std_logic;
    q : out std_logic;
    qn : out std_logic
  );
end entity;

architecture behavioral of flipflopjk is
begin
  process (clk)
    variable tmp : std_logic;
  begin
    if (reset = '0') then
      tmp := '0';
    elsif (clk = '1' and clk'event) then
      if (j = '0' and k = '0') then
        tmp := tmp;
      elsif (j = '1' and k = '1') then
        tmp := not tmp;
      elsif (j = '0' and k = '1') then
        tmp := '0';
      else
        tmp := '1';
      end if;
    end if;
	 q <= tmp;
	 qn <= not tmp;
  end process;
end architecture;