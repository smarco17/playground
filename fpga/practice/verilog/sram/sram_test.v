/*
 *  sram_test
 *    sram_test.v
 *      designed by smarco17
*/

`define DIV = 10;

module sram_test();
  reg  [3:0] addr;
  reg        cs, rd, wr;
  wire [7:0] data_in;
  reg  [7:0] data_w;
  wire [7:0] data;

  sram inst_sram(.addr(addr), .data(data), .cs(cs), .rd(rd), .wr(wr));

  assign data_in = data;
  assign data = (cs && wr) ? data_w : 8'hZZ;

  task sram_write;
    input [3:0] addr_t;
    input [7:0] data_t;
    begin
      #10
        cs <= 1'b1;
        wr <= 1'b1;
        addr   <= addr_t;
        data_w <= data_t;
      #10
        cs <= 1'b0;
        wr <= 1'b0;
    end
  endtask

  task sram_clear;
    integer i;
    for(i=0; i<16; i=i+1) begin
      sram_write(i, 0);
    end
  endtask

  task sram_read;
    input [3:0] addr_t;
    begin
      #10
        cs <= 1'b1;
        rd <= 1'b1;
        addr <= addr_t;
      #10
        cs <= 1'b0;
        rd <= 1'b0;
    end
  endtask

  task sram_read_all;
    integer i;
    begin
      for(i=0; i<16; i=i+1) begin
        sram_read(i);
      end
    end
  endtask

  initial begin
    $dumpfile("sram_test.vcd");
    $dumpvars(0, sram_test);
  end

  initial begin
    addr <= 4'b0000;
    cs   <= 1'b0;
    rd   <= 1'b0;
    wr   <= 1'b0;
  end

  initial begin
    sram_read_all();
    sram_clear();
    sram_read_all();
  end
endmodule