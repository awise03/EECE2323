`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2024 09:07:35 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
logic [15:0] a;
logic [15:0] b;
logic [3:0] s;
logic [15:0] f;
logic ovf;
logic take_branch;

alu UTT(.a(a), .b(b), .s(s), .f(f), .ovf(ovf), .take_branch(take_branch));

initial begin 

    #100 a = 16'hA415; b = 16'hA555; s = 4'b0000;
    #100 a = 16'h023D; b = 16'h564B; s = 4'b0001;
    #100 a = 16'h21AA; b = 16'hB890; s = 4'b0010;
    #100 a = 16'hE509; b = 16'hD79A; s = 4'b0011;
    #100 a = 16'h00E9; b = 16'h0002; s = 4'b0100;
    #100 a = 16'h017D; b = 16'h017D; s = 4'b0101;
    #100 a = 16'h0001; b = 16'h0000; s = 4'b0110;
    #100 a = 16'h0001; b = 16'h0000; s = 4'b0111;
    #100 a = 16'h81A3; b = 16'h897B; s = 4'b1000;
    #100 a = 16'hED00; b = 16'hEF03; s = 4'b0000;
    
end

endmodule
