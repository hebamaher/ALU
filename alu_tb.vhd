library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_unsigned.all;
 entity tb_ALU IS
 END tb_ALU;

 architecture alu_tb of tb_ALU IS
 COMPONENT ALU
 PORT(
 A: in std_logic_vector(3 downto 0);
 B:in std_logic_vector(3 downto 0);
 Alu_sel:in std_logic_vector(3 downto 0);
 Y:out std_logic_vector(5 downto 0)

 );
 END COMPONENT;
 signal A : std_logic_vector(3 downto 0); --:= (others => '0');
 signal B : std_logic_vector(3 downto 0); --:= (others => '0');
 signal ALU_sel : std_logic_vector(3 downto 0); --:= (others => '0');
 signal Y : std_logic_vector(5 downto 0);

 BEGIN
 uut: ALU PORT MAP (
 A => A,
 B => B,
 ALU_sel => ALU_sel,
 Y => Y
 );
 process
 begin 
  A <= x"0"; 
  B <= x"0"; 
  ALU_Sel <= x"0";
 wait for 100 ns;

 -- to test every possible state of the inputs --

 for i in 0 to 15 loop -- Loops on every function


 for j in 0 to 15 loop --Loops on every value of A


 for k in 0 to 15 loop --Loops on every value of B - B <= B + x"1";

 wait for 100 ns;
 end loop;
  A<= A + x"1";  
 end loop;
 B<= B + x"1";
  ALU_Sel <= ALU_Sel + x"1";
 end loop;

 wait ;
 end process;
 END alu_tb ;

