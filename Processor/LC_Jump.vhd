library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LC_Jump is
    Port ( op : in  STD_LOGIC_VECTOR (7 downto 0);
           load : out  STD_LOGIC);
end LC_Jump;

architecture Behavioral of LC_Jump is

begin

	load <= '1' when (op = x"0E") or (op = x"E0") else
	'0' ; 


end Behavioral;

