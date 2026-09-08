`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2026 08:04:09 PM
// Design Name: 
// Module Name: mult_seq_8x8
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


module mult_seq_8x8(
    input [7:0] multiplier,
    input [7:0] multiplicand,
    input start,
    input clock,
    output reg [15:0] product
    );
    
    reg [7:0] plier;
    reg [15:0] plicand;
    reg [3:0] counter;
    reg busy;
    
    always @(posedge clock) begin
        if (start == 1'b1) begin
            product <= 16'd0;
            counter <= 4'd0;
            plier <= multiplier;
            plicand <= {8'd0, multiplicand};
            busy <= 1'b1;
        end
        else if (busy) begin
            if (plier[0] == 1'b1) begin
                product <= product + plicand;
            end

            plicand <= plicand << 1;
            plier <= plier >> 1;
            counter <= counter + 1'b1;

            if (counter == 4'd7) begin
                busy <= 1'b0;
            end
        end
            
    end
endmodule
