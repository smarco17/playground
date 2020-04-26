library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity detect_edge_f is port(
    clk     : in  std_logic;
    reset   : in  std_logic;
    sig_in  : in  std_logic;
    sig_out : out std_logic );
end detect_edge_f;

architecture RTL of detect_edge_f is
    signal sig_in_F  : std_logic;
    signal sig_out_F : std_logic;
begin
    sig_out <= sig_out_F;
    latch : process(clk) begin
        if(clk'event and clk='1') then
            if(reset='1') then
                sig_in_F <= '0';
            else
                sig_in_F <= sig_in;
            end if;
        end if;
    end process;

    pulse : process(clk) begin
        if(clk'event and clk='1') then
            if(reset='1') then
                sig_out_F <= '0';
            else
                if(sig_in='0' and sig_in_F='1') then
                    sig_out_F <= '1';
                end if;
            end if;
        end if;
    end process;
end RTL;