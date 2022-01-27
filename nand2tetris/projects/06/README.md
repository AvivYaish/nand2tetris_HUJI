partner1_username, partner2_username

# Project 6: Assembler

## Submitter details

- Partner1FirstName Partner1LastName, ID 011111111, partner1_email@mail.huji.ac.il
- Partner2FirstName Partner2LastName, ID 022222222, partner2_email@mail.huji.ac.il

## Submitted Files

- README.md: This file.
- Assembler: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- Main.py: The project's main .py file.
- Parser.py: Reads an assembly language command, parses it, and provides
  additional relevant functionality.
- Code.py: Translates Hack assembly language mnemonics to binary code.
- SymbolTable.py: Keeps a correspondence between symbolic labels and
  numeric addresses.

## Remarks

- You can change the template however you want, or even not use it at all.
  But, your project should use the same standard installation and running
  procedures, and standard inputs that the template uses.
- You should submit a zip file with the following files:
  A run-file named 'Assembler', a Makefile called "Makefile", a README.md file,
  and the source code for your implementation.
- The submission should not contain any folder.
- The README.md file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## Implementation Details

You should use the two-pass implementation suggested in the book:

### Initialization

Initialize the symbol table with all predefined symbols and their
pre-allocated RAM addresses, according to section 6.2.3 of the book.

### First Pass

Go through the entire assembly program, line by line, and build the symbol
table without generating any code. As you march through the program lines,
keep a running number recording the ROM address into which the current
command will be eventually loaded.

This number starts at 0 and is incremented by 1 whenever a C-instruction
or an A-instruction is encountered, but does not change when a label
pseudo-command or a comment is encountered. Each time a pseudo-command
(Xxx) is encountered, add a new entry to the symbol table, associating
Xxx with the ROM address that will eventually store the next command in
the program.

This pass results in entering all the program’s labels along with their
ROM addresses into the symbol table.

### Second Pass

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

### Tools

Two useful tools are the supplied Assembler and the supplied CPU
Emulator, both available in your tools directory. These tools allow
experimenting with a working assembler before setting out to build one
yourself. In addition, the supplied assembler provides a visual
line-level translation GUI, and allows code comparisons with the outputs
that your assembler will generate.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Testing

The supplied ("built-in") Hack Assembler is guaranteed to generate
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

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
