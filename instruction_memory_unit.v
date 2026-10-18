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
                memory[0] = 8'h33;
                memory[1] = 8'h00;
                memory[2] = 8'h00;
                memory[3] = 8'h00;
            end
    end

endmodule