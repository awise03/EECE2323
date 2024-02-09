`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 08:41:27 AM
// Design Name: 
// Module Name: alu_reg_file_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_reg_file_tb();
// Regfile:
logic rst, clk, RegWrite;
logic [2:0] ReadAddress1, ReadAddress2, WriteAddress;
logic [15:0] WriteData, ReadData1, ReadData2;
// MUX
logic ALUSrc1, ALUSrc2;
logic [15:0] alu_input2_instr_src, zero_register, alu_input1, alu_input2;
// ALU
logic ovf, take_branch;
logic [2:0] ALUOp;
logic [15:0] result;

reg_file register(.rst(rst), .clk(clk), .wr_en(RegWrite), .rd0_addr(ReadAddress1), .rd1_addr(ReadAddress2), .wr_addr(WriteAddress), .wr_data(WriteData), .rd0_data(ReadData1), .rd1_data(ReadData2));

multiplexer mux0(.D0(ReadData1), .D1(zero_register), .s(ALUSrc1), .y(alu_input1));
multiplexer mux1(.D0(ReadData2), .D1(alu_input2_instr_src), .s(ALUSrc2), .y(alu_input2));

alu UTT(.a(alu_input1), .b(alu_input2), .s(ALUOp), .f(result), .ovf(ovf), .take_branch(take_branch));

initial begin
clk = 0;

#10 rst = 1;
#10 rst = 0;

#10
RegWrite = 0;
ALUSrc1 = 1;
ALUSrc2 = 1;
ALUOp = 0;
alu_input2_instr_src = 5;

#10
RegWrite = 1;
WriteAddress = 6;
WriteData = result;

#10
RegWrite = 0;
ALUSrc1 = 0;
ALUSrc2 = 1;
ALUOp = 0;
ReadAddress1 = 6;
ReadData1 = 5;
alu_input2_instr_src = 12;

#10
RegWrite = 1;
WriteAddress = 2;
WriteData = result;

#10
RegWrite = 0;
ALUSrc1 = 0;
ALUSrc2 = 1;
ALUOp = 1;
ReadAddress1 = 2;
ReadData1 = 18;

#10
RegWrite = 1;
WriteAddress = 3;
WriteData = result;

#10
RegWrite = 0; 
ALUSrc1 = 0;
ALUSrc2 = 0;
ALUOp = 0;
ReadAddress1 = 6;
ReadAddress2 = 3;
ReadData1 = 5;
ReadData2 = 13;

#10
ALUSrc1 = 1;
ALUSrc2 = 0;
ReadAddress2 = 6;
ReadData2 = 18; 
ALUOp = 2;

#10
rst = 1;
#10
rst = 0;

end

always #10 clk = ~clk;


endmodule
