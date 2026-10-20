module arithmetic_log_unit(
    input [31:0] src1,
    input [31:0] src2,
    input [5:0] alu_control,
    input [31:0] imm_val_r,
    input [4:0] shamt,
    output reg [31:0] result
);

always@(*)
    begin
        case(alu_control)
            6'b000001: result = src1 + src2; // add
            6'b000010: result = src1 - src2; // sub
            6'b000011: result = src1 << src2 [4:0]; // sll
            6'b000100: result = ($signed(src1) < $signed(src2)) ? 1 : 0; // slt
            6'b000101: result = (src1 < src2) ? 1 : 0; // sltu
            6'b000110: result = src1 ^ src2; // xor 
            6'b000111: result = src1 >> src2 [4:0]; // srl
            6'b001000: result = src1 >>> src2 [4:0]; // sra
            6'b001001: result = src1 | src2; // or
            6'b001010: result = src1 & src2; // and
            6'b001011: result = src1 + imm_val_r; // addi
            6'b001100: result = src1 << shamt; // slli 
            6'b001101: result = ($signed(src1) < $signed(imm_val_r)) ? 1 : 0; // slti
            6'b001110: result = (src1 < imm_val_r) ? 1 : 0; // sltiu
            6'b001111: result = src1 ^ imm_val_r; // xori
            6'b010000: result = src1 >> shamt; // srli
            6'b010001: result = src1 >>> shamt; // srai
            6'b010010: result = src1 | imm_val_r; // ori
            6'b010011: result = src1 & imm_val_r; // andi
        endcase
    end
endmodule