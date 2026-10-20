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
                // Address 0: addi x1, x0, 5 (32'h00500093)
                mem[0] = 8'h93;
                mem[1] = 8'h00;
                mem[2] = 8'h50;
                mem[3] = 8'h00;
                // Address 4: addi x2, x0, 10 (32'h00a00113)
                mem[4] = 8'h13;
                mem[5] = 8'h01;
                mem[6] = 8'ha0;
                mem[7] = 8'h00;
                // Address 8: add x3, x1, x2 (32'h002081b3)
                mem[8]  = 8'hb3;
                mem[9]  = 8'h81;
                mem[10] = 8'h20;
                mem[11] = 8'h00;
            end
    end
endmodule