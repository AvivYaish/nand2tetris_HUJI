# nand2tetris_HUJI
HUJI's version of nand2tetris.

This software suite contains many modifications which are unique
to the Hebrew University, for example:
ShiftLeft.hdl, ShiftRight.hdl	- chips that perform shifts
ExtendAlu.hdl, CpuMul.hdl		- ALU & CPU that support shifts

All tools (Assembler, CPUEmulator, VMEmulator, JackCompiler) support shifts.
Assembler, CPUEmulator: 
dest=D<<;jump  // left-shift
dest=D>>;jump  // right-shift
Also works with A, M

VMEmulator: 
shiftleft, shiftright are unary operations that perforn their namesake

JackCompiler:
'^', '#' are unary operators for left and right shifts (respectively)
