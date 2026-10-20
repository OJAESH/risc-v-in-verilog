module control_unit(
    input reset,
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [5:0] alu_control,
    output reg lb,
    output reg mem_to_reg,
    output reg bne_control,
    output reg beq_control,
    output reg blt_control,
    output reg bge_control,   
    output reg jump,
    output reg sw,
    output reg lui_control
);

always@(reset)
    begin
        if(reset)
            alu_control = 0;
    end

always@(funct7 or funct3 or opcode)
    begin
        if(opcode = 7'b0110011)
            begin
                mem_to_reg = 0;
                beq_control = 0;
                bne_control = 0;
                blt_control = 0;
                bge_control = 0;
                jump = 0;
                lui_control = 0;

                case(funct3)
                    3'b000:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000001; // add
                            else if (funct7 == 64)
                                alu_control = 6'b000010; // sub
                        end
                    3'b001:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000011; // sll
                        end
                    3'b010:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000100; // slt
                        end
                    3'b011:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000101; // sltu
                        end
                    3'b100:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000110; // xor
                        end
                    3'b101:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b000111; // srl
                            else if (funct7 == 64)
                                alu_control = 6'b001000; // sra
                        end
                    3'b110:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b001001; // or
                        end
                    3'b111:
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b001010; // and
                        end
                    default:
                endcase
            end

        else if(opcode == 7'b0010011)
            begin
                mem_to_reg = 0;
                beq_control = 0;
                bne_control = 0;
                blt_control = 0;
                bge_control = 0;
                jump = 0;
                lb = 0;
                sw = 0;

                case(funct3)
                    3'b000: alu_control = 6'b001011; // addi
                    3'b001: alu_control = 6'b001100; // slli
                    3'b010: alu_control = 6'b001101; // slti
                    3'b011: alu_control = 6'b001110; // sltiu
                    3'b100: alu_control = 6'b001111; // xori
                    3'b101: 
                        begin
                            if (funct7 == 0)
                                alu_control = 6'b010000; // srli
                            else if (funct7 == 64)
                                alu_control = 6'b010001; // srai
                        end
                    3'b110: alu_control = 6'b010010; // ori
                    3'b111: alu_control = 6'b010011; // andi
                endcase
            end                    
    end
endmodule

