library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM2;

architecture Rom_Arch of ROM2 is
  
type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

    00 => "0111011001000101", --7645
    01 => "0011010100010000", --3510
    02 => "0111011000010010", --7612
    03 => "0100000000010010", --4012
    04 => "0100001000110111", --4237
    05 => "0110000100100011", --6123
    06 => "0000000101010100", --154
    07 => "0000001001000110", --246
    08 => "0001010101000111", --1547
    09 => "0000010001110110", --476
    10 => "0011011001110100", --3674
    11 => "0111000100100110", --7126
    12 => "0110001100000100", --6304
    13 => "0010001101100000", --2360
    14 => "0001011100000110", --1706
    15 => "0110000000010100"); --6014
	
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	   when "1010" => data <= my_rom(10);
	   when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	   when "1101" => data <= my_rom(13);
	   when "1110" => data <= my_rom(14);
	   when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;