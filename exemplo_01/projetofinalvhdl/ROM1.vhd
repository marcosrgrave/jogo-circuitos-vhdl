library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

    00 => "0001010100110010", --1532
    01 => "0000010000010010", --412
    02 => "0011000001000101", --3045
    03 => "0011001000000101", --3205
    04 => "0101010000100011", --5423
    05 => "0010010100110000", --2530
    06 => "0011010000010101", --3415
    07 => "0011010001010001", --3451
    08 => "0011001001000101", --3245
    09 => "0001000000100011", --1023
    10 => "0001010000000011", --1403
    11 => "0011010100000010", --3502
    12 => "0000001000110100", --234
    13 => "0101000000010010", --5012
    14 => "0011000101010000", --3150
    15 => "0001001000000100"); --1204
	 
	
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