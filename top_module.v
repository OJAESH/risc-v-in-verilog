module top_module(
    clk,
    reset
);

wire [31:0] imm_val_top;
wire [31:0] pc;
wire [31:0] instruction_out;
wire [5:0] alu_control;
wire mem_to_reg;
wire bne_control;
wire beq_control;
wire jump;
wire [31:0] read_data_addr_dm;
wire [31:0] imm_val;
wire lb;
wire sw;
wire [31:0] imm_val_branch_top;
wire bne;
wire beq;
wire bge_control;
wire blt_control;
wire bge;
wire blt;
wire lui_control;
wire [31:0] imm_val_lui;
wire [31:0] imm_val_jump;
wire [31:0] current_pc;

instruction_fetch_unit ifu(
    clk,
    reset,
    imm_val_branch_top,
    imm_val_jump,
    beq,
    bne,
    blt,
    bge,
    jump,
    pc,
    current_pc
);

instruction_memory_unit imu(
    clk,
    reset,
    pc,
    instruction_out
);

control_unit cu(
    reset,
    instruction_out [31:25],
    instruction_out [14:12],
    instruction_out [6:0],
    alu_control,
    lb,
    mem_to_reg,
    bne_control,
    beq_control,
    blt_control,
    bge_control,   
    jump,
    sw,
    lui_control,
);

data_path_unit dpu(
    clk,
    reset,
    instruction_out [19:15],
    instruction_out [24:20],
    instruction_out [11:7],
    alu_control,
    jump,
    beq_control,
    zero_flag,
    reg_dst,
    mem_to_reg,
    bne_control,
    imm_val_top,
    instruction_out [24:20]
    lb,
    sw,
    bge_control,
    blt_control,
    lui_control,
    imm_val_lui,
    imm_val_jump,
    return_address,
    read_data_addr_dm,
    beq,
    bne,
    bge,
    blt 
);

assign imm_val_top = {{20{instruction_out [31]}}, instruction_out [31:20]};
assign imm_val_branch_top = {{20{instruction_out [31]}}, instruction_out [31:25], instruction_out [11:8], instruction_out[7]};
assign imm_val_lui = {{10{instruction_out [31]}}, instruction_out [31:12]};
assign imm_val_jump = {{10{instruction_out [31]}}, instruction_out [31:21]};
assign imm_val = imm_val_top;

endmodule