// This file is part of nand2tetris, as taught in The Hebrew University,
// and was written by Aviv Yaish, and is published under the Creative 
// Common Attribution-NonCommercial-ShareAlike 3.0 Unported License 
// https://creativecommons.org/licenses/by-nc-sa/3.0/

load ExtendAlu.hdl,
output-file ExtendAlu.out,
compare-to ExtendAlu.cmp,
output-list x%B1.16.1 y%B1.16.1 instruction%B1.9.1 out%B1.16.1 out%D1.6.1 zr%B1.1.1 ng%B1.1.1;

set x %B0000000000000000,  // x = 0
set y %B1111111111111111;  // y = -1
set instruction %B111101010, // Compute 0
eval,
output;

set instruction %B111111111, // Compute 1
eval,
output;

// Compute -1
set instruction %B111111010,
eval,
output;

// Compute x
set instruction %B111001100,
eval,
output;

// Compute y
set instruction %B111110000,
eval,
output;

// Compute ~x
set instruction %B111001101,
eval,
output;

// Compute ~y
set instruction %B111110001,
eval,
output;

// Compute -x
set instruction %B111001111,
eval,
output;

// Compute -y
set instruction %B111110011,
eval,
output;

// Compute x + 1
set instruction %B111011111,
eval,
output;

// Compute y + 1
set instruction %B111110111,
eval,
output;

// Compute x - 1
set instruction %B111001110,
eval,
output;

// Compute y - 1
set instruction %B111110010,
eval,
output;

// Compute x + y
set instruction %B111000010,
eval,
output;

// Compute x - y
set instruction %B111010011,
eval,
output;

// Compute y - x
set instruction %B111000111,
eval,
output;

// Compute x & y
set instruction %B111000000,
eval,
output;

// Compute x | y
set instruction %B111010101,
eval,
output;

// Compute x>>
set instruction %B010010000,
eval,
output;

// Compute y>>
set instruction %B010000000,
eval,
output;

// Compute x<<
set instruction %B010110000,
eval,
output;

// Compute y<<
set instruction %B010100000,
eval,
output;

set x %B000000000010001,  // x = 17
set y %B000000000000011;  // y =  3

set instruction %B111101010, // Compute 0
eval,
output;

set instruction %B111111111, // Compute 1
eval,
output;

// Compute -1
set instruction %B111111010,
eval,
output;

// Compute x
set instruction %B111001100,
eval,
output;

// Compute y
set instruction %B111110000,
eval,
output;

// Compute ~x
set instruction %B111001101,
eval,
output;

// Compute ~y
set instruction %B111110001,
eval,
output;

// Compute -x
set instruction %B111001111,
eval,
output;

// Compute -y
set instruction %B111110011,
eval,
output;

// Compute x + 1
set instruction %B111011111,
eval,
output;

// Compute y + 1
set instruction %B111110111,
eval,
output;

// Compute x - 1
set instruction %B111001110,
eval,
output;

// Compute y - 1
set instruction %B111110010,
eval,
output;

// Compute x + y
set instruction %B111000010,
eval,
output;

// Compute x - y
set instruction %B111010011,
eval,
output;

// Compute y - x
set instruction %B111000111,
eval,
output;

// Compute x & y
set instruction %B111000000,
eval,
output;

// Compute x | y
set instruction %B111010101,
eval,
output;

// Compute x>>
set instruction %B010010000,
eval,
output;

// Compute y>>
set instruction %B010000000,
eval,
output;

// Compute x<<
set instruction %B010110000,
eval,
output;

// Compute y<<
set instruction %B010100000,
eval,
output;

set x %B1111111111011101,  // x = -35
set y %B1111111111101101;  // y =  -19

set instruction %B111111111, // Compute 1
eval,
output;

// Compute -1
set instruction %B111111010,
eval,
output;

// Compute x
set instruction %B111001100,
eval,
output;

// Compute y
set instruction %B111110000,
eval,
output;

// Compute ~x
set instruction %B111001101,
eval,
output;

// Compute ~y
set instruction %B111110001,
eval,
output;

// Compute -x
set instruction %B111001111,
eval,
output;

// Compute -y
set instruction %B111110011,
eval,
output;

// Compute x + 1
set instruction %B111011111,
eval,
output;

// Compute y + 1
set instruction %B111110111,
eval,
output;

// Compute x - 1
set instruction %B111001110,
eval,
output;

// Compute y - 1
set instruction %B111110010,
eval,
output;

// Compute x + y
set instruction %B111000010,
eval,
output;

// Compute x - y
set instruction %B111010011,
eval,
output;

// Compute y - x
set instruction %B111000111,
eval,
output;

// Compute x & y
set instruction %B111000000,
eval,
output;

// Compute x | y
set instruction %B111010101,
eval,
output;

// Compute x>>
set instruction %B010010000,
eval,
output;

// Compute y>>
set instruction %B010000000,
eval,
output;

// Compute x<<
set instruction %B010110000,
eval,
output;

// Compute y<<
set instruction %B010100000,
eval,
output;