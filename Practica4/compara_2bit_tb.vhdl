library ieee;
use ieee.std_logic_1164.all;

entity compara_2bit_tb is
end entity;

architecture testbench of compara_2bit_tb is
component compara_2bit is
	port (
		A : in std_logic_vector(1 downto 0);
		B : in std_logic_vector(1 downto 0);
		max : out std_logic;
		min : out std_logic;
		equ : out std_logic
	);
end component;

signal A_tb : std_logic_vector(1 downto 0);
signal B_tb : std_logic_vector(1 downto 0);
signal max_tb : std_logic;
signal min_tb : std_logic;
signal equ_tb : std_logic;	

begin
Instance : compara_2bit
	port map(
		A => A_tb,
		B => B_tb,
		max => max_tb,
		min => min_tb,
		equ => equ_tb
	);
	
Always : process
	begin
		wait for 50ns;
		A_tb <= "01";
		B_tb <= "00";
		wait for 50ns;
		A_tb <= "01";
		B_tb <= "10";
		wait for 50ns;
		A_tb <= "01";
		B_tb <= "01";
		wait for 50ns;
		A_tb <= "10";
		B_tb <= "10";
		wait;
end process;
end testbench;