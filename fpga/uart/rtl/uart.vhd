library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity uart is port (
    A : in std_logic;
    B : in std_logic;
    C : out std_logic);
end uart;

architecture RTL of uart is
begin
    C <= A and B;
end RTL;
