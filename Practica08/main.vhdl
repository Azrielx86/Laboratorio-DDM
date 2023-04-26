library ieee;
use ieee.std_logic_1164.all;

entity main is
  port (
    display : out std_logic_vector(6 downto 0);
    sel : in std_logic;
    rst : in std_logic;
    clk : std_logic
  );
end entity;

architecture behavioral of main is
  component flipflopjk is
    port (
      clk : in std_logic;
      reset : in std_logic;
      j : in std_logic;
      k : in std_logic;
      q : out std_logic;
      qn : out std_logic
    );
  end component;

  component DivisorFrecuencias is
    port (
      reloj : std_logic;
      div_clk : out std_logic
    );
  end component;

  component decoder is
    port (
      input : in std_logic_vector(3 downto 0);
      output : out std_logic_vector(6 downto 0)
    );
  end component;
  signal divfout : std_logic;
  signal qv : std_logic_vector(3 downto 0); -- q vector
  signal qnv : std_logic_vector(3 downto 0); -- qn vector
  signal disp_in : std_logic_vector(3 downto 0); -- display in vector
  --signal disp_out : std_logic_vector(6 downto 0); -- display vector

begin
  divfreq : DivisorFrecuencias port map(
    reloj => clk,
    div_clk => divfout
  );

  fflop1 : flipflopjk port map(
    clk => divfout,
    reset => rst,
    j => '1',
    k => '1',
    q => qv(0),
    qn => qnv(0)
  );

  fflop2 : flipflopjk port map(
    clk => qv(0),
    reset => rst,
    j => '1',
    k => '1',
    q => qv(1),
    qn => qnv(1)
  );

  fflop3 : flipflopjk port map(
    clk => qv(1),
    reset => rst,
    j => '1',
    k => '1',
    q => qv(2),
    qn => qnv(2)
  );

  fflop4 : flipflopjk port map(
    clk => qv(2),
    reset => rst,
    j => '1',
    k => '1',
    q => qv(3),
    qn => qnv(3)
  );

  disp : decoder port map(
    input => disp_in,
    output => display
  );

  process (sel)
  begin
    if (sel = '1') then
      disp_in <= qv;
    else
      disp_in <= qnv;
    end if;
  end process;
end architecture;