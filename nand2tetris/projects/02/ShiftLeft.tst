// This file is part of nand2tetris, as taught in The Hebrew University, and
// was written by Aviv Yaish. It is an extension to the specifications given
// [here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

load ShiftLeft.hdl,
output-file ShiftLeft.out,
compare-to ShiftLeft.cmp,
output-list in%D1.16.1 out%D1.16.1;

set in %B0000000000000000,
eval,
output;

set in %B0000000000011010,
eval,
output;

set in %B1101111111111111,
eval,
output;

set in %B1100101010101010,
eval,
output;

set in %D250,
eval,
output;

set in %D-365,
eval,
output;
