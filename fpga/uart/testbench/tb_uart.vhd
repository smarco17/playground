library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_uart is
end tb_uart;

architecture RTL of tb_uart is
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';

    component uart port(
        A: in std_logic;
        B: in std_logic;
        C: out std_logic);
    end component;
begin
    inst_uart: uart port map(
        A => A,
        B => B,
        C => C);
end RTL;
