module arithmetic_log_unit(
    input [31:0] src1;
    input [31:0] src2;
    input [5:0] alu_control;
    input [31:0] imm_value_r;
    input [3:0] shamt;
    output reg [31:0] result;
);

always@(*)
    begin
        case(alu_control)
            6'b000001: result = src1 + src2;
            6'b000010: result = src1 - src2;
            6'b000011: result = src1 << src2;
            6'b000100: result = (src1 < src2) ? 1 : 0;
            6'b000101: result = (src1 < src2) ? 1 : 0;
            6'b000110: result = src1 ^ src2;
            6'b000111: result = src1 >> src2;
            6'b001000: result = src1 >>> src2;
            6'b001001: result = src1 | src2;
            6'b001010: result = src1 & src2;
        endcase
    end

