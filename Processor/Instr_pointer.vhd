library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; --integer et stdlogicvector
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- stdlogicvector et lui meme 

entity Instr_pointer is
    Port ( Din : in  STD_LOGIC_VECTOR (15 downto 0);
           Dout : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           sens : in  STD_LOGIC;
           load : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end Instr_pointer;

architecture Behavioral of Instr_pointer is
signal cmpti: std_logic_vector(15 downto 0) ; 
begin
	count : process(clk) is 
	begin
		if rising_edge(clk) then 
			if (rst = '0') then 
				cmpti <= x"0000" ; 
			else --reset inactif
				if (load ='1') then 
					cmpti <= Din ; 
				else
					if (en = '0') then 
						if (sens = '1') then 
							cmpti <= cmpti+4; 
						else 
							cmpti <= cmpti-4; 
						end if ;
					end if ; 
				end if ;				
			end if ; 
		end if ; 
	end process ; 

Dout <= cmpti when (en = '0') else 
			cmpti-4;				


end Behavioral;
