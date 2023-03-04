LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY tab_func IS
	PORT (x, y, z: IN std_logic;
			salida: out std_logic);
END tab_func;

ARCHITECTURE Behavioral OF tab_func IS
BEGIN
	salida <= (x AND (NOT y)) OR ((NOT x) AND z);
END Behavioral;