`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 08:24:09 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk, rst,
    input logic take_branch,
    input [8:0] offset, 
    output logic [8:0] pc
    );
    
    always @(posedge rst, posedge clk) begin
        if(rst)
            pc <= 0;
        else if(take_branch)
            pc += offset;
        else
            pc += 1;
     end
     
endmodule
