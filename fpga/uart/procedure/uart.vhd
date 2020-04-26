library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package uart is
    procedure uart_transmit(signal clk     : in  std_logic;
                                   data    : in  std_logic_vector(7 downto 0);
                            signal data_tx : out std_logic );
end uart;

package body uart is
    procedure uart_transmit(signal clk     : in  std_logic;
                                   data    : in  std_logic_vector(7 downto 0);
                            signal data_tx : out std_logic ) is
        constant DELAY : time := 1 ns;
    begin
        data_tx <= '1';
        wait until clk'event and clk='1';
        data_tx <= '0' after DELAY;
        for i in 0 to data'length-1 loop
            wait until clk'event and clk='1';
            data_tx <= data(i) after DELAY;
        end loop;
        data_tx <= '1' after DELAY;
        wait until clk'event and clk='1';
    end uart_transmit;
end uart;