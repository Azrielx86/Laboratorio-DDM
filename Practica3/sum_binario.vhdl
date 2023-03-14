library IEEE;
use IEEE.std_logic_1164.all;

entity sum_binario is
	port(
		Asb : in std_logic_vector(2 downto 0);
		Bsb : in std_logic_vector(2 downto 0);
		Ssb : out std_logic_vector(3 downto 0)
	);
end entity;

architecture Behavioral of sum_binario is
component full_add
	port(
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic;
		Co : out std_logic;
		S : out std_logic
	);
end component;

component half_add
	port(
		A : in std_logic;
		B : in std_logic;
		C : out std_logic;
		S : out std_logic
	);
end component;

-- signal aux : std_logic_vector(3 downto 0);
signal aux_1, aux_2 : std_logic;

begin

	half_adder : half_add port map(
		A => Asb(0),
		B => Bsb(1),
		C => aux_1, -- signal
		S => Ssb(0) -- salida de half_add
	);
	
	full_adder_a : full_add port map(
		A => Asb(1),
		B => Bsb(1),
		Cin => aux_1,
		Co => aux_2,
		S => Ssb(1)
	);
	
	full_adder_b : full_add port map(
		A => Asb(2),
		B => Bsb(2),
		Cin => aux_2,
		Co => Ssb(2),
		S => Ssb(3)
	);

end Behavioral;
