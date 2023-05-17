library ieee;
use ieee.std_logic_1164.all;

entity my_fsml is
  port (
    tog_en : in std_logic;
    clk : in std_logic;
    reset : in std_logic;
    Z1 : out std_logic
  );
end entity;

architecture fsml of my_fsml is
  type state_type is (ST0, ST1);
  signal PS, NS : state_type;
begin
  process (reset, NS, clk)
  begin
    if reset = '1' then
      PS <= ST0;
    elsif rising_edge(clk) then
      PS <= NS;
    end if;
  end process;

  process (PS, tog_en)
  begin
    Z1 <= '0';
    case PS is
      when ST0 =>
        Z1 <= '0';
        if tog_en = '1' then
          NS <= ST1;
        else
          NS <= ST0;
        end if;
      when ST1 =>
        Z1 <= '1';
        if tog_en = '1' then
          NS <= ST0;
        else
          NS <= ST1;
        end if;
      when others =>
        Z1 <= '0';
        NS <= ST0;
    end case;
  end process;
end architecture;