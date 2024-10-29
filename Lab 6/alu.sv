`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2024 08:25:11 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a,
    input [15:0] b,
    input [3:0] s,
    output var [15:0] f,
    output var ovf,
    output var take_branch
    );
    
    always_comb
    begin
        f = 0;
        take_branch = 0;
        ovf = 0;
    case(s)
        4'b0000: begin
            f = a + b;
            ovf = (a[15]& b[15] & !f[15]) | (!a[15] & !b[15] & f[15]); end
        4'b0001: begin
            f = ~b; end
        4'b0010: begin
            f = a & b; end
        4'b0011: begin
            f = a | b; end
        4'b0100: begin
            f = a >>> b; end
        4'b0101: begin
            f = a << b; end
        4'b0110: begin
            take_branch = (a == 0); end
        4'b0111: begin
            take_branch = (a != 0); end
        4'b1000: begin
            f = a ^ b; end
    endcase
    end
endmodule
