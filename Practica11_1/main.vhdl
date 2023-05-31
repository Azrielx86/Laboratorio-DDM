library ieee;
use ieee.std_logic_1164.all;

entity main is
  port (
    reloj : std_logic;
    reset : in std_logic;
    rap : in std_logic;
    pause : in std_logic;
    display1 : out std_logic_vector(6 downto 0);
    display2 : out std_logic_vector(6 downto 0);
    display3 : out std_logic_vector(6 downto 0);
    display4 : out std_logic_vector(6 downto 0)
  );
end entity;

architecture behavioral of main is
  signal clk : std_logic;
  signal sig1 : std_logic;
  signal sig2 : std_logic;
  signal sig3 : std_logic;
  signal sig4 : std_logic;
  signal dec1 : std_logic_vector(3 downto 0);
  signal dec2 : std_logic_vector(3 downto 0);
  signal dec3 : std_logic_vector(3 downto 0);
  signal dec4 : std_logic_vector(3 downto 0);
begin

  inst_div : entity work.DivisorFrecuencias (behavioral) port map(
    reloj => reloj,
    div_clk => clk,
    fast => rap,
    pause => pause
    );

  inst_unidades : entity work.conteo (Behavioral) port map(
    rst => reset,
    M => clk,
    flnc => sig1,
    MD => dec1
    );

  dec_d1 : entity work.decoder (behavioral) port map(
    input => dec1,
    output => display1
    );

  inst_decenas : entity work.conteo (Behavioral) generic map(5) port map(
    rst => reset,
    M => sig1,
    flnc => sig2,
    MD => dec2
    );

  dec_d2 : entity work.decoder (behavioral) port map(
    input => dec2,
    output => display2
    );

  inst_minutos : entity work.conteo (Behavioral) port map(
    rst => reset,
    M => sig2,
    flnc => sig3,
    MD => dec3
    );

  dec_d3 : entity work.decoder (behavioral) port map(
    input => dec3,
    output => display3
    );

  inst_decemin : entity work.conteo (Behavioral) generic map(3) port map(
    rst => reset,
    M => sig3,
    flnc => sig4,
    MD => dec4
    );

  dec_d4 : entity work.decoder (behavioral) port map(
    input => dec4,
    output => display4
    );
end architecture;