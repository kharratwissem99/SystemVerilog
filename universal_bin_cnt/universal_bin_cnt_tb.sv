`timescale 1ns/1ps

module universal_bin_cnt_tb;

  // Testbench signals
    //   reg clk;
    //   reg a, b;
    //   wire q0, q1;
    localparam N = 5;
    logic clk , rst , syn_clr , load, en, up;
    logic [N-1:0] d;
    logic [N-1:0] q;

  // DUT (Device Under Test)
  // Using your code wrapped in a module
  universal_bin_cnt #(N) dut(
    .clk(clk) , .rst(rst) , .syn_clr(syn_clr) , .load(load), .en(en), .up(up), .d(d), .q(q)
  );

  always #5 clk = ~clk;
  always #500 rst = ~rst; 

  // Stimulus
  initial begin
    // Initialize signals
    clk = 0; rst = 1; // move to always block
    syn_clr = 0; load = 0; en = 1; up = 1; d = '0;

    // Monitor outputs
    $monitor("t=%0t clk=%b rst=%b load=%b up=%b en=%b d=%b | q=%b", 
              $time, clk, rst, load, up, en, d, q);

    // Change inputs over time
    #1 rst = 0;
    // let the counter count up

    #50 load = 1; up = 0; en = 1; d = 'd20; // load 20 and let him count down

    #50 load = 0; up = 0; en = 0; d = 'd20; // pause

    // #5  a=1; b=0; clk=1;   // q0 latch transparent -> q0 = a&b = 0
    // #5  a=1; b=1;          // q0 updates -> q0 = 1
    // #5  clk=0;             // switch -> q1 latch transparent -> q1 = a|b = 1
    // #5  a=0; b=0;          // q1 updates -> q1 = 0
    // #5  clk=1; a=1; b=0;   // q0 latch transparent again -> q0 = 0
    // #5  a=1; b=1;          // q0 updates -> q0 = 1
    #600 $finish;
  end

endmodule