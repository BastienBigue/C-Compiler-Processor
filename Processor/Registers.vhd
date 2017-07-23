library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Registers is
    Port ( addrA : in  STD_LOGIC_VECTOR (15 downto 0);
           addrB : in  STD_LOGIC_VECTOR (15 downto 0);
           addrW : in  STD_LOGIC_VECTOR (15 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (15 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (15 downto 0);
           QB : out  STD_LOGIC_VECTOR (15 downto 0));
end Registers;

architecture Behavioral of Registers is

type registers_type is array (integer range 31 downto 0) of std_logic_vector (15 downto 0) ; 	
signal reg : registers_type := (others => x"0000") ; 
signal si : integer ; 

begin
process(clk, rst) 
	begin
	if falling_edge(clk) then 
		if (rst = '0') then 
			reg <= (others => x"0000") ; 
			QA <=  x"0000" ; 
			QB <=  x"0000" ; 
		else 
			QA <= reg(to_integer(unsigned(addrA(4 downto 0)))) ; 
			QB <= reg(to_integer(unsigned(addrB(4 downto 0)))) ;
			if (W = '1') then  
				reg(to_integer(unsigned(addrW(4 downto 0)))) <= DATA ; 
				if (addrW(4 downto 0) = addrA(4 downto 0)) then 
					QA <= DATA ; 
				elsif (addrW(4 downto 0) = addrB(4 downto 0)) then 
					QB <= DATA ; 
				end if ; 
			end if ; 		
		end if ; 
	end if ; 
	end process; 

--	--reg <= (others => x"0000") when (rst = '0') ; 
--	si <= to_integer(unsigned(addrW(4 downto 0))) ; 
--	reg(si) <= DATA when ((rst = '1') and (W ='1')) ; 
--
----	QA <= reg(to_integer(unsigned(addrA(4 downto 0)))) when (rst = '1') ; 
----	QB <= reg(to_integer(unsigned(addrB(4 downto 0)))) when (rst = '1') ;	
--
--	QA <= x"0000" when (rst = '0') else
--			DATA when ((rst = '1') and (W = '1') and (addrW(4 downto 0) = addrA(4 downto 0))) else 
--			reg(to_integer(unsigned(addrA(4 downto 0)))) when (rst = '1'); 
--	QB <= x"0000" when (rst = '0') else
--			DATA when ((rst = '1') and (W = '1') and (addrW(4 downto 0) = addrB(4 downto 0))) else 
--			reg(to_integer(unsigned(addrB(4 downto 0)))) when (rst = '1') ; 		
--	

end Behavioral;

