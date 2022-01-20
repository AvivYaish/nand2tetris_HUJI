# nand2tetris_HUJI

HUJI's version of nand2tetris / nand2tet / From Nand to Tetris / etc.

![moodle](https://user-images.githubusercontent.com/12000894/145035709-14de1143-0033-4176-9739-d95c95cc76d4.jpg)

See [**`NAND2TET-1-Dark`**](https://github.com/AvivYaish/NAND2TET-1-Dark) for
nice dark themes for the editor of your choice.

This software suite contains many modifications which are unique to the Hebrew
University, for example:

- All tools (Assembler, CPUEmulator, VMEmulator, JackCompiler) support shifts.
- ShiftLeft.hdl, ShiftRight.hdl: chips that perform shifts.
- ExtendAlu.hdl, CpuMul.hdl: ALU & CPU that support shifts.
- Memory.jack: has an additional method to make sure students follow the correct
  specification for alloc.
- All programming projects have python template code with types, documentation,
  and additional guidance.

## Assembler, CPUEmulator

- `dest=D<<;jump  // left-shift`
- `dest=D>>;jump  // right-shift`
- Both also work with A, M.

## VMEmulator

- `shiftleft`, `shiftright` are unary operations that perform their namesake.

## JackCompiler

- `^`, `#` are unary operators for left and right shifts (respectively).

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
