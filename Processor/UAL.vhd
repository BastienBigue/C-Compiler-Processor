library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end UAL;

architecture Behavioral of UAL is
	signal inter : STD_LOGIC_VECTOR(31 downto 0) ; 
	signal inter2 : STD_LOGIC_VECTOR(31 downto 0) ; 
	signal interZ : STD_LOGIC ; 
	signal interN : STD_LOGIC ; 
begin

	--OPERATION
		with Ctrl_Alu select 
			inter2 <= 	inter when "00000001",
							inter when "00000011",
							inter when x"80", --STRR
							x"0000000" & "000" & interZ when "00001001" , --EQU
							x"0000000" & "000" & interN when "00001010", --INF
							x"0000000" & "000" & (interZ or interN) when "00001011", --INFE 
							x"0000000" & "000" & interN when "00001100", --SUP
							x"0000000" & "000" & (interZ or interN) when "00001101",  --SUPE
							x"ffffffff" when others ; 
	
		with Ctrl_Alu select		
			inter <= (x"0000" & A) + (x"0000" & B) when "00000001", --ADD
						 A *B  when "00000010",
						(x"0000" & A) - (x"0000" & B)  when "00000011",
						(x"0000" & A) - (x"0000" & B) when "00001001", --EQU
						(x"0000" & A) - (x"0000" & B) when "00001010", --INF
						(x"0000" & A) - (x"0000" & B) when "00001011", --INFE 
						(x"0000" & B) - (x"0000" & A) when "00001100", --SUP
						(x"0000" & B) - (x"0000" & A) when "00001101", --SUPE
						(x"0000" & B) when x"80", --STRR
						x"ffffffff" when others;
		
	-- FLAGS 
		N <= interN ; 
		interN <= '1' when inter(15) = '1' else '0' ; 
		C <= '1' when inter(17) = '1' else '0' ; 
		Z <= interZ ; 
		interZ <= '1' when inter(31 downto 0) = "0000000000000000" else '0' ; 
		
		
		with Ctrl_Alu select 
			O <= 	(A(15) and B(15) and not(inter(15))) or (not(A(15)) and not(B(15)) and inter(15)) when "00000001",
					(A(15) and not(B(15)) and not(inter(15))) or (not(A(15)) and B(15) and inter(15)) when "00000011",
					(inter(31) or inter(30) or inter(29) or inter(28) or inter(27) or inter(26) or inter(25) or inter(24) or inter(23) or inter(22) or inter(21) or inter(20) or inter(19) or inter(18) or inter(17) or inter(16)) when "00000010", 
			'0' when others;
			
		S <= inter2(15 downto 0) ; 
	
end Behavioral;

