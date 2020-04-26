ghdl -a --ieee=synopsys ./rtl/uart.vhd
ghdl -a --ieee=synopsys ./testbench/tb_uart.vhd
ghdl -e --ieee=synopsys tb_uart
ghdl -r --ieee=synopsys tb_uart --vcd=uart.vcd