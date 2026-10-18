`timescale 1ns / 1ps

module instruction_fetch_unit(
    input clk,
    input reset,
    input [31:0] imm_address,
    input [31:0] imm_address_jump,
    input beq,
    input bne,
    input blt,
    input bge,
    input jump,
    output [31:0] pc,
    output [31:0] current_pc
);

always@(posedge clk)
    begin
        if (reset == 1)
            begin
                pc <= 0;
            end
        else if (beq == 0 && bne == 0 && blt == 0 && bge == 0 && jump == 0)
            begin 
                pc <= pc + 4;
            end
        else if (beq == 1 || bne == 1 || blt == 1 || bge == 1)
            begin
                pc <= pc + imm_address;
            end
        else if (jump)
            begin   
                pc <= pc + imm_address_jump;
            end
    end

always@(posedge clk)
    begin
        if (reset)
            begin
                current_pc <= 0;
            end
        else if (reset == 0 && jump == 0)
            begin
                current_pc <= pc + 4;
            end
        else
            begin
                current_pc <= current_pc;
            end
    end

endmodule
