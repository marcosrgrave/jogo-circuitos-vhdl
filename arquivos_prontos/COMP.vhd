library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity COMP is
port (
    CODE: in std_logic_vector(3 downto 0);
    USER: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(3 downto 0)
);
end COMP;

architecture arc_COMP of COMP is
begin
    S <= "0001" when (CODE = USER) else "0000";
end arc_COMP;