module mux#(localparam WIDTH = 8)(
                                    input             sel    ,
                                    input [WIDTH:0]   in0    ,
                                                      in1    ,
                                    output [WIDTH:0]  mux_out
);
    assign mux_out = sel ? in1 : in0;
endmodule