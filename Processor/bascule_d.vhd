
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascule_d is
    Port ( 	clk : in STD_LOGIC ;
				a : in  STD_LOGIC_VECTOR (15 downto 0);
				s : out  STD_LOGIC_VECTOR (15 downto 0));
end bascule_d;

architecture Behavioral of bascule_d is

begin

process(clk)
	begin 
	
	if rising_edge(clk) then 
		s <= a ; 
	end if ; 
	end process ; 


end Behavioral;

