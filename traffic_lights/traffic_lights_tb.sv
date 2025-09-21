`timescale 1ns/1ps

module traffic_lights_tb;

    // Testbench signals
    logic clk , rst , Ta, Tb;
    logic[1:0] La, Lb;

  // DUT (Device Under Test)
  // Using your code wrapped in a module
  traffic_lights dut(
    .clk(clk) , .rst(rst) , .Ta(Ta) , .Tb(Tb), .La(La), .Lb(Lb)
  );

  always #5 clk = ~clk;
  // always #150 rst = ~rst; 

  // Stimulus
  initial begin
    // Initialize signals
    clk = 0; rst = 1;Ta = 1; Tb = 1;// move to always block
    // syn_clr = 0; load = 0; en = 1; up = 1; d = '0;

    // Change inputs over time
    #10 rst = 0;

    #50 Ta = 0;
    // #600 $finish;
  end

endmodule