/*
 *  bram
 *    bram.v
 *      designed by smarco17
*/

module bram(clk, cs, wr, rd, addr, data_w, data_r);
  parameter D_WIDTH = 8, A_WIDTH = 4, DEPTH = 16;

  input  wire clk, cs, wr, rd;
  input  wire [A_WIDTH-1:0] addr;
  input  wire [D_WIDTH-1:0] data_w;
  output reg  [D_WIDTH-1:0] data_r;

  reg [D_WIDTH-1:0] mem [DEPTH-1:0];

  always @(posedge clk) begin
    if(cs && wr) begin
      mem[addr] <= data_w;
    end
  end

  always @(posedge clk) begin
    if(cs && rd) begin
      data_r <= mem[addr];
    end
  end
endmodule