module controller#(localparam Width = 3)(input rst,
                                               zero,
                                               Phase,
                                         input wire [Width:0] Opcode,
                                         input      clk,
                                         output reg sel,
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
        always@(*)begin
            case(current_state)
                 INST_ADDR : next_state = INST_FETCH;
                 INST_FETCH: next_state = INST_LOAD            ;
                 INST_LOAD : next_state = IDLE                 ;
                 IDLE      : next_state = OP_ADDR              ;
                 OP_ADDR   : next_state = OP_FETCH             ;
                 OP_FETCH  : next_state = ALU_OP               ;
                 ALU_OP    : next_state = STORE                ;
                 STORE     : next_state = INST_ADDR            ;
            endcase
        end
        always@(posedge clk)begin
            current_state <= rst ? 0 : next_state;
        end
        
        always@(*)begin
            case(current_state)
                INST_ADDR :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b1_0000_0000;
                INST_FETCH:{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b1_1000_0000;
                INST_LOAD :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b1_1100_0000;
                IDLE      :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b1_1100_0000;
                OP_ADDR   :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b0_00z1_0000;
                OP_FETCH  :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b0_z000_000z;
                ALU_OP    :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b0_z000_0000;
                STORE     :{sel,rd,ld_ir,halt,inc_pc,ld_ac,ld_pc,wr,data_e} = 9'b0_z000_0000;
            endcase
        end
endmodule