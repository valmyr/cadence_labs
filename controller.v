module controller#(localparam Width = 3)(input rst,
                                               zero,
                                               Phase,
                                         input wire [Width:0] Opcode,
                                         input clk,
                                        output sel,
                                               rd,
                                               ld_ir,
                                               halt,
                                               inc_pc,
                                               ld_ac,
                                               wr,
                                               ld_pe,
                                               data_e
);
        
        always@(negedge clk,posedge rst)begin
            
        end
endmodule