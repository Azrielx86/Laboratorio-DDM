library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity compara_2bit is
	port(
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		max : out std_logic;
		min : out std_logic;
		equ : out std_logic
	);
end entity;

architecture Behavioral of compara_2bit is
begin
	process(A,B)
	begin
		if (A > B) then
			max <= '1';
			min <= '0';
			equ <= '0';
		elsif (A < B) then
			max <= '0';
			min <= '1';
			equ <= '0';
		else
			max <= '0';
			min <= '0';
			equ <= '1';
		end if;
	end process;
end Behavioral;