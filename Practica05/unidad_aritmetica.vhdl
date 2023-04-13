library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity unidad_aritmetica is
	port(
		a, b : in std_logic_vector(1 downto 0);
		sel3 : in std_logic;
		result : out std_logic_vector(3 downto 0)
	);
end entity;

architecture behavioral of unidad_aritmetica is

signal sum_carry : std_logic_vector(2 downto 0) := "000";
signal result_mul : std_logic_vector(3 downto 0) := "0000";

begin
sum_carry <= ( '0' & a ) + ( '0' & b );
result_mul <= a * b;

process (sel3)
begin
	if (sel3 = '1') then
		result <= result_mul;
	else
		result <= '0' & sum_carry;
	end if;
end process;
end behavioral;