# Project 3: Sequential Logic

The computer's main memory, also called Random Access Memory, or RAM, is an
addressable sequence of n-bit registers, each designed to hold an n-bit value.
In this project you will gradually build a RAM unit.
This involves two main issues:

- How to use gate logic to store bits persistently, over time
- How to use gate logic to locate ("address") the memory register on which we
  wish to operate

## Objective

Build all the chips described in this project, leading up to a RAM16K (RAM) unit.
As before, all template files are provided in a zip given on the course's web
page, in the folder: nand2tetris/projects/03

## Resources

- Projects 1 and 2
- Unit 3 of the lectures and book
- The Hardware Simulator

## Contract

You should implement each gate using the Hardware Description Language (HDL).

For each gate, your implementation should exactly match the logic given in
the gate's .hdl file.

## What To Submit

- You should submit a zip file with the following files:
  two directories named 'a' and 'b', and an AUTHORS file in the root directory
  (not in 'a' or 'b').
  Folder 'a' should contain: Bit.hdl, PC.hdl, RAM8.hdl, RAM64.hdl, Register.hdl.
  Folder 'b' should contain: RAM4K.hdl, RAM16K.hdl and RAM512.hdl.
- If a chip from directory 'a' uses external chips, say X.hdl, these chips
  should be placed in 'a', too. The same goes for directory 'b'. If chips from
  both directories use X.hdl, it should be placed in both.
- You can create & use new chips, but should include them in the submission.
- Include other files required by your project, if there are any.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## Proposed Working Method

We recommend building the chips in the following order:
Bit, Register, RAM8, RAM64, RAM512, RAM4K, RAM16K, PC.

## Correctness, Efficiency, and Code-reuse

Please refer to the notes of project 1 regarding grading metrics.

## Tips

When constructing RAM chips from lower-level RAM chip-parts, for example when
building the RAM512 chip using the RAM64 chip, we recommend using built-in
versions of the latter.

Otherwise, the simulator will recursively generate numerous memory-resident
software objects, one for each one of the many chip parts that make up a typical
RAM unit. This may cause the simulator to run slowly or crash.

To avert this problem, we've partitioned the RAM chips that you have to build in
this project into two sub-directories, named projects/03/a and projects/03/b.
This partition is superficial, and is done with one purpose only: when building
the chips stored in b, the simulator is forced to use built-in implementations
of the lower-level chip parts whose .hdl programs are stored in a but not in b.

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
