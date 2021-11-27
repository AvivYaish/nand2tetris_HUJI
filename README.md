# nand2tetris_HUJI
HUJI's version of nand2tetris / nand2tet / From Nand to Tetris / etc.

See [**`NAND2TET-1-Dark`**](https://github.com/AvivYaish/NAND2TET-1-Dark) for nice dark themes for the editor of your choice.

This software suite contains many modifications which are unique to the Hebrew University, for example:
- ShiftLeft.hdl, ShiftRight.hdl	- chips that perform shifts
- ExtendAlu.hdl, CpuMul.hdl		- ALU & CPU that support shifts
- Memory.jack - has an additional method to make sure students follow the correct specification for alloc.
- All tools (Assembler, CPUEmulator, VMEmulator, JackCompiler) support shifts.

### Assembler, CPUEmulator:
- dest=D<<;jump  // left-shift
- dest=D>>;jump  // right-shift
- Both also work with A, M

### VMEmulator: 
- shiftleft, shiftright are unary operations that perforn their namesake

### JackCompiler:
- '^', '#' are unary operators for left and right shifts (respectively)
