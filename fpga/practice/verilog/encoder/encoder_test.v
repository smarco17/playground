/*
 *  encoder_test
 *    encoder_test.v
 *      designed by smarco17
*/
module encoder_test();
  reg  [3:0] sig_in;
  wire [2:0] sig_out;
  encoder inst_encoder (.sig_in(sig_in), .sig_out(sig_out));

  initial begin
    $dumpfile("encoder_test.vcd");
    $dumpvars(0, encoder_test);
    $monitor("%0t in: %b, out: %b", $time, sig_in, sig_out);
    fd
  end

  initial begin
      sig_in <= 4'b0000;
    #10
      sig_in <= 4'b0001;
    #10
      sig_in <= 4'b0010;
    #10
      sig_in <= 4'b0100;
    #10
      sig_in <= 4'b1000;
    #10
      sig_in <= 4'b1111;
    #10
    $finish;
  end

endmodule