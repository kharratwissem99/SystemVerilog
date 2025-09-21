`timescale 1ns/1ps

module edge_detect_mealy_tb;

    // Testbench signals
    logic clk , rst , in, out;

  // DUT (Device Under Test)
  // Using your code wrapped in a module
  edge_detect_mealy dut(
    .clk(clk) , .rst(rst) , .in(in) , .out(out)
  );

  always #5 clk = ~clk;
  always #150 rst = ~rst; 

  // Stimulus
  initial begin
    // Initialize signals
    clk = 0; rst = 1; in =0; // move to always block
    // syn_clr = 0; load = 0; en = 1; up = 1; d = '0;

    // Change inputs over time
    #10 rst = 0;
    // let the counter count up

    #50 in = 1;
    #10 in = 0;
    #600 $finish;
  end

endmodule