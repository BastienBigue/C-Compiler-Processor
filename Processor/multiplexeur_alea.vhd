library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur_alea is
Port (alea_in : IN STD_LOGIC;
		en_out : OUT STD_LOGIC;
		alea_out : out STD_LOGIC);

end multiplexeur_alea;

architecture Behavioral of multiplexeur_alea is
signal s : STD_LOGIC;
begin
	s <= alea_in;
	en_out <= s ; 
	alea_out <= s;

end Behavioral;

