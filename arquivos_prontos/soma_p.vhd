library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity soma_p is
port (A: in std_logic_vector(3 downto 0);
      B: in std_logic_vector(3 downto 0);
      C: in std_logic_vector(3 downto 0);
      D: in std_logic_vector(3 downto 0);
      P: out std_logic_vector(4 downto 0)
     );
end soma_p;

architecture mysoma_p of soma_p is
begin
    P <=  A + B + C + D;
end mysoma_p;