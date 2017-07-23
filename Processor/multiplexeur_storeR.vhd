
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur_storeR is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur_storeR;

architecture Behavioral of multiplexeur_storeR is

begin

s <=		b when (op = x"80") 
			else 	a ; 


end Behavioral;

