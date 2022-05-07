# Project 2: Boolean Arithmetic

The centerpiece of the computer's architecture is the CPU, or Central Processing Unit, and the centerpiece of the CPU is the ALU, or Arithmetic-Logic Unit. In this project you will gradually build a set of chips, culminating in the construction of the ALU chip of the Hack computer. All the chips built in this project are standard, except for the ALU itself, which differs from one computer architecture to another.

## Objective

Build all the chips described in Chapter 2 (see list below), leading up to an Arithmetic Logic Unit -- the Hack computer's ALU. The only building blocks that you can use are the chips described in chapter 1 and the chips that you will gradually build in this project.

## Contract

When loaded into the supplied Hardware Simulator, your chip design (modified .hdl program), tested on the supplied .tst script, should produce the outputs listed in the supplied .cmp file. If that is not the case, the simulator will let you know.

## Resources

See Chapter 2, the HDL Guide (except for A2.4), and the Hack Chip Set.

For each chip, we supply a skeletal .hdl file with a missing implementation part. In addition, for each chip we supply a .tst script that instructs the hardware simulator how to test it, and a .cmp ("compare file") containing the correct output that this test should generate. Your job is to complete and test the supplied skeletal .hdl files.

The tools that you need for this project are the supplied hardware simulator and the files listed above. If you've downloaded the Nand2Tstris Software Suite, these files are stored in your nand2tetris/projects/02 folder.

## Implementation order

We recommend building the chips in the following order:
ShiftLeft, ShiftRight, HalfAdder, FullAdder, Add16, Inc16, ALU-nostat, ALU.
However, since the simulator features built-in versions of these chips, you can use chip-parts without first building them: the simulator will automatically use their built-in implementations.

The Hack ALU produces two kinds of outputs: a "main" 16-bit output resulting from operating on the two 16-bit inputs, and two 1-bit "status outputs" named 'zr' and 'ng'. We recommend building this functionality in two stages. In stage one, implement an ALU that computes and outputs the 16-bit output only, ignoring the 'zr' and 'ng' status outputs. Once you get this implementation right (that is, once your ALU.hdl code passes the ALU-nostat test), extend your code to handle the two status outputs as well. This way, any problems detected by ALU.tst can be attributed to the incremental code that you've added in stage two. We thank Mark Armbrust for proposing this staged implementation plan, and for supplying the test files to support it.

You only need to submit the “full” ALU, no need to submit the partial ALU-nostat implementation.

## Tips

### Correctness, Efficiency, and Code-reuse

See the notes for project 1 regarding correctness, efficiency, and code-reuse.

### Use built-in chips

Your HDL programs will most likely include chip parts that you've built in project 1. As a rule, though, we recommend using the built-in versions of these chips instead. The use of built-in chips ensures correct, efficient, and predictable simulation. There is a simple way to accomplish this convention: make sure that your project directory includes only the .hdl files of the chips developed in the current project.

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

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
