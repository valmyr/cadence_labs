module register#(localparam WIDTH = 8)(
    input [WIDTH-1:0] data_in,
    input load,
          clk,
          rst,
    output reg [WIDTH-1:0] data_out
);
    reg [WIDTH-1:0] temporary_data_out;
    always@(posedge clk)begin
        temporary_data_out <= rst ? 0 : data_in;
    end
    assign data_out = load ? temporary_data_out : 0;
endmodule