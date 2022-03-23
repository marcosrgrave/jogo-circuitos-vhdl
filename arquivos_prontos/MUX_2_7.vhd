library IEEE;
use IEEE.Std_Logic_1164.all;

entity MUX_2_7 is
port (
    A:  in std_logic_vector(6 downto 0);
    B:  in std_logic_vector(6 downto 0);
    E: in std_logic;
    out_7seg:  out std_logic_vector(6 downto 0)
);
end MUX_2_7;

architecture arc_MUX_2_7 of MUX_2_7 is
begin 
  out_7seg <=  A when E = '0' else B;
end arc_MUX_2_7;
