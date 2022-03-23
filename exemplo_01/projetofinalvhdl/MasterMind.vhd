library ieee;
use ieee.std_Logic_1164.all;

entity MasterMind is port( 
    
    SW                     : in  std_logic_vector(15 downto 0);
    Clock1, Clock500       : in  std_logic;
    KEY1, KEY0             : in  std_logic;
    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);
    LEDR                   : out std_logic_vector(15 downto 0));
    
end MasterMind;


architecture arc_master of MasterMind is
    component datapath is port(

        Switches                     : in  std_logic_vector(15 downto 0);
        Clock1, Clock500             : in  std_logic;
        R1, R2                       : in  std_logic;
        E1, E2, E3, E4, E5           : in  std_logic;
        ledr                         : out std_logic_vector(15 downto 0);
        hex0, hex1, hex2, hex3       : out std_logic_vector(6 downto 0);
        hex4, hex5, hex6, hex7       : out std_logic_vector(6 downto 0);
        end_game, end_time, end_round: out std_logic);
    
    end component;

    component ButtonSync is port(

        KEY0, KEY1, CLK: in  std_logic;
        Enter, Reset   : out std_logic);

    end component;

    component  controle is port(
                -- control in
                end_game, end_time, end_round, enter, reset, clk : in std_logic;

                -- control out
                R1, R2, E1, E2, E3, E4, E5: out std_logic);

    end component;
    
signal R1, R2, E1, E2, E3, E4, E5, btnSync_enter, btnSync_reset, end_game, end_time, end_round: std_logic;
begin

    datapath_0: component datapath 
     port map (
        SW, Clock1, Clock500, R1, R2, E1, E2, E3, E4, E5, 
        LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, end_game, end_time, end_round);
    
    btnSync: component ButtonSync
     port map (KEY0, KEY1, Clock500, btnSync_enter, btnSync_reset);

    control: component controle
     port map (end_game, end_time, end_round, btnSync_enter, btnSync_reset, Clock500, R1, R2, E1, E2, E3, E4, E5);

    
end arc_master;
