library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_termometrico is port (

    data_in : in  std_logic_vector(3 downto 0);
    data_out    : out std_logic_vector(15 downto 0));
    
end decoder_termometrico;

architecture decoder_Arch of decoder_termometrico is
    signal cte_0: std_logic_vector(16 - to_integer(unsigned(data_in)) downto 0) := (others => '0');
    signal cte_1: std_logic_vector(to_integer(unsigned(data_in)) - 1 downto 0) := (others => '1');
begin
    data_out <= cte_0 & cte_1;
end architecture decoder_Arch;