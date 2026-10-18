module data_path_unit(
    input clk,
    input reset,
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg_num1,
    input [5:0] alu_control,
    input jump,
    input beq_control,
    input zero_flag,
    input reg_dst,
    input mem_to_reg,
    input bne_control,
    input bge_control,
    input blt_control,
    input lui_control,
    input lb,
    input sw,
    input [31:0] imm_val_lui,
    input [31:0] imm_val_jump,
    input [31:0] return_address,
    output [4:0] read_data_addr_dm,
    output beq,
    output bne,
    output bge,
    output blt 
);

reg [31:0] pc_current;
reg [31:0] pc_next;
reg [31:0] pc_2;
wire [31:0] instr;
wire [31:0] ext_imm;
wire [31:0] read_reg_data_1;
wire [31:0] read_reg_data_2;
wire [31:0] reg_write_dest;
wire [31:0] read_reg_data_2;
wire [31:0] pc_j;
wire [31:0] pc_beq;
wire [31:0] pc_bne;
wire bne_control;
wire [31:0] pc_2beq;
wire [31:0] pc_2bne;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [4:0] read_data_addr_dm;
wire [31:0] write_data_alu;
wire [31:0] write_data_dm;
wire [4:0] rd_addr;
wire [31:0] data_out;
wire [31:0] data_out_2_dm;

register_file_unit rfu(clk, reset, read_reg_num1, read_reg_num2, write_reg_num1, data_out, lb, lui_control, lui_imm_val, return_address, jump, read_data1, read_data2, read_data_addr_dm, data_out_2_dm, sw);

arithmetic_log_unit alu(read_data1, read_data2, alu_control, imm_val, shamt, write_data_alu);

data_memory dmu(clk, rst, imm_val [4:0], data_out_2_dm, sw, imm_val [4:0], data_out);

initial
    begin
        pc_current <= 32'd0;
    end

always@(posedge clk)
    begin
        pc_current <= pc_next;
    end

assign pc2 