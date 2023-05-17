library ieee;
use ieee.std_logic_1164.all;

entity main is
  port (
    tog_en : in std_logic;
    clk : in std_logic;
    reset : in std_logic;
    Z1 : out std_logic
  );
end entity;

architecture fsml of main is
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


-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all;
-- use ieee.std_logic_unsigned.all;

-- entity main is port (
--   reloj : std_logic;
--   div_clk : std_logic;
--   led_out : out std_logic;
--   tog : in std_logic;
--   reset : in std_logic

-- );
-- end entity;

-- architecture behavioral of main is
--   component my_fsml is
--     port (
--       tog_en : in std_logic;
--       clk : in std_logic;
--       reset : in std_logic;
--       Z1 : out std_logic
--     );
--   end component;
-- 	signal div : std_logic := div_clk;
-- begin
--   inst_fsml : my_fsml port map(
--     tog_en => tog,
--     clk => div,
--     reset => reset,
--     Z1 => led_out
--   );

--   process (reloj)
--     variable cuenta : std_logic_vector(27 downto 0) := X"0000000";
--   begin
--     if rising_edge(reloj) then
--       if cuenta = X"48009E0" then
--         cuenta := X"0000000";
--       else
--         cuenta := cuenta + 1;
--       end if;
--     end if;
--     div_clk <= cuenta(26);
--   end process;
-- end architecture;