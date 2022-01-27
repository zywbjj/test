`timescale 1ns/1ps
 
module breath_led_v1_tb;
 
  reg         clk;
  reg         rst_n;
   
  wire        led;
 
  initial begin
    rst_n = 0;
    clk = 0;
    #105;
    rst_n = 1;
    #1000;
    $stop;
  end
 
  always #10 clk = ~clk;
   
  breath_led_v1 breath_led_v1_inst(
    .clk      (clk),
    .rst_n    (rst_n),
    .led      (led)
  );
 
endmodule