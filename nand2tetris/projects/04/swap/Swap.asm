// This file is part of nand2tetris, as taught in The Hebrew University, and 
// was written by Aviv Yaish. It is an extension to the specifications given
// in https://www.nand2tetris.org (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported License: https://creativecommons.org/licenses/by-nc-sa/3.0/

// The program should swap between the max. and min. elements of an array.
// R14 contains the start address of the array, and R15 contains its length.
// You can assume that:
//   - Each array value x is between -16384 < x < 16384.
//   - The address in R14 is at least >= 2048.
//   - R14 + R15 <= 16383. 
// No other assumptions can be made.
// Changing R14, R15 is not allowed.

// Put your code here.