library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity half_add is
	port(
		A : in std_logic;
		B : in std_logic;
		C : out std_logic;
		S : out std_logic
	);
end entity;

architecture Behavioral of half_add is
begin
	C <= A and B;
	S <= A xor B;
end Behavioral;
