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
                                               ld_pc,
                                               data_e
);
        parameter [3:0] INST_ADDR  = 4'h0,
                        INST_FETCH = 4'h1,
                        INST_LOAD  = 4'h2,
                        IDLE       = 4'h3,
                        OP_ADDR    = 4'h5,
                        OP_FETCH   = 4'h6,
                        ALU_OP     = 4'h7,
                        STORE      = 4'h8;
        reg [3:0] current_state, next_state;
        always@(negedge clk,posedge rst)begin
            casez({sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e})
                 9'b100000000: next_state = INST_FETCH;
                 9'b110000000: next_state = INST_LOAD ;
                 9'b111000000: next_state = IDLE      ;
                 9'b000x10000: next_state = OP_FETCH  ;
                 9'b0x0010000: next_state = ALU_OP    ;



            endcase
        end
endmodule