/*
 *  synchronizer
 *    synchronizer.v
 *      designed by smarco17
*/

module synchronizer(clk, rst, sig_in, sig_out);
  input  wire clk, rst, sig_in;
  output wire  sig_out;
  reg sig_f1, sig_f2;

  assign sig_out = sig_f2;

  always @(posedge clk) begin
    if(rst) begin
      sig_f1 <= 1'b0;
    end else begin
      sig_f1 <= sig_in;
      sig_f2 <= sig_f1;
    end
  end
endmodule