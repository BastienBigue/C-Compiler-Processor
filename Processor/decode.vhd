library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
    Port ( ins_di : in  STD_LOGIC_VECTOR (31 downto 0);
           op : out  STD_LOGIC_VECTOR (7 downto 0);
           a : out  STD_LOGIC_VECTOR (15 downto 0);
           b : out  STD_LOGIC_VECTOR (15 downto 0);
           c : out  STD_LOGIC_VECTOR (15 downto 0));
end decode;

architecture Behavioral of decode is
begin
op <= 	ins_di(31 downto 24) ;  

a <=		ins_di(23 downto 8) when (ins_di(31 downto 24) = x"08") else --STORE
			ins_di(23 downto 8) when (ins_di(31 downto 24) = x"0E") else  --JMP
			ins_di(23 downto 8) when (ins_di(31 downto 24) = x"0F") else --JMPC
			x"00" & ins_di(23 downto 16) ; 

b <= 		ins_di(15 downto 0) when (ins_di(31 downto 24) = x"06") else  --AFC 
			ins_di(15 downto 0) when (ins_di(31 downto 24) = x"07") else 	-- LOAD
			x"00" & ins_di(7 downto 0) when (ins_di(31 downto 24) = x"08") else --STORE
			x"ffff" when (ins_di(31 downto 24) = x"0E") else  --JMP
			x"00" & ins_di(7 downto 0) when (ins_di(31 downto 24) = x"0F") else --JMPC
			x"ffff" when (ins_di(31 downto 24) = x"E0") else --JMPR
			x"00" & ins_di(15 downto 8);
			
			
c <= 		x"ffff" when (ins_di(31 downto 24) = x"05") else --COPIE
			x"ffff" when (ins_di(31 downto 24) = x"06") else --AFC 
			x"ffff" when (ins_di(31 downto 24) = x"07") else -- LOAD
			x"ffff" when (ins_di(31 downto 24) = x"08") else --STORE
			x"ffff" when (ins_di(31 downto 24) = x"0E") else --JMP
			x"ffff" when (ins_di(31 downto 24) = x"70") else --LDR
			x"ffff" when (ins_di(31 downto 24) = x"80") else --STRR
			x"ffff" when (ins_di(31 downto 24) = x"E0") else --JMPR
			x"00" & ins_di(7 downto 0) ; 
			

end Behavioral;

