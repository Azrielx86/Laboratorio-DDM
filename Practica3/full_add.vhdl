library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_add is
	port(
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		Co : out std_logic;
		S : out std_logic
	);
end entity;

architecture Behavioral of full_add is
begin
	Co <= (A and B) or (Cin and (A or B));
	S <= (A xor B) xor Cin;
end Behavioral;