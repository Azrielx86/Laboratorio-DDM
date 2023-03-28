library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplexor is
	port(
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		sel1: in std_logic;
		sel2: in std_logic_vector(1 downto 0);
		sel3: in std_logic;
		output : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of multiplexor is
component unidad_logica
	port(
		a, b : in std_logic_vector(1 downto 0);
		sel2 : in std_logic_vector(1 downto 0);
		result : out std_logic_vector(3 downto 0)
	);
end component;

component unidad_aritmetica
		port(
		a, b : in std_logic_vector(1 downto 0);
		sel3 : in std_logic;
		result : out std_logic_vector(3 downto 0)
	);
end component;

signal logic_s, arith_s : std_logic_vector(3 downto 0);
	
begin
	uniarith : unidad_aritmetica port map(
		a => A,
		b => B,
		sel3 => sel3,
		result => arith_s
	); 
	
	unilogic : unidad_logica port map(
		a => A,
		b => B,
		sel2 => sel2,
		result => logic_s
	);
	
process (sel1)
begin
	if (sel1 = '1') then
		output <= arith_s;
	else
		output <= logic_s;
	end if;
end process;
end architecture;