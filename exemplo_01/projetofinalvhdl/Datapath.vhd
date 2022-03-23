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
    component selector is port(

        in0, in1, in2, in3: in  std_logic;
        saida             : out std_logic_vector(1 downto 0));
    
    end component;
    
    component soma is port(

        A:  in std_logic_vector(3 downto 0);
        B:  in std_logic_vector(3 downto 0);
        S:  out std_logic_vector(3 downto 0)
     );
    
    end component;

    component soma_p is port(

        A, B, C, D:  in std_logic;
        S:  out std_logic_vector(2 downto 0)
     );
    
    end component;
    
    component mux2_1 is port(

        data_in_1, data_in_2:  in std_logic_vector(6 downto 0);
        op : in std_logic;
        out_7seg:  out std_logic_vector(6 downto 0)
     );
    
    end component;
    
    component mux4_1_16bits is port(

        data_in_1, data_in_2, data_in_3, data_in_4:  in std_logic_vector(15 downto 0);
        op : in std_logic_vector(1 downto 0);
        out_7seg:  out std_logic_vector(15 downto 0)
     );
    
    end component;
    
    component mux4_1_7bits is port(

        data_in_1, data_in_2, data_in_3, data_in_4:  in std_logic_vector(6 downto 0);
        op : in std_logic_vector(1 downto 0);
        out_7seg:  out std_logic_vector(6 downto 0)
     );
    
    end component;
    
    component dec7seg is port(

        bcd_in:  in std_logic_vector(3 downto 0);
        out_7seg:  out std_logic_vector(6 downto 0)
     );
    
    end component;
    
    component reg_6bits is port(

        CLK, R, E: in std_logic;	
	    D: in std_logic_vector(5 downto 0);
    	Q: out std_logic_vector(5 downto 0));
    
    end component;
    
    component reg_3bits is port(

        CLK, R, E: in std_logic;	
	    D: in std_logic_vector(2 downto 0);
	    Q: out std_logic_vector(2 downto 0));
    
    end component;
    
    component reg_16bits is port(

        CLK, R, E: in std_logic;	
	    D: in std_logic_vector(15 downto 0);
	    Q: out std_logic_vector(15 downto 0));
    
    end component;
    
    component counter_round is port(

        CLK, R, E: in std_logic;
        end_round: out std_logic;
        S: out std_logic_vector(3 downto 0));
    
    end component;
    
    component counter_time is port(

        CLK, R, E: in std_logic;
        end_time: out std_logic;
        S: out std_logic_vector(3 downto 0));
    
    end component;
    
    component ROM0 is port(

        address : in  std_logic_vector(3 downto 0);
        data    : out std_logic_vector(15 downto 0));
    
    end component;
    
    component ROM1 is port(

        address : in  std_logic_vector(3 downto 0);
        data    : out std_logic_vector(15 downto 0));
    
    end component;
    
    component ROM2 is port(

        address : in  std_logic_vector(3 downto 0);
        data    : out std_logic_vector(15 downto 0));
    
    end component;
    
    component ROM3 is port(

        address : in  std_logic_vector(3 downto 0);
        data    : out std_logic_vector(15 downto 0));
    
    end component;
    
    component comp_e is port(

        inc, inu: in  std_logic_vector(15 downto 0);
        E       : out std_logic_vector(2 downto 0)
    );
    
    end component;
    
    component comp_3bits is port(

        inc, inu: in std_logic_vector(2 downto 0);
        E       : out std_logic
    );
    
    end component;
    
    component comp_4bits is port(

        inc, inu: in std_logic_vector(3 downto 0);
        E       : out std_logic
    );
    
    end component;
    
    component decoder_termometrico is port(

        data_in : in  std_logic_vector(3 downto 0);
        data_out    : out std_logic_vector(15 downto 0)
    );
    
    end component;
    
    
    
signal code, user, s_dec_term, rom0_s, rom1_s, rom2_s, rom3_s: std_logic_vector(15 downto 0); 
signal result: std_logic_vector(7 downto 0);
signal h0_00, h0_01, h0_10, h0_11, h1_01, h1_11, h2_00, h2_01, h2_10, h2_11, h3_01, h3_11, h4_1, h6_1, h7_1: std_logic_vector(6 downto 0);
signal sel: std_logic_vector(5 downto 0);
signal time_1, X, s_soma, F, dec_8in, dec_12in, dec_14in: std_Logic_vector(3 downto 0);
signal P, P_reg, E, E_reg: std_logic_vector(2 downto 0);
signal sel_mux: std_logic_vector(1 downto 0);
signal end_gamee, end_timee, cmp0_s, cmp1_s, cmp2_s, cmp3_s: std_logic;

begin
end_game <= end_gamee; --ao interligar a saida do comp=4, usar o signal end_game para evitar erros
end_time <= end_timee; --ao interligar a saida do counter_time, usar o signal end_timee para evitar erros
F <= not("000" & end_timee) and not(s_soma); --coloquei "000" para o and sempre pegar o s_soma
result <= "000" & end_timee & F;
ledr <= not("000000000000000" & E1) and s_dec_term;

select1: component selector
 port map (E1, E2, R1, E5, sel_mux);

soma1: component soma
 port map (X, "0001", s_soma);

somap1: component soma_p
 port map(cmp0_s, cmp1_s, cmp2_s, cmp3_s, P);

mux2_1_1: component mux2_1 
 port map ("1111111", h7_1, E5, HEX7);
        
mux2_1_2: component mux2_1 
 port map ("1111111", h6_1, E5, HEX6);

mux2_1_3: component mux2_1 
 port map ("1111111", "1110000", E2, HEX5);

mux2_1_4: component mux2_1 
 port map ("1111111", h4_1, E2, HEX4);

mux4_1_16bits_1: component mux4_1_16bits
 port map (rom0_s, rom1_s, rom2_s, rom3_s, sel(1 downto 0), code);

mux4_1_7bits_1: component mux4_1_7bits
 port map ("0110001", h3_01, "0011000", h3_11, sel_mux, HEX3);

mux4_1_7bits_2: component mux4_1_7bits
 port map (h2_00, h2_01, h2_10, h2_11, sel_mux, HEX2);

mux4_1_7bits_3: component mux4_1_7bits
 port map ("0001110", h1_01, "1001111", h1_11, sel_mux, HEX1);

mux4_1_7bits_4: component mux4_1_7bits
 port map (h0_00, h0_01, h0_10, h0_11, sel_mux, HEX0);

dec7seg1: component dec7seg
 port map (result(7 downto 4), h7_1);

dec7seg2: component dec7seg
 port map (result(3 downto 0), h6_1);

dec7seg3: component dec7seg
 port map (time_1, h4_1);

dec7seg4: component dec7seg
 port map (user(15 downto 12), h3_01);

dec7seg5: component dec7seg
 port map (code(15 downto 12), h3_11);

dec7seg6: component dec7seg
 port map (sel(5 downto 2), h2_00);

dec7seg7: component dec7seg
 port map (user(11 downto 8), h2_01);

dec_8in <= '0' & P_reg;
dec7seg8: component dec7seg
 port map (dec_8in, h2_10);

dec7seg9: component dec7seg
 port map (code(11 downto 8), h2_11);

dec7seg10: component dec7seg
 port map (user(7 downto 4), h1_01);

dec7seg11: component dec7seg
 port map (code(7 downto 4), h1_11);

dec_12in <= "00" & sel(1 downto 0);
dec7seg12: component dec7seg
 port map (dec_12in, h0_00);

dec7seg13: component dec7seg
 port map (user(3 downto 0), h0_01);

dec_14in <= '0' & E_reg(2 downto 0);
dec7seg14: component dec7seg
 port map (dec_14in, h0_10);
 
dec7seg15: component dec7seg
 port map (code(3 downto 0), h0_11);

countround: component counter_round 
 port map (Clock500, R2, E3, end_round, X);

counttime: component counter_time 
 port map (Clock1, R1, E2, end_timee, time_1);

dec_term: component decoder_termometrico
 port map (X, s_dec_term);

comp_4_0: component comp_4bits 
 port map (code(3 downto 0), user(3 downto 0), cmp0_s);

comp_4_1: component comp_4bits 
 port map (code(7 downto 4), user(7 downto 4), cmp1_s);

comp_4_2: component comp_4bits 
 port map (code(11 downto 8), user(11 downto 8), cmp2_s);

comp_4_3: component comp_4bits 
 port map (code(15 downto 12), user(15 downto 12), cmp3_s);

comp_e_0: component comp_e 
 port map (code, user, E);

comp_3_0: component comp_3bits 
 port map (P, "100", end_gamee);

reg_3_1: component reg_3bits
port map (Clock500, R2, E4,	E,E_reg);

reg_3_2: component reg_3bits
port map (Clock500, R2, E4,	P,P_reg);

reg_6: component reg_6bits
port map (Clock500, R2, E1,	Switches(5 downto 0), sel);
    
reg_16: component reg_16bits
port map (Clock500, R2, E2,	Switches(15 downto 0), user);

rom_0: component ROM0
port map (sel(5 downto 2), rom0_s);
    
rom_1: component ROM1
port map (sel(5 downto 2), rom1_s);    

rom_2: component ROM2
port map (sel(5 downto 2), rom2_s);   

rom_3: component ROM3
port map (sel(5 downto 2), rom3_s);  

end arc_data;
