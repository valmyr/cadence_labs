module ula#(localparam WIDTH = 8)(
    input [WIDTH:0] in_a,
                    in_b,
    input [3:0]     opcode,
    output reg [WIDTH:0] alu_out,
    output _a_is_zero
);
    assign _a_is_zero = (in_a == 0);//verification A
                               //operation 
    parameter [2:0] HLT = 3'h0,//pass A
                    SKZ = 3'h1,//pass A
                    ADD = 3'h2,//ADD A+B
                    AND = 3'h3,//AND A&B
                    XOR = 3'h4,//XOR A^B
                    LDA = 3'h5,//pass B
                    STO = 3'h6,//pass A
                    JMP = 3'h7;//pass A
    always@(*)begin
        case(opcode)
            HLT: alu_out = in_a;
            SKZ: alu_out = in_a;
            ADD: alu_out = in_a + in_b;
            AND: alu_out = in_a & in_b;
            XOR: alu_out = in_a ^ in_b;
            LDA: alu_out = in_b;
            STO: alu_out = in_a;
            JMP: alu_out = in_a;
        endcase
     end
endmodule