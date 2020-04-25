library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity uart is port (
    clk     : in  std_logic;
    reset   : in  std_logic;
    rx      : in  std_logic;
    data_rx : out std_logic_vector(7 downto 0) );
end uart;

architecture RTL of uart is
    signal rx_sync : std_logic;

    component synchronizer port(
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

end RTL;
