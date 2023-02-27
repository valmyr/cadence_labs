module driver#(localparam WIDTH = 8)(
        input [WIDTH:0] data_in,
        input data_en,
        output [WIDTH:0] data_out
);
    assign data_out = data_en ? data_in:0;
endmodule