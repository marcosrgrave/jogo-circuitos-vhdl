library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity COMP_4 is
port (
    P: in std_logic_vector(2 downto 0);
    S: out std_logic
);
end COMP_4;

architecture arc_COMP_4 of COMP_4 is
begin
    S <= '1' when (P = "100") else '0';
end arc_COMP_4;