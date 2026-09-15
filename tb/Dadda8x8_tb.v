// -----------------------------------------------------------------------------
// File    : Dadda8x8_tb.v
// Brief   : Directed testbench for Dadda8x8: six vectors, products printed with $display
// Modules : Dadda8x8_tb
// Author  : Bao Zhao
// Created : 2026-02-17
// -----------------------------------------------------------------------------

module Dadda8x8_tb();
    
    reg [7:0] a, b;
    wire [15:0] prod;
    
    Dadda8x8 uut (a, b, prod);
    initial begin
        // 0 * 0
        a = 8'b00000000;
        b = 8'b00000000;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
        
        // 255 * 255
        a = 8'b11111111;
        b = 8'b11111111;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
        
        // 85 * 0
        a = 8'b01010101;
        b = 8'b00000000;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
        
        // 8 * 94
        a = 8'b00001000;
        b = 8'b01011110;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
        
        // 10 * 15
        a = 8'b00001010;
        b = 8'b00001111;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
        
        // 7 * 27
        a = 8'b00000111;
        b = 8'b00011011;
        #10 $display("A: %b B: %b Product: %b", a, b, prod);
 
    end

endmodule