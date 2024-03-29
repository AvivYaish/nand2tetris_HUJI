# Project 6: Assembler

Low-level machine programs are rarely written by humans. Typically, they are
generated by compilers. Yet humans can inspect the translated code and learn
important lessons about how to write their high-level programs better, in a way
that avoids low-level pitfalls and exploits the underlying hardware better.

One of the key players in this translation process is the assembler, which is a
program designed to translate code written in a symbolic machine language into
code written in binary machine language.

This project marks an exciting landmark in our Nand to Tetris odyssey: it
deals with building the first rung up the software hierarchy, which will
eventually end up in the construction of a compiler for a Java-like high-level
language.

## Objective

Write an Assembler program that translates programs written in the symbolic
Hack assembly language into binary code that can execute on the Hack hardware
platform built in the previous projects.

## Resources

- Unit 6 of the lectures and book
- The built-in Assembler
- The Assembler's tutorial

## Contract

There are three ways to describe the desired behavior of your assembler:

1. When loaded into your assembler, a Prog.asm file containing a valid Hack
   assembly language program should be translated into the correct Hack binary 
   code and stored in a Prog.hack file.
2. The output produced by your assembler must be identical to the output
   produced by the Assembler supplied with the Nand2Tetris Software Suite.
3. Your assembler must implement the translation specification given in
   Chapter 6, Section 2.

## What To Submit

- You should submit a zip file with the following files:
  A run-file named 'Assembler', a Makefile called "Makefile", an AUTHORS file,
  and the source code for your implementation.
- The submission should not contain any folder.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.
- You can change the template however you want, or even not use it at all.
  But, your project should use the same standard installation and running
  procedures, and standard inputs that the template uses.

## Usage

Your project should use the same standard installation, running procedures,
and inputs that the supplied Python template uses. Note that the
template already implements the following behavior, so everything is already
taken care of for anyone who uses the template!

### Installation

Your project has to include a makefile called "Makefile". A makefile is an
automated installation recipe that is executed by running the ``make`` command.
The command should run successfully, and afterwards your project should be
ready for execution (for example, code files should be compiled and run-files
should have execution permissions).

The Python template given to you contains a makefile that should work for all
python projects.

Note that the ``make`` command does not work on Windows.
For more info regarding makefiles, refer to the sample Makefile for Python, the
make manual, or to one of the many 'make' tutorials available online.

### Running

You should include a run-file named ``Assembler`` which accepts a single input
parameter (that we will describe soon).
After calling ``make``, your project should execute by calling the run-file, and
the run-file should exit successfully.

The python template given to you contains a run-file that runs the template's
main function. Note that this file does not work on Windows.

### Input Parameter

The run-file should accept a single input parameter, which corresponds to a path
to either some valid .asm file, or a folder.

1. If a path to a single .asm file is given as an input, you should create the
   relevant output in the same folder as the input.
   For example, when running:
   ```console
   Assembler <path>/file.asm
   ```
   The following output file should be created: ``<path>/file.hack``
2. If the input is a directory, you should translate all .asm files present in
   the directory (ignore other file types and subdirectories) and store the 
   output .hack files in the same directory.
   For example, assume '~/nand/dir/' is a path to a directory which contains
   two files: "t1.asm" and "t2.asm".
   If we execute:
   ```console
   Assembler ~/nand/dir/
   ```
   The outputs ``t1.hack`` and ``t2.hack`` should be created in ``~/nand/dir/``.
   The same behavior applies to the following execution:
   ```console
   Assembler ~/nand/dir
   ```
3. Your program should support both relative and absolute paths. 

The Python template given to you contains code that handles such input
parameters, and creates the corresponding output files in the correct paths.

## Implementation Details

You should use the implementation suggested in the book, which has three steps.

### 1. Initialization

Initialize the symbol table with all predefined symbols and their
pre-allocated RAM addresses, according to section 6.2.3 of the book.

### 2. First Pass

Go through the entire assembly program, line by line, and build the symbol
table without generating any code. As you march through the program lines,
keep a running number recording the ROM address into which the current
command will be eventually loaded.

This number starts at 0 and is incremented by 1 whenever a C-instruction
or an A-instruction is encountered, but does not change when a label
pseudo-command or a comment is encountered.
Comments are defined to start with two slashes (//) and end at the end
of the line. Comments can appear either on "standalone" lines (e.g. a
line which only contains a comment) or on the same line of valid command,
where the comment starts only after the command (e.g. ``A=1 // Comment``).
Each time a pseudo-command (Xxx) is encountered, add a new entry to the
symbol table, associating Xxx with the ROM address that will eventually
store the next command in the program.

This pass results in entering all the program’s labels along with their
ROM addresses into the symbol table.

### 3. Second Pass

The program’s variables are handled in the second pass.
Now, we go again through the entire program, and parse each line like so:

- Each time a symbolic A-instruction is encountered, namely, "@Xxx" where Xxx
  is a symbol and not a number, look up Xxx in the symbol table.
  - If the symbol is found in the table, replace it with its numeric
    meaning and complete the command’s translation.
  - If the symbol is not found in the table, then it must represent a new
    variable. To handle it, add the pair (Xxx,n) to the symbol table,
    where n is the next available RAM address, and complete the command’s
    translation.
  - The allocated RAM addresses are consecutive numbers, starting at
    address 16 (just after the addresses allocated to the predefined
    symbols).
- After the command is translated, write the translation to the output file.

### Submission Template

We provide a template for this project, which contains boilerplate code for the
previously described implementation. It contains the following files:

- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- Assembler: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Main.py: The project's main .py file.
- Parser.py: Reads an assembly-language command, parses it, and provides
  additional relevant functionality.
- Code.py: Translates Hack assembly-language mnemonics to binary code.
- SymbolTable.py: Keeps a correspondence between symbolic labels and
  numeric addresses.

## Tips

### Tools

Two useful tools are the supplied Assembler and the supplied CPU
Emulator, both available in your tools directory. These tools allow
experimenting with a working assembler before setting out to build one
yourself. In addition, the supplied assembler provides a visual
line-level translation GUI, and allows code comparisons with the outputs
that your assembler will generate.

![The built-in Assembler.](AssemblerOnePicTutorial.png)

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Testing

The supplied (“built-in”) Hack Assembler is guaranteed to generate
correct binary code. This guaranteed performance can be used to test if
another assembler, say the one written by you, also generates correct code.

Let Prog.asm be some program written in the symbolic Hack assembly
language. Suppose we translate this program using the supplied assembler,
producing a binary file called Prog.hack. Next, we use another assembler
(e.g. the one that you wrote) to translate the same program into another
file, say MyProg.hack. Now, if the latter assembler is working correctly,
it follows that Prog.hack == MyProg.hack.

Thus, one way to test a newly written assembler is as follows:

1. Load into the supplied visual assembler Prog.asm as a source program
   and MyProg.hack as a compare file,
2. Translate the source program, and
3. Compare the resulting binary code with the compare file. If the
   comparison fails, the assembler that generated MyProg.hack must be buggy;
   otherwise, it may be OK.

### Test Programs

We supply you with multiple test programs, each slightly more complex than the
former.

- Add.asm adds up the constants 2 and 3 and puts the result in R0.
- Max.asm computes max(R0,R1) and puts the result in R2.
- Rect.asm draws a rectangle at the top-left corner of the screen.
  The rectangle is 16 pixels wide and R0 pixels high.
- Pong.asm is a single-player Pong game.
  A ball bounces off the screen's "walls".
  The player attempts to hit the ball with a paddle by pressing the left and right arrow keyboard keys.
  For each successful hit, the player gains one point and the paddle shrinks a
  little, to make the game slightly more challenging.
  If the player misses the ball, the game is over.
  To quit the game, press the ESC key.

Each test program except the first one comes in two versions:

- Prog.asm is an assembly program
- ProgL.asm is the very same program, where each symbol is replaced with an
  explicit memory address

The Pong program supplied above deserves more attention than the others.
It was written in the Java-like high-level Jack language and translated into
the Hack assembly language by the Jack compiler (Jack and the Jack compiler are
described in Chapter 9 and in Chapters 10-11, respectively).

Although the original Jack program is only about 300 lines of Jack code, the
executable Pong code is naturally much longer. Running this interactive program
in the supplied CPU Emulator is a slow affair, so don't expect a high-powered
Pong game.

This slowness is actually a virtue, since it enables your eye to track the
graphical behavior of the program. And don't worry! as we continue to build the
software platform in the next few projects, Pong and and other games will run
much faster.

### Possible Commands

To help you, we will now provide you with tables that summarize the commands
which your Assembler should support.

### Labels and Symbols

A label can be defined only once and can be used anywhere in the assembly
program, even before the line in which it is defined.
A user-defined symbol can be any sequence of letters, digits, underscore (_),
dot (.), dollar sign ($), and colon (:) that does not begin with a digit.
User-defined labels and variable names are case sensitive.

#### Standard C Command Specification

A standard c-command `dest = comp; jump` is translated into the following
HACK command: `1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3`, where each
bit is defined like so:

- Three left-most bits: `111`
- Then, the `a` bit, which chooses whether to pass the Aregister's output
  (`a = 0`) or the `inM` input (`a = 1`) to the `y` input of
  the ALU.
- Then, bits `c1 c2 c3 c4 c5 c6` which correspond to the
  `zx nx zy ny f no` input bits of the ALU.
- Then, the destination of the calculation is defined by bits
  `d1 d2 d3`, where `d1` corresponds to the Aregister,
  `d2` to the Dregister, and `d3` to Memory.
- Finally, the CPU will jump according to `j1 j2 j3`,
  where `j1` corresponds to jumping if `comp < 0`,
  similarly `j2` corresponds to jumping if `comp = 0`,
  and `j3` corresponds to jumping if `comp > 0`.

Or, in tabular form:

| comp (when a=0) | c1  | c2  | c3  | c4  | c5  | c6  | comp (when a=1) |
| --------------: | :-: | :-: | :-: | :-: | :-: | :-: | :-------------- |
|             `0` |  1  |  0  |  1  |  0  |  1  |  0  |                 |
|             `1` |  1  |  1  |  1  |  1  |  1  |  1  |                 |
|            `-1` |  1  |  1  |  1  |  0  |  1  |  0  |                 |
|             `D` |  0  |  0  |  1  |  1  |  0  |  0  |                 |
|             `A` |  1  |  1  |  0  |  0  |  0  |  0  | `M`             |
|            `!D` |  0  |  0  |  1  |  1  |  0  |  1  |                 |
|            `!A` |  1  |  1  |  0  |  0  |  0  |  1  | `!M`            |
|            `-D` |  0  |  0  |  1  |  1  |  1  |  1  |                 |
|            `-A` |  1  |  1  |  0  |  0  |  1  |  1  | `-M`            |
|           `D+1` |  0  |  1  |  1  |  1  |  1  |  1  |                 |
|           `A+1` |  1  |  1  |  0  |  1  |  1  |  1  | `M+1`           |
|           `D-1` |  0  |  0  |  1  |  1  |  1  |  0  |                 |
|           `A-1` |  1  |  1  |  0  |  0  |  1  |  0  | `M-1`           |
|           `D+A` |  0  |  0  |  0  |  0  |  1  |  0  | `D+M`           |
|           `D-A` |  0  |  1  |  0  |  0  |  1  |  1  | `D-M`           |
|           `A-D` |  0  |  0  |  0  |  1  |  1  |  1  | `M-D`           |
|           `D&A` |  0  |  0  |  0  |  0  |  0  |  0  | `D&M`           |
|          `D\|A` |  0  |  1  |  0  |  1  |  0  |  1  | `D\|M`          |

| d1d2d3 | Mnemonic | Destination (where to store the computed value) |
| :----: | :------- | :---------------------------------------------- |
|  000   | null     | The value is not stored anywhere                |
|  001   | M        | Memory[A] (memory register addressed by A)      |
|  010   | D        | D register                                      |
|  011   | MD       | Memory[A] and D register                        |
|  100   | A        | A register                                      |
|  101   | AM       | A register and Memory[A]                        |
|  110   | AD       | A register and D register                       |
|  111   | AMD      | A register, Memory[A], and D register           |

| j1j2j3 | Mnemonic | Effect              |
| :----: | :------- | :------------------ |
|  000   | null     | No jump             |
|  001   | JGT      | If `out > 0`, jump  |
|  010   | JEQ      | If `out = 0`, jump  |
|  011   | JGE      | If `out >= 0`, jump |
|  100   | JLT      | If `out < 0`, jump  |
|  101   | JNE      | If `out != 0`, jump |
|  110   | JLE      | If `out <= 0`, jump |
|  111   | JMP      | Jump                |

#### Extended C Command Specification

The ``dest`` and ``jump`` fields of the following extended commands can take
the same values as standard c-commands.

| Instruction     | 15  | 14  | 13  |  a  | c1  | c2  | c3  | c4  | c5  | c6  |
| --------------- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| dest=`A<<`;jump |  1  |  0  |  1  |  0  |  1  |  0  |  0  |  0  |  0  |  0  |
| dest=`D<<`;jump |  1  |  0  |  1  |  0  |  1  |  1  |  0  |  0  |  0  |  0  |
| dest=`M<<`;jump |  1  |  0  |  1  |  1  |  1  |  0  |  0  |  0  |  0  |  0  |
| dest=`A>>`;jump |  1  |  0  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
| dest=`D>>`;jump |  1  |  0  |  1  |  0  |  0  |  1  |  0  |  0  |  0  |  0  |
| dest=`M>>`;jump |  1  |  0  |  1  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |

### Input Files

You can assume you will only receive valid .asm files as inputs.
Some notes regarding validity:

- All assembly mnemonics must be written in uppercase.
- Constants must be non-negative and are written in decimal notation.
- Some commands can be written in multiple ways, all of which are valid. For 
  example: `D=A+D` and `D=D+A` are both valid and perform the same operation.
  For simplicity's sake, you are allowed to support only the commands as they
  appear in the previous tables.
- All kinds of whitespaces are considered to be valid, for example: 
  - ``   D =    D+    1   ``
  - Empty lines
  - Lines containing just spaces and tabs
  - Etc'
- Commands can't span multiple lines. So, `D = ` on one line and `D + 1` on the
  next line isn't possible.


## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
