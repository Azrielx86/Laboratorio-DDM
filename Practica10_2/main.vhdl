library ieee;
use ieee.std_logic_1164.all;

entity main is
  port (
    r : in std_logic_vector(2 downto 0);
    clk : in std_logic;
    reset : in std_logic; -- boton
    -- r : in std_logic_vector(2 downto 0);
    g : out std_logic_vector(2 downto 0);
		display : out std_logic_vector(6 downto 0)
  );
end entity;

architecture fsml of main is
  component DivisorFrecuencias is
    port (
      reloj : std_logic;
      div_clk : out std_logic
    );
  end component;
  signal div : std_logic;
  type state_type is (idle, grant1, grant2, grant3);
  signal PS, NS : state_type;
begin
  div_frec : DivisorFrecuencias port map(
    reloj => clk,
    div_clk => div
  );
  process (reset, NS, div)
  begin
    if reset = '0' then
      PS <= idle;
    elsif rising_edge(div) then
      PS <= NS;
    end if;
  end process;

  process (PS, r)
  begin
    g <= "000";
		display <= "0000000";
    case PS is
      when idle =>
        g <= "000";
				display <= "0000000";
        if r = "000" then
          NS <= idle;
        elsif r(0) = '1' then
          NS <= grant1;
        elsif r(0) = '0' and r(1) = '1' then
          NS <= grant2;
        elsif r(0) = '0' and r(1) = '0' and r(2) = '1' then
          NS <= grant3;
				else
					NS <= idle;
        end if;

      when grant1 =>
        g <= "100";
				display <= "1001111";
        if r(0) = '1' then
          NS <= grant1;
        elsif r(0) = '0' then
          NS <= idle;
        end if;

      when grant2 =>
        -- g(1) <= '1';
				g <= "010";
				display <= "0010010";
        if r(1) = '1' then
          NS <= grant2;
        elsif r(1) = '0' then
          NS <= idle;
        end if;

      when grant3 =>
        --g(2) <= '1';
				g <= "001";
				display <= "0000110";
        if r(2) = '1' then
          NS <= grant3;
        elsif r(2) = '0' then
          NS <= idle;
        end if;
      when others =>
				g <= "000";
				display <= "0000000";
        NS <= idle;
    end case;
  end process;
end architecture;