`timescale 1ns/1ps
 
module cmp16_tb();
 
    reg [15:0]  a;
    reg     [15:0]  b;
    reg                 fi_big;
    reg                 fi_equal;
    reg                 fi_small;
 
    wire                fo_big;
    wire                fo_equal;
    wire                fo_small;
     
    initial begin
            a=6512;              //先制造2个相等的情况
            b=6512;             //先制造2个相等的情况
            fi_big  = 1'b0;   //必须接地，因为高位不存在
            fi_equal = 1'b1;     //必须接VCC，因为高位不存在，需要保持相等
            fi_small = 1'b0;     //必须接地，因为高位不存在
            #20;
        repeat(100)begin
            a={$random}%65536;
            b={$random}%65536;
            fi_big  = 1'b0;
            fi_equal = 1'b1;
            fi_small = 1'b0;
            #20;
        end
    end
     
    cmp16 cmp16_inst(
    .a              (a),
    .b              (b),
    .fi_big     (fi_big),
    .fi_equal   (fi_equal),
    .fi_small   (fi_small),
 
    .fo_big     (fo_big),
    .fo_equal   (fo_equal),
    .fo_small   (fo_small)
);
 
 
endmodule