library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur_ual is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur_ual;

architecture Behavioral of multiplexeur_ual is

begin

s <=		b when (op = x"01") or (op = x"02") or (op = x"03") or (op = x"09") or (op = x"0A") or (op = x"0B") or (op = x"0C") or (op = x"0D") or (op= x"80") else 
			a ; 


end Behavioral;

