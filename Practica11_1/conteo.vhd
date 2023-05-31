library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity conteo is
  generic (lim : integer := 9);
  port (
    M : in std_logic;
    rst : in std_logic;
    flnc : out std_logic;
    MD : out std_logic_vector (3 downto 0));
end conteo;

architecture Behavioral of conteo is
begin
  process (M)
    variable cuenta : std_logic_vector (3 downto 0) := "0000";
  begin
    if (rst = '0') then
      cuenta := "0000";
    elsif rising_edge(M) then
      if cuenta = lim then
        cuenta := "0000";
        flnc <= '1';
      else
        cuenta := cuenta + 1;
        flnc <= '0';
      end if;
    end if;
    MD <= cuenta;
  end process;

end Behavioral;