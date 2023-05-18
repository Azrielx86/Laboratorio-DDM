library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity main is
  port (
    clock : std_logic;
    Display1 : out std_logic_vector(6 downto 0);
    Display2 : out std_logic_vector(6 downto 0);
    Display3 : out std_logic_vector(6 downto 0);
    Display4 : out std_logic_vector(6 downto 0)
  );
end entity;

architecture behavioral of main is
  component DivisorFrecuencias is
    port (
      reloj : std_logic;
      div_clk : out std_logic
    );
  end component;

  component palabras is
    port (
      clock : std_logic;
      display : out std_logic_vector(6 downto 0)
    );
  end component;

  component transfer is
    port (
      clk : in std_logic;
      q : out std_logic_vector(6 downto 0);
      d : in std_logic_vector(6 downto 0)
    );
  end component;

  signal div : std_logic;
  signal Lds0 : std_logic_vector(6 downto 0);
  signal Lds1 : std_logic_vector(6 downto 0);
  signal Lds2 : std_logic_vector(6 downto 0);
  signal Lds3 : std_logic_vector(6 downto 0);
begin
  div_frec : DivisorFrecuencias port map(
    reloj => clock,
    div_clk => div
  );

  inst_palabras : palabras port map(
    clock => div,
    display => Lds0
  );

  inst_transfer : transfer port map(
    clk => div,
    d => Lds0,
    q => Lds1
  );

  inst_transfer2 : transfer port map(
    clk => div,
    d => Lds1,
    q => Lds2
  );

  inst_transfer3 : transfer port map(
    clk => div,
    d => Lds2,
    q => Lds3
  );

  inst_transfer4 : transfer port map(
    clk => div,
    d => Lds3,
    q => Display4
  );

  Display1 <= Lds1;
  Display2 <= Lds2;
  Display3 <= Lds3;

end architecture;