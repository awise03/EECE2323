`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 09:40:35 AM
// Design Name: 
// Module Name: inst_decoder_tb
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


module inst_decoder_tb();

logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite, MemToReg, RegSrc;
logic [6:0]immediate;
logic [5:0]nzimm;
logic [8:0]offset;
logic [3:0]opcode, ALUOp;
logic [15:0]instr_i;

instruction_decoder id(
    .RegWrite(RegWrite),
    .RegDst(RegDst), 
    .ALUSrc1(ALUSrc1),
    .ALUSrc2(ALUSrc2),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .RegSrc(RegSrc),
    .immediate(immediate),
    .nzimm(nzimm),
    .offset(offset),
    .opcode(opcode),
    .ALUOp(ALUOp),
    .instr_i(instr_i)
);

initial begin
    opcode = 4'b0000; immediate = 7'b0000101; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0001; immediate = 7'b0000011; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0010; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0011; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000011;
    #100 opcode = 4'b0100; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0101; immediate = 7'b0000111; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0110; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b0111; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000000;
    #100 opcode = 4'b1000; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000000010;
    #100 opcode = 4'b1001; immediate = 7'b0000000; nzimm = 6'b000000; offset = 9'b000001100;
    #100 opcode = 4'b1010; immediate = 7'b0000000; nzimm = 6'b000010; offset = 9'b000000000;
    #100 opcode = 4'b1011; immediate = 7'b0000000; nzimm = 6'b000110; offset = 9'b000000000;
end
endmodule
