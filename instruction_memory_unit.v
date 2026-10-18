module instruction_memory_unit(
    input clk,
    input reset,
    input [31:0] pc,
    output [31:0] instruction_code
);

reg [7:0] memory [108:0];

assign instruction_code = {memory[pc+3], memory[pc+2], memory[pc+1], memory[pc]};

always@(posedge clk)
    begin
        if(reset == 1)
            begin
                // add
                memory[0] = 8'h33;
                memory[1] = 8'h00;
                memory[2] = 8'h00;
                memory[3] = 8'h00;
                // sub
                memory[4] = 8'h33;
                memory[5] = 8'h00;
                memory[6] = 8'h00;
                memory[7] = 8'h40;
                // sll
                memory[8]  = 8'h33;
                memory[9]  = 8'h10; 
                memory[10] = 8'h00;
                memory[11] = 8'h00; 
                // xor
                memory[12] = 8'h33;
                memory[13] = 8'h40;
                memory[14] = 8'h00;
                memory[15] = 8'h00;
                // srl
                memory[16] = 8'h33;
                memory[17] = 8'h50;
                memory[18] = 8'h00;
                memory[19] = 8'h00;
                // srl
                memory[20] = 8'h33;
                memory[21] = 8'h50;
                memory[22] = 8'h00;
                memory[23] = 8'h00;
                // or
                memory[24] = 8'h33;
                memory[25] = 8'h60;
                memory[26] = 8'h00;
                memory[27] = 8'h00;
                // and
                memory[28] = 8'h33;
                memory[29] = 8'h70;
                memory[30] = 8'h00;
                memory[31] = 8'h00;
            end
    end

endmodule