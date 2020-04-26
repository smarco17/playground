library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity uart_rx is port (
    clk     : in  std_logic;
    reset   : in  std_logic;
    rx      : in  std_logic;
    data_rx : out std_logic_vector(7 downto 0) );
end uart_rx;

architecture RTL of uart_rx is
    type state_rx is (idle, receiving, done);
    signal state       : state_rx;
    signal rx_sync     : std_logic;
    signal rx_sync_F1  : std_logic;
    signal rx_cnt      : integer range 0 to 8;
    signal rx_start    : std_logic;
    signal data_rx_int : std_logic_vector(7 downto 0);

    component synchronizer port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        sig_in  : in  std_logic;
        sig_out : out std_logic );
    end component;

    component detect_edge_f port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        sig_in  : in  std_logic;
        sig_out : out std_logic );
    end component;
begin
    inst_rx_sync : synchronizer port map(
        clk     => clk,
        reset   => reset,
        sig_in  => rx,
        sig_out => rx_sync );

    latch : process(clk) begin
        if(clk'event and clk='1') then
            if(reset='1') then
                rx_sync_F1 <= '0';
            else
                rx_sync_F1 <= rx_sync;
            end if;
        end if;
    end process;

    state_transition : process(clk) begin
        if(clk'event and clk='1') then
            if(reset='1') then
                state <= idle;
            elsif(state=idle and (rx_sync_F1='1' and rx_sync='0')) then
                state <= receiving;
            elsif(state=receiving and rx_cnt=8-1) then
                state <= done;
            elsif(state=done) then
                state <= idle;
            end if;
        end if;
    end process;

    state_processing : process(clk) begin
        if(clk'event and clk='1') then
            if(reset='1') then
                rx_cnt      <= 0;
                data_rx_int <= (others=>'0');
            elsif(state=receiving) then
                rx_cnt              <= rx_cnt + 1;
                data_rx_int(rx_cnt) <= rx_sync;
            elsif(state=done) then
                rx_cnt  <= 0;
                data_rx <= data_rx_int;
            end if;
        end if;
    end process;
end RTL;
