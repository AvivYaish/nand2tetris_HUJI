// This file is part of nand2tetris, as taught in The Hebrew University,
// and was written by Aviv Yaish, and is published under the Creative 
// Common Attribution-NonCommercial-ShareAlike 3.0 Unported License 
// https://creativecommons.org/licenses/by-nc-sa/3.0/

load Sort.asm,
output-file Sort.out,
compare-to Sort.cmp,
output-list RAM[14]%D3.6.3 RAM[15]%D3.6.3 RAM[2048]%D3.6.3 RAM[2049]%D3.6.3 RAM[2050]%D3.6.3 RAM[2051]%D3.6.3;

set PC 0,
set RAM[2048] 0,
set RAM[2049] 0,
set RAM[2050] 0,
set RAM[2051] 0,
set RAM[14] 2048,
set RAM[15] 1;
repeat 30000 {
  ticktock;
}
output;

set PC 0,
set RAM[2048] -89,
set RAM[2049] 5,
set RAM[2050] 16,
set RAM[2051] 15,
set RAM[14] 2048,
set RAM[15] 4;
repeat 30000 {
  ticktock;
}
output;