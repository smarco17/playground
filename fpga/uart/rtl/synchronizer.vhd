library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity synchronizer is port(
    clk     : in  std_logic;
    reset   : in  std_logic;
    sig_in  : in  std_logic;
    sig_out : out std_logic );
end synchronizer;

architecture RTL of synchronizer is
    signal sig_in_f1 : std_logic;
    signal sig_in_f2 : std_logic;
begin
    sig_out <= sig_in_f2;
    sync: process (clk)
    begin
        if(clk'event and clk='1') then
            if(reset='1') then
                sig_in_f1 <= '0';
            else
                sig_in_f1 <= sig_in;
                sig_in_f2 <= sig_in_f1;
            end if;
        end if;
    end process;
end RTL;