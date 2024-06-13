library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity ALU is
generic (
constant N: natural := 1 --N = 1
);
port(
A,B,Alu_sel: in std_logic_vector(3 downto 0); -- Defining out inputs and MUX selector
Y: out std_logic_vector (5 downto 0) -- Defining our output
);
end ALU;
Architecture ALUarch of ALU is
signal alu_result: std_logic_vector(5 downto 0);
begin
process(A,B,Alu_sel)
begin
case(Alu_sel)is
--- Arithmetic unit ---
when "0000"=> alu_result <= '0' & '0'& A+N; --Increment A

when "0001"=> alu_result <= '0' & '0'& A-N; --Decrement A

when "0010"=> alu_result <= '0' & '0'& A+A; --Multiply A by 2

when "0011"=> alu_result <= '0' & '0'& B+N; --Increment B

when "0100"=> alu_result <= '0' & '0'& B-N; --Decrement B

when "0101"=> alu_result <= '0' & '0'& B+B; --Multiply B by 2

when "0110"=> alu_result <= '0' & '0'& A+B; --Add A and B

when "0111"=> alu_result <= A &'0' & '0' ; --Multiply A by 4


--- Logical unit ---
when "1000"=>  alu_result  <= '0' & '0'& Not A ; --Complement of A 
 
when "1001"=> alu_result  <= '0' & '0'& Not B; --Complement of B 

when "1010"=> alu_result  <= '0' & '0'& (A and B); -- A AND B 

when "1011"=> alu_result  <= '0' & '0'& (A or B); -- A OR B 
 
when "1100"=> alu_result  <= '0' & '0'& (A xor B); --A XOR B 
 
when "1101"=> alu_result  <= '0' & '0'& (A xnor B); --A XNOR B 
 
when "1110"=> alu_result  <= '0' & '0'& (A nand B); --A NAND B 
 
when "1111"=> alu_result  <= '0' & '0'&(A nor B); --A NOR B 

when others => alu_result  <='0' & '0'& A; 

end case;
end process;
Y  <=  alu_result;
end ALUarch;

 


