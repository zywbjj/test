module breath_led_v1(clk, rst_n, led);
 
  input       clk;
  input       rst_n;
   
  output      led;
 
  reg [6:0] cnt_2us;
  reg [9:0] cnt_2ms;
  reg [9:0] cnt_2s;
   
  always @ (posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0)
      cnt_2us <= 7'd0;
    else if(cnt_2us == 7'd99)
      cnt_2us <= 7'd0;
    else
      cnt_2us <= cnt_2us + 1'b1;
  end
 
  always @ (posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0)
      cnt_2ms <= 10'd0;
    else if(cnt_2us == 99)
      begin
        if(cnt_2ms == 999)
          cnt_2ms <= 10'd0;
        else
          cnt_2ms <= cnt_2ms + 1'b1;
      end
    else
      cnt_2ms <= cnt_2ms;
  end
 
  reg change;
   
  always @ (posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0)
      begin
        cnt_2s <= 10'd0;
        change <= 1'b0;
      end
    else if(cnt_2us == 99 && cnt_2ms == 999)
      begin
        if(cnt_2s == 999)
          begin
            cnt_2s <= 10'd0;
            change <= 1'b1;
          end
        else
          begin
            cnt_2s <= cnt_2s + 1'b1;
            change <= 1'b0;
          end
      end
    else
      begin
        cnt_2s <= cnt_2s;
        change <= 1'b0;
      end
  end
   
  wire led_n;
  reg flag;
   
  assign led_n = (cnt_2ms <= cnt_2s) ? 1'b1 : 1'b0;
   
  always @ (posedge clk, negedge rst_n)
  begin
    if(rst_n == 1'b0)
      flag <= 0;
    else if(change)
      flag <= ~flag;
    else
      flag <= flag;
  end
   
  assign led = (flag) ? led_n : ~led_n;
 
endmodule