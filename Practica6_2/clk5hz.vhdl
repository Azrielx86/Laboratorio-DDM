library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk5hz is
	port(
		entrada : in  std_logic;
		reset   : in  std_logic;
		salida  : out std_logic
	);
end entity;

architecture behavioral of clk5hz is

signal temporal : std_logic;
signal contador : integer range 0 to 4999999 := 0;

begin
	divisor_frecuencia : process (reset, entrada)
		begin
			if (reset = '0') then
				temporal <= '0';
				contador <= 0;
			elsif rising_edge(entrada) then
				if(contador = 4999999) then
					temporal <= NOT(temporal);
					contador <= 0;
				else
					contador <= contador + 1;
				end if;
			end if;
		end process;
		
		salida <= temporal;
end architecture;