library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
use work.common.all;

entity tb_uart is
end tb_uart;

architecture RTL of tb_uart is
    constant CYCLE      : time    := 25.0 ns;
    constant HALF_CYCLE : time    := 12.5 ns;
    constant DELAY      : time    :=  1.0 ns;

    signal clk     : std_logic;
    signal reset   : std_logic;
    signal rx      : std_logic;
    signal data_rx : std_logic_vector(7 downto 0);

    component uart port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        rx      : in  std_logic;
        data_rx : out std_logic_vector(7 downto 0) );
    end component;
begin
    inst_uart: uart port map(
        clk     => clk,
        reset   => reset,
        rx      => rx,
        data_rx => data_rx );

    process begin
        clk <= '0'; wait for HALF_CYCLE;
        clk <= '1'; wait for HALF_CYCLE;
    end process;

    process begin
        rst(CYCLE, 16, reset);
        posedge(clk, 10);
        posedge(clk); rx <= '1' after DELAY;
        posedge(clk); rx <= '0' after DELAY;
        wait;
    end process;
end RTL;