library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;



entity soma_p is
port (A, B, C, D:  in std_logic;
      S:  out std_logic_vector(2 downto 0)
     );
end soma_p;

architecture mysoma_p of soma_p is
signal A_extended, B_extended, C_extended, D_extended: std_logic_vector(2 downto 0);
signal A_B, C_D: std_logic_vector(2 downto 0);
begin
    A_extended <= "00" & A;
    B_extended <= "00" & B;
    C_extended <= "00" & C;
    D_extended <= "00" & D;
    S <= A_extended + B_extended + C_extended + D_extended;
end mysoma_p;