module cmp16(
    input   wire    [15:0]  a,
    input   wire    [15:0]  b,
    input   wire                fi_big,
    input   wire                fi_equal,
    input   wire                fi_small,
 
    output      wire                fo_big,
    output      wire                fo_equal,
    output      wire                fo_small
);
 
    wire         fo_big_temp;
    wire         fo_equal_temp;
    wire         fo_small_temp;
 
        cmp8    cmp8_inst1(
            .a              (a[15:8]),
            .b              (b[15:8]),
            .fi_big     (fi_big),  
            .fi_equal   (fi_equal),
            .fi_small   (fi_small),
             
 
            .fo_big     (fo_big_temp), 
            .fo_equal   (fo_equal_temp),   
            .fo_small   (fo_small_temp)
        );
 
        cmp8    cmp8_inst2(
            .a              (a[7:0]),
            .b              (b[7:0]),
            .fi_big     (fo_big_temp), 
            .fi_equal   (fo_equal_temp),   
            .fi_small   (fo_small_temp),
             
            .fo_big     (fo_big),  
            .fo_equal   (fo_equal),
            .fo_small   (fo_small)
        ); 
 
endmodule