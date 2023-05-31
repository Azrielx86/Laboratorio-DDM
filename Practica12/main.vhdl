library ieee;
use ieee.std_logic_1164.all;

entity main is
  port (
    clk : std_logic;
    reset : in std_logic;
    Direccion : in std_logic;
    Tiempo : in std_logic;
    SA, SB, SC : out std_logic;
    PuertaAbierta : out std_logic;
    PuertaCerrada : out std_logic;
    Paro : out std_logic;
    Avance : out std_logic;
    Este : out std_logic;
    Oeste : out std_logic
  );
end entity;

architecture fsml of main is
  type state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13);
  signal pr_state, nxt_state, idle : state;
  signal div_clk : std_logic;

  component DivisorFrecuencias is
    port (
      reloj : std_logic;
      div_clk : out std_logic
    );
  end component;
begin
  -- Registro de estado
  process (clk, reset)
  begin
    if reset = '0' then
      pr_state <= idle;
    elsif rising_edge(div_clk) then
      pr_state <= nxt_state;
    end if;
  end process;

  -- Bloque de condicionales
  process (pr_state, nxt_state, idle)
  begin
    case pr_state is
      when S0 =>
        PuertaAbierta <= '1';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '1';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S1;
        else
          nxt_state <= S0;
        end if;
      when S1 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '1';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        if Direccion = '1' then
          nxt_state <= S2;
        else
          nxt_state <= S8;
        end if;
      when S2 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '0';
        Este <= '1';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S3;
        else
          nxt_state <= S2;
        end if;
      when S3 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '1';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '1';
        SB <= '0';
        SC <= '0';
        nxt_state <= S4;
      when S4 =>
        PuertaAbierta <= '1';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '1';
        SB <= '0';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S5;
        else
          nxt_state <= S4;
        end if;
      when S5 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '1';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        nxt_state <= S6;
      when S6 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '1';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S7;
        else
          nxt_state <= S6;
        end if;
      when S7 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '1';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '1';
        SC <= '0';
        nxt_state <= S0;
      when S8 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '1';
        Avance <= '0';
        Este <= '0';
        Oeste <= '1';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S9;
        else
          nxt_state <= S8;
        end if;
      when S9 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '1';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '1';
        nxt_state <= S10;
      when S10 =>
        PuertaAbierta <= '1';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '1';
        if Tiempo = '1' then
          nxt_state <= S11;
        else
          nxt_state <= S10;
        end if;
      when S11 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '1';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        nxt_state <= S12;
      when S12 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '1';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        if Tiempo = '1' then
          nxt_state <= S13;
        else
          nxt_state <= S12;
        end if;
      when S13 =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '1';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '1';
        SC <= '0';
        nxt_state <= S0;
      when others =>
        PuertaAbierta <= '0';
        PuertaCerrada <= '0';
        Paro <= '0';
        Avance <= '0';
        Este <= '0';
        Oeste <= '0';
        SA <= '0';
        SB <= '0';
        SC <= '0';
        nxt_state <= idle;
    end case;
  end process;

  -- Divisor de frecuencias
  div_frec : DivisorFrecuencias port map(
    reloj => clk,
    div_clk => div_clk
  );
end architecture;