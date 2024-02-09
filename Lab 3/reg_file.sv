`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 08:00:51 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input rst,
    input clk,
    input wr_en,
    input [2:0] rd0_addr,
    input [2:0] rd1_addr,
    input [2:0] wr_addr,
    input [15:0] wr_data,
    output [15:0] rd0_data,
    output [15:0] rd1_data
    );
    
    reg[15:0] register[0:7];
    
    always_ff @(posedge clk) begin
        if(rst) begin
            register[0] <= 0;
            register[1] <= 0;
            register[2] <= 0;
            register[3] <= 0;
            register[4] <= 0;
            register[5] <= 0;
            register[6] <= 0;
            register[7] <= 0;
        end
        else if(wr_en)
            register[wr_addr] <= wr_data;
     end
     
     assign rd0_data = register[rd0_addr];
     assign rd1_data = register[rd1_addr];
        
        
endmodule
