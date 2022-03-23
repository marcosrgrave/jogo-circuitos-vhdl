library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity comp_4bits is port(

    inc, inu: in std_logic_vector(3 downto 0);
    E       : out std_logic
    );
    
end comp_4bits;

architecture arc_comp of comp_4bits is
begin

    E <= '1' when inc = inu else '0';

end arc_comp;