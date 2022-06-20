# Project 1: Boolean Logic

This project engages you in the construction of a set of basic logic gates.
These gates are the building blocks for the computer that we'll build in this
course!

## Objective

Build all the logic gates given in this project.

## Resources

- Unit 1 of the lectures and book
- Appendices 1-4 of the book
- The Hardware Simulator

## Contract

You should implement each gate using the Hardware Description Language (HDL).

For each gate, your implementation should exactly match the logic given in
the gate's .hdl file.

The only building blocks that you can use in this project are Nand gates and the
composite gates that you will gradually build on top of them.

## What To Submit

- You should submit a zip file with the following files:
  AUTHORS, Not.hdl, And.hdl, Or.hdl, Xor.hdl, Mux.hdl, DMux.hdl, Not16.hdl,
  And16.hdl, Or16.hdl, Mux16.hdl, Or8Way.hdl, Mux4Way16.hdl, Mux8Way16.hdl,
  DMux4Way.hdl, DMux8Way.hdl
- You can create & use new chips, but should include them in the submission.
- The submission should not contain any folder.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## Proposed Working Method

We recommend implementing all the gates in this project in the order in which
they appear in Chapter 1:
Not, And, Or, Xor, Mux, DMux, Not16, And16, Or16, Mux16, Or8Way, Mux4Way16,
Mux8Way16, DMux4Way, DMux8Way.

For each chip, we supply:

- A skeletal .hdl file with a placeholder for a missing implementation part
- A .tst script that instructs the hardware simulator how to test it
- A .cmp file containing the correct output that this test should generate

Your job is to:

- Write an implementation for chip Xxx in Xxx.hdl
- Test your implementation by loading Xxx.tst into the HardwareSimulator
- If you have any errors, fix them and go back to the first step

## Correctness, Efficiency & Code Reuse

When building a chip, the most important part is making sure the chip produces
the correct output for each possible input. The chips that we are building now
form the base of the computer that we will build throughout this course. If one
of your chips produces even a single wrong output, your computer might not work
at all!

Besides making sure our chips work as intended, we also care about their
efficiency: the lower the number of Nand chips your implementation uses,
whether directly or indirectly, the better!

You will not lose points in this assignment if your implementations contain
extra Nand gates, but you still need to know how implement chips as
efficiently as possible, for example using the techniques presented in
Appendix A of the book, or in lecture 1.2 (both in English and Hebrew).

Here is a table of the basic gates, to help you:

| Gate | Minimal number of Nand gates required |
|:----:|:-------------------------------------:|
|  Not |                   1                   |
|  And |                   2                   |
|  Or  |                   3                   |
|  Xor |                   4                   |
|  Mux |                   4                   |
| DMux |                   4                   |

After you've made sure your implementations are both correct and efficient,
make sure that you're reusing your code: if you want to use a previously
implemented chip X in the implementation of chip Y, don't re-implement X in the
HDL of Y.

Also, if two chips share a substantial amount of logic, it might be
wise to outsource that logic to a new chip.

## Tips

### Use All Resources Given To You

The relevant lectures and book chapters contain in-depth explanations and heavy
hints for almost every part of this project! Let's go over some examples.

The only building blocks that you can use in this project are primitive Nand
gates and the composite gates that you will gradually build on top of them.
If you already forgot (we're all human!), we learned about the Nand gate in
Unit 1.3 of the English lectures, and Unit 1.4 of the Hebrew lectures.

To write the chips for this project, you will have to use the Hardware
Descriptive Language, or HDL, in short. We learned about this language in Unit
1.4 of the English lectures, Unit 1.6 of the Hebrew lectures, and Appendix 2 in
the book.

To test your implementations, you will have to use the supplied Hardware
Simulator, which is given in the folder nand2tet/tools.
We show how to use the tool in Unit 1.5 of the English lectures and
in Units 1.7 and 1.8 of the Hebrew lectures.

If you use Windows, to start it you should simply double-click the file called
HardwareSimulator.bat.
If you use MacOS or Linux, we provide installation details in the file
nand2tet/tools/README.md.

Note:
In order to use the nand2tetris software tools, your computer must be equipped
with a Java Run-time Environment. The JRE can be downloaded freely from many
sites, including [here](http://java.com/en/download/index.jsp).
For best performance, download the latest available version.

### Built-in Chips

The Nand gate is considered a “primitive” gate and thus there is no need to
implement it: whenever a Nand gate is encountered in your HDL code, the
simulator automatically invokes the built-in tools/builtInChips/Nand.hdl
implementation.

Note that the supplied hardware simulator features built-in implementations of
all these chips. Therefore, you can use any one of these chips before
implementing it: the simulator will automatically invoke their built-in
versions.

For example, consider the supplied skeletal Mux.hdl program. Suppose that for
one reason or another you did not complete the implementation of Mux, but you
still want to use Mux chips as internal parts in other chip designs. You can
easily do so, thanks to the following convention.

If the simulator fails to find a Mux.hdl file in the current directory, it
automatically invokes the built-in Mux implementation, which is part of the
supplied simulator's environment.

This built-in Mux implementation has the same interface and functionality as
those of the Mux chip described in the book. Thus, if you want the simulator to
ignore one or more of your chip implementations, rename the corresponding
chipName.hdl file, or remove it from the directory.

When you are ready to develop this chip in HDL, put the file chipName.hdl back
in the directory, and proceed to edit it with your HDL code.

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
