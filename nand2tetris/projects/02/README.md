# Project 2: Boolean Arithmetic

The centerpiece of the computer's architecture is the Central Processing Unit,
or the CPU, and the centerpiece of the CPU is the Arithmetic-Logic Unit, also
known as the ALU.

In this project you will gradually build a set of chips, culminating in the
construction of the ALU chip of the Hack computer. All the chips we will build
are standard, except for the ALU itself, which differs from one computer
architecture to another.

## Objective

Build all the chips given in this project, leading up to the Hack computer's ALU.

## Resources

- Project 1
- Unit 2 of the lectures and book
- The Hardware Simulator

## Contract

You should implement each gate using the Hardware Description Language (HDL).

For each gate, your implementation should exactly match the logic given in
the gate's .hdl file.

The only building blocks that you can use are the Nand chip, the chips described
in chapter 1 and the chips that you will gradually build in this project.

## What To Submit

- You should submit a zip file with the following files:
  AUTHORS, ShiftLeft.hdl, ShiftRight.hdl, HalfAdder.hdl, FullAdder.hdl,
  Add16.hdl, Inc16.hdl, ALU.hdl.
- If you use chips that you were required to build in the previous exercise
  (for example: Not, And, Or, Xor, etc'), you should not include them in the
  current submission.
- On the other hand, if you have created original chips for the previous
  exercise and would like to use them again, you should include them.
- You can create & use new chips, but should include them in the submission.
- Include other files required by your project, if there are any.
- The submission should not contain any folder.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## Implementation Order

We recommend building the chips in the following order:
ShiftLeft, ShiftRight, HalfAdder, FullAdder, Add16, Inc16, ALU.

However, since the simulator features built-in versions of these chips, you can
use chips without building them beforehand: the simulator will automatically use
their built-in implementations.

### ALU Implementation Order

The Hack ALU produces two kinds of outputs: a “main” 16-bit output resulting
from operating on the two 16-bit inputs, and two 1-bit “status outputs” named
'zr' and 'ng'.

We recommend building this functionality in two stages:

- In the first stage, implement an ALU that computes and outputs the 16-bit
  output only, ignoring the 'zr' and 'ng' status outputs. This stage is tested
  by the ALU-nostat test.
- Once you get this implementation right (that is, once your ALU.hdl code passes
  the ALU-nostat test), extend your code to handle the two status outputs as
  well. This stage is tested by the ALU.tst test.

This way, any problems detected by ALU.tst can be attributed to the incremental
code that you've added in stage two. We thank Mark Armbrust for proposing this
staged implementation plan, and for supplying the test files to support it.

## Correctness, Efficiency, and Code-reuse

See the notes for project 1 regarding correctness, efficiency, and code-reuse.

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
