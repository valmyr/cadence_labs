module memory#(
    parameter AWIDTH = 5,
    parameter DWIDHT = 8
)( 
    input clk,
          wr,
          rd,
    input [AWIDTH-1:0] addr,
    inout [DWIDHT-1:0] data
);
  
    reg [AWIDTH-1:0][DWIDHT-1:0] my_memory;
    reg [DWIDHT-1:0]  data_out;
    wire [DWIDHT-1:0] data_in;

    always@(posedge clk)begin
        casez({wr,rd})
            2'b10:my_memory[addr] <= data_in;//write
            2'b01:data_out <= my_memory[addr];//read
        endcase
    end
    assign data_in = wr ?    data : 0;
    assign data    = rd ? data_out: 0;
endmodule