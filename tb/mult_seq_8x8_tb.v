// -----------------------------------------------------------------------------
// File    : mult_seq_8x8_tb.v
// Brief   : Testbench for mult_seq_8x8: two vectors on a 10 ns clock, waveform inspection
// Modules : mult_seq_8x8_tb
// Author  : Bao Zhao
// Created : 2026-04-12
// -----------------------------------------------------------------------------

`timescale 1ns / 1ps

module mult_seq_8x8_tb();

    reg [7:0] multiplier;
    reg [7:0] multiplicand;
    reg start;
    reg clock;
    wire [15:0] product;
    
    mult_seq_8x8 uut (multiplier, multiplicand, start, clock, product);
    always #5 clock = ~clock;
    initial begin
        clock = 1'b0;
        multiplier = 8'b10101010;
        multiplicand = 8'b11111111;
        start = 1'b0;
        #10
        start = 1'b1;
        #10
        start = 1'b0;
        #100
        multiplier = 8'b11111111;
        multiplicand = 8'b11111111;
        start = 1'b1;
        #10
        start = 1'b0;
        #100;
    end
endmodule
