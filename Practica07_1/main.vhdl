library ieee;
use ieee.std_logic_1164.all;

entity main is 
	port(
		d : out std_logic_vector(2 downto 0);
		reset   : in  std_logic; --ffd
		reloj   : std_logic      -- div
	);
end entity;

architecture behavioral of main is
component flipflopd is 
	port(
		clk   : in  std_logic;
		reset : in  std_logic;
		q     : out std_logic;
		qn    : out std_logic;
		d     : in std_logic
	);
end component;


component DivisorFrecuencias is
	port(
		reloj : std_logic;
		div_clk : out std_logic
	);
end component;

signal div_clk : std_logic;
signal s1 : std_logic;
signal s2 : std_logic;
signal s3 : std_logic;

begin

	dvf : DivisorFrecuencias port map(
		reloj => reloj,
		div_clk => div_clk
	);
	
	ffd_1 : flipflopd port map(
		clk => div_clk,
		reset => reset,
		q   => d(0),
		qn  => s1,
		d   => s1
	);

	ffd_2 : flipflopd port map(
		clk => s1,
		reset => reset,
		q   => d(1),
		qn  => s2,
		d   => s2
	);
	
	ffd_3 : flipflopd port map(
		clk => s2,
		reset => reset,
		q   => d(2),
		qn  => s3,
		d   => s3
	);
	
end architecture;
