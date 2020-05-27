/*
 *  sram
 *    sram.v
 *      designed by smarco17
*/


module sram(addr, data, cs, rd, wr);
  input wire [3:0] addr;
  input wire cs, rd, wr;
  inout wire [7:0] data;

  reg [7:0] mem[15:0];
  integer fd;

  assign data = (cs && rd) ? mem[addr] : 8'hZZ;

  initial begin
    $readmemb("sram.dat", mem);
  end

  always @(addr or data or cs or wr) begin
    if(cs && wr) begin
      mem[addr] <= data;
    end
  end
endmodule