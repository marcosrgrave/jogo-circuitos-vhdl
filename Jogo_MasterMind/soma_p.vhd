library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity soma_p is
port (A: in std_logic;
      B: in std_logic;
      C: in std_logic;
      D: in std_logic;
      P: out std_logic_vector(2 downto 0)
     );
end soma_p;

architecture arc_soma_p of soma_p is
signal AA, BB, CC, DD: std_logic_vector(2 downto 0);
begin
    AA <= "00" & A;
    BB <= "00" & B;
    CC <= "00" & C;
    DD <= "00" & D;
    
    P <=  AA + BB + CC + DD;
end arc_soma_p;