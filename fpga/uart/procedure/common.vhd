library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package common is
    procedure posedge(signal clk : in std_logic);
    procedure posedge(signal clk        : in std_logic;
                             iteration  : in integer);
    procedure rst(         interval   : in  time;
                           iteration  : in  integer;
                  signal   reset      : out std_logic);
end common;

package body common is
    procedure posedge(signal clk : in std_logic) is
    begin
        wait until clk'event and clk='1';
    end posedge;

    procedure posedge(signal       clk : in std_logic;
                             iteration : in integer) is
    begin
        for i in 0 to iteration loop
            wait until clk'event and clk='1';
        end loop;
    end posedge;

    procedure rst(         interval  : in  time;
                           iteration : in  integer;
                  signal   reset     : out std_logic) is
    begin
        reset <= '1';
        for i in 0 to iteration loop
            wait for interval;
        end loop;
        reset <= '0';
    end rst;
end common;