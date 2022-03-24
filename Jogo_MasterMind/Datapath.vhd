library ieee;
use ieee.std_Logic_1164.all;

entity datapath is port( 
    
    Switches                     : in  std_logic_vector(15 downto 0);
    Clock1, Clock500             : in  std_logic;
    R1, R2                       : in  std_logic;
    E1, E2, E3, E4, E5           : in  std_logic;
    ledr                         : out std_logic_vector(15 downto 0);
    hex0, hex1, hex2, hex3       : out std_logic_vector(6 downto 0);
    hex4, hex5, hex6, hex7       : out std_logic_vector(6 downto 0);
    end_game, end_time, end_round: out std_logic);
    
end datapath;


architecture arc_data of datapath is

-- signal dados pelo professor
signal code, user, s_dec_term, rom0_s, rom1_s, rom2_s, rom3_s: std_logic_vector(15 downto 0); 
signal result: std_logic_vector(7 downto 0);
signal h0_00, h0_01, h0_10, h0_11, h1_01, h1_11, h2_00, h2_01, h2_10, h2_11, h3_01, h3_11, h4_1, h6_1, h7_1: std_logic_vector(6 downto 0);
signal sel: std_logic_vector(5 downto 0);
signal timee, X, s_soma, F: std_Logic_vector(3 downto 0);
signal P, P_reg, E, E_reg: std_logic_vector(2 downto 0);
signal sel_mux: std_logic_vector(1 downto 0);
signal end_gamee, end_timee, cmp0_s, cmp1_s, cmp2_s, cmp3_s: std_logic;

-- signals dos alunos
signal dec_h2_10, dec_h0_00, dec_h0_10: std_Logic_vector(3 downto 0);
signal const_t: std_logic_vector(6 downto 0) := "0000111";
signal const_C: std_logic_vector(6 downto 0) := "1000110";
signal const_P: std_logic_vector(6 downto 0) := "0001100";
signal const_L: std_logic_vector(6 downto 0) := "1000111";
signal const_E: std_logic_vector(6 downto 0) := "0000110";
signal end_time_4bit: std_Logic_vector(3 downto 0);
signal E1_16bit: std_Logic_vector(15 downto 0);

    -- Importando components
    component COMP is 
        port (
            CODE: in std_logic_vector(3 downto 0);
            USER: in std_logic_vector(3 downto 0);
            S: out std_logic
        );
    end component;
    
    component COMP_4 is 
        port (
            P: in std_logic_vector(2 downto 0);
            S: out std_logic
        );
    end component;
    
    component comp_e is 
        port (
            inc, inu: in  std_logic_vector(15 downto 0);
            E: out std_logic_vector(2 downto 0)
        );
    end component;
    
    component counter_round is 
        port (
            CLK: in std_logic;
            R: in std_logic;
            E: in std_logic;
            S: out std_logic_vector(3 downto 0);
            end_round: out std_logic
        );
    end component;
    
    component counter_time is 
        port (
            CLK: in std_logic;
            R: in std_logic;
            E: in std_logic;
            S: out std_logic_vector(3 downto 0);
            end_time: out std_logic
        );
    end component;
    
    component dec7seg is 
        port (
            bcd_in:  in std_logic_vector(3 downto 0);
            out_7seg:  out std_logic_vector(6 downto 0)
        );
    end component;
    
    component DECODER_TERMOMETRICO is 
        port (
            X:  in std_logic_vector(3 downto 0);
            S:  out std_logic_vector(15 downto 0)
        );
    end component;
    
    component MUX_2_7 is 
        port (
            A:  in std_logic_vector(6 downto 0);
            B:  in std_logic_vector(6 downto 0);
            E: in std_logic;
            out_7seg:  out std_logic_vector(6 downto 0)
        );
    end component;
    
    component MUX_4_7 is 
        port (
            A:  in std_logic_vector(6 downto 0);
            B:  in std_logic_vector(6 downto 0);
            C:  in std_logic_vector(6 downto 0);
            D:  in std_logic_vector(6 downto 0);
            E:  in std_logic_vector(1 downto 0);
            out_7seg:  out std_logic_vector(6 downto 0)
        );
    end component;
    
    component MUX_4_16 is 
        port (
            A:  in std_logic_vector(15 downto 0);
            B:  in std_logic_vector(15 downto 0);
            C:  in std_logic_vector(15 downto 0);
            D:  in std_logic_vector(15 downto 0);
            E:  in std_logic_vector(1 downto 0);
            CODE:  out std_logic_vector(15 downto 0)
        );
    end component;
    
    component REG_3bit is 
        port (
            CLK: in std_logic;
        	R: in std_logic;
        	E: in std_logic;
        	D: in std_logic_vector(2 downto 0);
        	Q: out std_logic_vector(2 downto 0)
        );
    end component;
    
    component REG_6bit is 
        port (
            CLK: in std_logic;
        	R: in std_logic;
        	E: in std_logic;
        	D: in std_logic_vector(5 downto 0);
        	Q: out std_logic_vector(5 downto 0)
        );
    end component;
    
    component REG_16bit is 
        port (
            CLK: in std_logic;
        	R: in std_logic;
        	E: in std_logic;
        	D: in std_logic_vector(15 downto 0);
        	Q: out std_logic_vector(15 downto 0)
        );
    end component;
    
    component ROM0 is 
        port (
            address : in  std_logic_vector(3 downto 0);
            data : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component ROM1 is 
        port (
            address : in  std_logic_vector(3 downto 0);
            data : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component ROM2 is 
        port (
            address : in  std_logic_vector(3 downto 0);
            data : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component ROM3 is 
        port (
            address : in  std_logic_vector(3 downto 0);
            data : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component selector is 
        port (
            in0, in1, in2, in3: in  std_logic;
            saida: out std_logic_vector(1 downto 0)
        );
    end component;
    
    component soma_p is 
        port (
            A: in std_logic;
            B: in std_logic;
            C: in std_logic;
            D: in std_logic;
            P: out std_logic_vector(2 downto 0)
        );
    end component;
    
    component soma4 is 
        port (
            A: in  std_logic_vector(3 downto 0);
            B: in  std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0)
        );
    end component;

begin

    end_game <= end_gamee; --ao interligar a saida do comp=4, usar o signal end_gamee para evitar erros
    end_time <= end_timee; --ao interligar a saida do counter_time, usar o signal end_timee para evitar erros

    -- COMP
    COMP_0: component COMP 
     port map (code(3 downto 0), user(3 downto 0), cmp0_s);
    
    COMP_1: component COMP 
     port map (code(7 downto 4), user(7 downto 4), cmp1_s);
    
    COMP_2: component COMP 
     port map (code(11 downto 8), user(11 downto 8), cmp2_s);
    
    COMP_3: component COMP 
     port map (code(15 downto 12), user(15 downto 12), cmp3_s);
    
    -- COMP_4
    COMP4: component COMP_4 
     port map (P, end_gamee);
    
    -- comp_e
    COMPe: component comp_e 
     port map (code, user, E);
    
    -- counter_round
    COUNTERround: component counter_round 
     port map (Clock500, R2, E3, X, end_round);
    
    -- counter_time
    COUNTERtime: component counter_time 
     port map (Clock1, R1, E2, timee, end_timee);
    
    -- dec7seg
    dec7seg7_1: component dec7seg
     port map (result(7 downto 4), h7_1);
    
    dec7seg6_1: component dec7seg
     port map (result(3 downto 0), h6_1);
    
    dec7seg4_1: component dec7seg
     port map (timee, h4_1);
    
    dec7seg3_01: component dec7seg
     port map (user(15 downto 12), h3_01);
    
    dec7seg3_11: component dec7seg
     port map (code(15 downto 12), h3_11);
    
    dec7seg2_00: component dec7seg
     port map (sel(5 downto 2), h2_00);
    
    dec7seg2_01: component dec7seg
     port map (user(11 downto 8), h2_01);
    
    dec_h2_10 <= '0' & P_reg;
    dec7seg2_10: component dec7seg
     port map (dec_h2_10, h2_10);
    
    dec7seg2_11: component dec7seg
     port map (code(11 downto 8), h2_11);
    
    dec7seg1_01: component dec7seg
     port map (user(7 downto 4), h1_01);
    
    dec7seg1_11: component dec7seg
     port map (code(7 downto 4), h1_11);
    
    dec_h0_00 <= "00" & sel(1 downto 0);
    dec7seg0_00: component dec7seg
     port map (dec_h0_00, h0_00);
    
    dec7seg0_01: component dec7seg
     port map (user(3 downto 0), h0_01);
    
    dec_h0_10 <= '0' & E_reg(2 downto 0);
    dec7seg0_10: component dec7seg
     port map (dec_h0_10, h0_10);
     
    dec7seg0_11: component dec7seg
     port map (code(3 downto 0), h0_11);
    
    -- DECODER_TERMOMETRICO
    decoder: component DECODER_TERMOMETRICO
     port map (X, s_dec_term);
    
    -- MUX_2_7
    mux_h7: component MUX_2_7 
     port map ("1111111", h7_1, E5, hex7);
            
    mux_h6: component MUX_2_7 
     port map ("1111111", h6_1, E5, hex6);
    
    mux_h5: component MUX_2_7 
     port map ("1111111", const_t, E2, hex5);
    
    mux_h4: component MUX_2_7 
     port map ("1111111", h4_1, E2, hex4);
    
    -- MUX_4_7
    mux_h3: component MUX_4_7
     port map (const_C, h3_01, const_P, h3_11, sel_mux, hex3);
    
    mux_h2: component MUX_4_7
     port map (h2_00, h2_01, h2_10, h2_11, sel_mux, hex2);
    
    mux_h1: component MUX_4_7
     port map (const_L, h1_01, const_E, h1_11, sel_mux, hex1);
    
    mux_h0: component MUX_4_7
        port map (h0_00, h0_01, h0_10, h0_11, sel_mux, hex0);
    
    -- MUX_4_16
    mux_code: component MUX_4_16
        port map (rom0_s, rom1_s, rom2_s, rom3_s, sel(1 downto 0), code);
    
    -- REG_3bit
    reg3_E_reg: component REG_3bit
        port map (Clock500, R2, E4, E, E_reg);
    
    reg3_P_reg: component REG_3bit
        port map (Clock500, R2, E4,	P, P_reg);
    
    -- REG_6bit
    reg6_sel: component REG_6bit
        port map (Clock500, R2, E1,	Switches(5 downto 0), sel);
    
    -- REG_16bit
    reg16_user: component REG_16bit
        port map (Clock500, R2, E2,	Switches(15 downto 0), user);
    
    -- ROM0
    rom_0: component ROM0
        port map (sel(5 downto 2), rom0_s);
    
    -- ROM1
    rom_1: component ROM1
        port map (sel(5 downto 2), rom1_s);
    
    -- ROM2
    rom_2: component ROM2
        port map (sel(5 downto 2), rom2_s);
    
    -- ROM3
    rom_3: component ROM3
        port map (sel(5 downto 2), rom3_s);
    
    -- Selector
    selector_sel_mux: component Selector
        port map (E1, E2, R1, E5, sel_mux);
    
    -- soma_p
    somap1: component soma_p
        port map(cmp0_s, cmp1_s, cmp2_s, cmp3_s, P);
    
    -- soma4
    soma_4: component soma4
        port map (X, "0001", s_soma);
    
    -- signal F
    end_time_4bit <= "000" & end_timee;
    F <= not(s_soma) and not(end_time_4bit);
    
    -- signal result
    result <= "000" & end_gamee & F;
    
    -- OUT ledr
    E1_16bit <= "000000000000000" & E1;
    ledr <= s_dec_term and not(E1_16bit);
    
end arc_data;
