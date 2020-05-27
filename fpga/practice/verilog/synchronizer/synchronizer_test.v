/*
 *  synchronizer_test
 *    synchronizer_test.v
 *      designed by smarco17
*/

`timescale 1ns / 1ps

module synchronizer_test();
  reg  clk, rst, sig_in;
  wire sig_out;
  integer fd;
  synchronizer inst_synchronizer(.clk(clk), .rst(rst), .sig_in(sig_in), .sig_out(sig_out));

  initial begin
    clk    <= 1'b0;
    rst    <= 1'b0;
    sig_in <= 1'b0;
  end

  initial begin
    $dumpfile("synchronizer_test.vcd");
    $dumpvars(0, synchronizer_test);
  end

  always #10 begin
    clk <= ~clk;
  end

  initial begin
    fd = $fopen("result.txt", "w");$fdisplay(fd, "sig_in sig_out");
    @(posedge clk) rst    <= 1'b1; $fdisplay(fd, "%4b %4b", sig_in, sig_out);
    @(posedge clk)                 $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk) rst    <= 1'b0; $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk) sig_in <= 1'b1; $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk) sig_in <= 1'b0; $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk)                 $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk)                 $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    @(posedge clk)                 $fdisplay(fd, "%4b %4b",sig_in, sig_out);
    $fclose(fd);
    $finish;
  end
endmodule