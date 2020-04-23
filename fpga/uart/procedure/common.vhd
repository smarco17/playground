library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package common is
    procedure posedge(signal clk: in std_logic);
end common;

package body common is
    procedure posedge(signal clk: in std_logic) is
        begin
            wait until clk'event and clk='1';
        end posedge;
end common;