library IEEE;
use IEEE.Std_Logic_1164.all;

entity DECODER_TERMOMETRICO is
port (X:  in std_logic_vector(3 downto 0);
      S:  out std_logic_vector(15 downto 0)
     );
end DECODER_TERMOMETRICO;

architecture arc_DECODER_TERMOMETRICO of DECODER_TERMOMETRICO is
begin 
  S <= "0000000000000000" when X = "0000" else
       "1000000000000000" when X = "0001" else
       "1100000000000000" when X = "0010" else
       "1110000000000000" when X = "0011" else
       "1111000000000000" when X = "0100" else
       "1111100000000000" when X = "0101" else
       "1111110000000000" when X = "0110" else
       "1111111000000000" when X = "0111" else
       "1111111100000000" when X = "1000" else
       "1111111110000000" when X = "1001" else
       "1111111111000000" when X = "1010" else
       "1111111111100000" when X = "1011" else
       "1111111111110000" when X = "1100" else
       "1111111111111000" when X = "1101" else
       "1111111111111100" when X = "1110" else
       "1111111111111110" when X = "1111" else
       "1111111111111111";
end arc_DECODER_TERMOMETRICO;
