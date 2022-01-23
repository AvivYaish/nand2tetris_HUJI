// This file is part of nand2tetris, as taught in The Hebrew University, and
// was written by Aviv Yaish. It is an extension to the specifications given
// [here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

load Swap.asm,
output-file Swap.out,
compare-to Swap.cmp,
output-list RAM[14]%D3.6.3 RAM[15]%D3.6.3 RAM[2048]%D3.6.3 RAM[2049]%D3.6.3;

set PC 0,
set RAM[2048] 0,
set RAM[2049] 0,
set RAM[14] 2048,
set RAM[15] 1;
repeat 30000 {
  ticktock;
}
output;

set PC 0,
set RAM[2048] -1,
set RAM[2049] 1,
set RAM[14] 2048,
set RAM[15] 2;
repeat 30000 {
  ticktock;
}
output;