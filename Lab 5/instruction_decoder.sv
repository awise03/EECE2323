`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 08:35:35 AM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input logic [6:0] immediate,
    input logic [5:0] nzimm,
    input logic [8:0] offset,
    input logic [3:0] opcode,
    output logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite, MemToReg, RegSrc,
    output logic [15:0] instr_i,
    output logic [3:0] ALUOp
    );
    
    always @(opcode) begin
        case(opcode) 
            4'b0000: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 0;
                MemWrite = 0;
                MemToReg = 1;
                RegSrc = 0;
            end
            
            4'b0001: begin
                RegWrite = 0;
                RegDst = 0;
                instr_i = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 0;
                MemWrite = 1;
                MemToReg = 0;
                RegSrc = 0;
            end
            
            4'b0010: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'bx;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 0;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
             4'b0011: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = nzimm;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 0;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
             4'b0100: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'bx;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0010;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
             4'b0101: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = immediate;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0010;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
             4'b0110: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'bx;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b0011;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
             4'b0111: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = 16'bx;
                ALUSrc1 = 0;
                ALUSrc2 = 0;
                ALUOp = 4'b1000;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
            4'b1000: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = nzimm;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0100;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
            4'b1001: begin
                RegWrite = 1;
                RegDst = 1;
                instr_i = nzimm;
                ALUSrc1 = 0;
                ALUSrc2 = 1;
                ALUOp = 4'b0101;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 1;
            end 
            4'b1010: begin
                RegWrite = 0;
                RegDst = 0;
                instr_i = offset;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b0110;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 0;
            end 
            4'b1011: begin
                RegWrite = 0;
                RegDst = 0;
                instr_i = offset;
                ALUSrc1 = 1;
                ALUSrc2 = 0;
                ALUOp = 4'b0111;
                MemWrite = 0;
                MemToReg = 0;
                RegSrc = 0;
            end 
        endcase
    end  
endmodule
