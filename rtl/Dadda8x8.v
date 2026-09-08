`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bao Zhao
// 
// Create Date: 02/17/2026 08:09:07 PM
// Design Name: 
// Module Name: Dadda8x8
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


module Dadda8x8(
    input [7:0] a,
    input [7:0] b,
    output [15:0] prod
    );
    
    // full adder sums and carries
    wire [36:1] Fs, Fc;
    // half adder sums and carries
    wire [8:1] Hs, Hc;
    
    
    // AND gates
    wire [63:0] ands;
    and and00 (ands[0], a[0], b[0]);
    and and01 (ands[1], a[0], b[1]);
    and and02 (ands[2], a[0], b[2]);
    and and03 (ands[3], a[0], b[3]);
    and and04 (ands[4], a[0], b[4]);
    and and05 (ands[5], a[0], b[5]);
    and and06 (ands[6], a[0], b[6]);
    and and07 (ands[7], a[0], b[7]);
    
    and and10 (ands[8], a[1], b[0]);
    and and11 (ands[9], a[1], b[1]);
    and and12 (ands[10], a[1], b[2]);
    and and13 (ands[11], a[1], b[3]);
    and and14 (ands[12], a[1], b[4]);
    and and15 (ands[13], a[1], b[5]);
    and and16 (ands[14], a[1], b[6]);
    and and17 (ands[15], a[1], b[7]);
    
    and and20 (ands[16], a[2], b[0]);
    and and21 (ands[17], a[2], b[1]);
    and and22 (ands[18], a[2], b[2]);
    and and23 (ands[19], a[2], b[3]);
    and and24 (ands[20], a[2], b[4]);
    and and25 (ands[21], a[2], b[5]);
    and and26 (ands[22], a[2], b[6]);
    and and27 (ands[23], a[2], b[7]);
    
    and and30 (ands[24], a[3], b[0]);
    and and31 (ands[25], a[3], b[1]);
    and and32 (ands[26], a[3], b[2]);
    and and33 (ands[27], a[3], b[3]);
    and and34 (ands[28], a[3], b[4]);
    and and35 (ands[29], a[3], b[5]);
    and and36 (ands[30], a[3], b[6]);
    and and37 (ands[31], a[3], b[7]);
    
    and and40 (ands[32], a[4], b[0]);
    and and41 (ands[33], a[4], b[1]);
    and and42 (ands[34], a[4], b[2]);
    and and43 (ands[35], a[4], b[3]);
    and and44 (ands[36], a[4], b[4]);
    and and45 (ands[37], a[4], b[5]);
    and and46 (ands[38], a[4], b[6]);
    and and47 (ands[39], a[4], b[7]);
    
    and and50 (ands[40], a[5], b[0]);
    and and51 (ands[41], a[5], b[1]);
    and and52 (ands[42], a[5], b[2]);
    and and53 (ands[43], a[5], b[3]);
    and and54 (ands[44], a[5], b[4]);
    and and55 (ands[45], a[5], b[5]);
    and and56 (ands[46], a[5], b[6]);
    and and57 (ands[47], a[5], b[7]);
    
    and and60 (ands[48], a[6], b[0]);
    and and61 (ands[49], a[6], b[1]);
    and and62 (ands[50], a[6], b[2]);
    and and63 (ands[51], a[6], b[3]);
    and and64 (ands[52], a[6], b[4]);
    and and65 (ands[53], a[6], b[5]);
    and and66 (ands[54], a[6], b[6]);
    and and67 (ands[55], a[6], b[7]);
    
    and and70 (ands[56], a[7], b[0]);
    and and71 (ands[57], a[7], b[1]);
    and and72 (ands[58], a[7], b[2]);
    and and73 (ands[59], a[7], b[3]);
    and and74 (ands[60], a[7], b[4]);
    and and75 (ands[61], a[7], b[5]);
    and and76 (ands[62], a[7], b[6]);
    and and77 (ands[63], a[7], b[7]);
    
    
    // first stage
    HA H1 (ands[48], ands[41], Hs[1], Hc[1]);
    HA H2 (ands[35], ands[28], Hs[2], Hc[2]);
    HA H3 (ands[36], ands[29], Hs[3], Hc[3]);
    FA F1 (ands[56], ands[49], ands[42], Fs[1], Fc[1]);
    FA F2 (ands[57], ands[50], ands[43], Fs[2], Fc[2]);
    FA F3 (ands[58], ands[51], ands[44], Fs[3], Fc[3]);
    
    
    // second stage
    HA H4 (ands[32], ands[25], Hs[4], Hc[4]);
    HA H5 (ands[19], ands[12], Hs[5], Hc[5]);
    FA F4 (ands[40], ands[33], ands[26], Fs[4], Fc[4]);
    FA F5 (Hs[1], ands[34], ands[27], Fs[5], Fc[5]);
    FA F6 (ands[20], ands[13], ands[6], Fs[6], Fc[6]);
    FA F7 (Hc[1], Fs[1], Hs[2], Fs[7], Fc[7]);
    FA F8 (ands[21], ands[14], ands[7], Fs[8], Fc[8]);
    FA F9 (Fc[1], Hc[2], Fs[2], Fs[9], Fc[9]);
    FA F10 (Hs[3], ands[22], ands[15], Fs[10], Fc[10]);
    FA F11 (Fc[2], Hc[3], Fs[3], Fs[11], Fc[11]);
    FA F12 (ands[37], ands[30], ands[23], Fs[12], Fc[12]);
    FA F13 (Fc[3], ands[59], ands[52], Fs[13], Fc[13]);
    FA F14 (ands[45], ands[38], ands[31], Fs[14], Fc[14]);
    FA F15 (ands[60], ands[53], ands[46], Fs[15], Fc[15]);
    
    // third stage
    HA H6 (ands[24], ands[17], Hs[6], Hc[6]);
    FA F16 (Hs[4], ands[18], ands[11], Fs[16], Fc[16]);
    FA F17 (Hc[4], Fs[4], Hs[5], Fs[17], Fc[17]);
    FA F18 (Fc[4], Hc[5], Fs[5], Fs[18], Fc[18]);
    FA F19 (Fc[5], Fc[6], Fs[7], Fs[19], Fc[19]);
    FA F20 (Fc[7], Fc[8], Fs[9], Fs[20], Fc[20]);
    FA F21 (Fc[9], Fc[10], Fs[11], Fs[21], Fc[21]);
    FA F22 (Fc[11], Fc[12], Fs[13], Fs[22], Fc[22]);
    FA F23 (Fc[13], Fc[14], Fs[15], Fs[23], Fc[23]);
    FA F24 (Fc[15], ands[61], ands[54], Fs[24], Fc[24]);
    
    // fourth stage
    HA H7 (ands[16], ands[9], Hs[7], Hc[7]);
    FA F25 (Hs[6], ands[10], ands[3], Fs[25], Fc[25]);
    FA F26 (Hc[6], Fs[16], ands[4], Fs[26], Fc[26]);
    FA F27 (Fc[16], Fs[17], ands[5], Fs[27], Fc[27]);
    FA F28 (Fc[17], Fs[18], Fs[6], Fs[28], Fc[28]);
    FA F29 (Fc[18], Fs[19], Fs[8], Fs[29], Fc[29]);
    FA F30 (Fc[19], Fs[20], Fs[10], Fs[30], Fc[30]);
    FA F31 (Fc[20], Fs[21], Fs[12], Fs[31], Fc[31]);
    FA F32 (Fc[21], Fs[22], Fs[14], Fs[32], Fc[32]);
    FA F33 (Fc[22], Fs[23], ands[39], Fs[33], Fc[33]);
    FA F34 (Fc[23], Fs[24], ands[47], Fs[34], Fc[34]);
    FA F35 (Fc[24], ands[62], ands[55], Fs[35], Fc[35]);
    
    // ripple-carry adder final stage
    wire [13:1] cout;
    buf buffer(prod[0], ands[0]);
    HA H8 (ands[8], ands[1], prod[1], cout[1]);
    FA F36 (Hs[7], ands[2], cout[1], prod[2], cout[2]);
    FA F37 (Hc[7], Fs[25], cout[2], prod[3], cout[3]);
    FA F38 (Fc[25], Fs[26], cout[3], prod[4], cout[4]);
    FA F39 (Fc[26], Fs[27], cout[4], prod[5], cout[5]);
    FA F40 (Fc[27], Fs[28], cout[5], prod[6], cout[6]);
    FA F41 (Fc[28], Fs[29], cout[6], prod[7], cout[7]);
    FA F42 (Fc[29], Fs[30], cout[7], prod[8], cout[8]);
    FA F43 (Fc[30], Fs[31], cout[8], prod[9], cout[9]);
    FA F44 (Fc[31], Fs[32], cout[9], prod[10], cout[10]);
    FA F45 (Fc[32], Fs[33], cout[10], prod[11], cout[11]);
    FA F46 (Fc[33], Fs[34], cout[11], prod[12], cout[12]);
    FA F47 (Fc[34], Fs[35], cout[12], prod[13], cout[13]);
    FA F48 (Fc[35], ands[63], cout[13], prod[14], prod[15]);

endmodule

module FA(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    
    wire xor1, and1, and2;
    xor (xor1, x, y);
    xor (s, xor1, cin);
    and (and1, xor1, cin);
    and (and2, x, y);
    or (cout, and1, and2);
    
endmodule

module HA(
    input x,
    input y,
    output s,
    output cout
    );
    
    xor (s, x, y);
    and (cout, x, y);
    
endmodule