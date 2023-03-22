library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity unidad_logica is
	port(
		a, b : in std_logic_vector(1 downto 0);
		sel2 : in std_logic_vector(1 downto 0);
		result : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of unidad_logica is

signal logico : std_logic_vector(1 downto 0);

begin
		with sel2 select
			logico <= (a or b) when "00",
			(a and b) when "01",
			(a xor b) when "10",
			(not a) when "11",
			"00" when others;
		result <= "00" & logico;
end behavioral;