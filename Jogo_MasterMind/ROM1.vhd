library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0100000100100011",  --4123   ROM0 esta totalmente preenchida como exemplo. 
	01 => "0100000100110010",  --4132   Eh necessario preencher a ROM1, ROM2 e ROM3 com sequencias de sua escolha.
    02 => "0100001000010011",  --4213
	03 => "0100001000110001",  --4231
	04 => "0100001100010010",  --4312
	05 => "0100001100100001",  --4321
	06 => "0001010000100011",  --1423
	07 => "0001010000110010",  --1432
	08 => "0001001001000011",  --1243
	09 => "0001001000110100",  --1234
    10 => "0001001101000010",  --1342
	11 => "0001001100100100",  --1324
	12 => "0010010000010011",  --2413
	13 => "0010010000110001",  --2431
	14 => "0010000101000011",  --2143
	15 => "0010000100110100"); --2134
	 
	
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