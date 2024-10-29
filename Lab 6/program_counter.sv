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
    output logic [7:0] pc
    );
    
    always @(posedge rst, posedge clk) begin
        if(rst)
            pc <= 0;
        else if(clk)
            pc += 1;
     end
     
endmodule
