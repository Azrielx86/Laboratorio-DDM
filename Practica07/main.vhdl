library ieee;
use ieee.std_logic_1164.all;

entity main is 
	port(
		reset   : in  std_logic; --ffd
		q       : out std_logic;
		qn      : out std_logic;
		d       : in std_logic;
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

begin

	dvf : DivisorFrecuencias port map(
		reloj => reloj,
		div_clk => div_clk
	);
	
	ffd : flipflopd port map(
		clk => div_clk,
		reset => reset,
		q   => q,
		qn  => qn,
		d   => d
	);

end architecture;