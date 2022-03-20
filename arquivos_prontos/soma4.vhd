library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity soma4 is
port (A: in std_logic_vector(3 downto 0);
      B: in std_logic_vector(3 downto 0);
      S: out std_logic_vector(4 downto 0)
     );
end soma4;

architecture mysoma4 of soma4 is
begin
    S <=  A + B;
end mysoma4;