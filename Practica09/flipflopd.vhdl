library ieee;
use ieee.std_logic_1164.all;

entity flipflopd is 
	port(
		clk   : in  std_logic;
		reset : in  std_logic;
		q     : out std_logic;
		qn    : out std_logic;
		d     : in std_logic
	);
end entity;

architecture behavioral of flipflopd is
begin
	process(clk, d, reset)
	variable q_estado : std_logic;
	begin
		if (reset = '0') then
			q_estado := '0';
		elsif rising_edge(clk) then
			q_estado := d;
		end if;
		q <= q_estado;
		qn <= not q_estado;
	end process;
end behavioral;