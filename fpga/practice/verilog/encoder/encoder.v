/*
 *  encoder
 *    (encoder.v)
 *      designed by smarco17
*/

module encoder(sig_in, sig_out);
  input wire [3:0] sig_in;
  output wire [2:0] sig_out;

  assign sig_out = encoder(sig_in);

  function [2:0] encoder;
    input [3:0] data;
    begin
      case(data)
        4'b0000 : encoder = 3'b000;
        4'b0001 : encoder = 3'b001;
        4'b0010 : encoder = 3'b010;
        4'b0100 : encoder = 3'b011;
        4'b1000 : encoder = 3'b100;
        default : encoder = 3'bXXX;
      endcase
    end
  endfunction
endmodule