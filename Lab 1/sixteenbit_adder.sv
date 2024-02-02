`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/23/2024 08:06:43 AM
// Design Name: 
// Module Name: sixteenbit_adder
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


module sixteenbit_adder(
    input [15:0] a,
    input [15:0] b,
    output [15:0] f,
    output ovf
    );
    
    assign f = a + b;
    assign ovf = (a[15] & b[15] & !f[15]) | (!a[15] & !b[15] & f[15]); 
endmodule
