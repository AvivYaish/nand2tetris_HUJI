partner1_username, partner2_username

# Project 11: Compilation, Continued

## Submitter details

- Partner1FirstName Partner1LastName, ID 011111111, Partner1Mail@mail.huji.ac.il
- Partner2FirstName Partner2LastName, ID 022222222, Partner2Mail@mail.huji.ac.il

## Submitted Files

- README.md: This file.
- JackCompiler: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- JackCompiler.py: The project's main .py file.
- JackTokenizer.py: Tokenizes an input .jack file according to Jack's grammar.
- CompilationEngine.py: Gets input from a JackTokenizer and emits its parsed
  structure into an output stream.
- VMWriter.py: Writes VM commands into a file. Encapsulates VM command syntax.
- SymbolTable.py: Associates names with information needed for Jack compilation.

## Remarks

- You can change the template however you want, or even not use it at all.
  But, your project should use the same standard installation and running
  procedures, and standard inputs that the template uses.
- You should submit a zip file with the following files:
  A run-file named 'JackCompiler', a Makefile called "Makefile", a README.md file,
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

The proposed implementation is based on morphing the syntax analyzer
built in the previous project into a full-scale compiler. In
particular, we propose to gradually replace the software modules that
generate XML output with software modules that generate VM code. This can
be done in two main development stages, as follows.

### Stage I: Symbol Table

We suggest to start by building the compiler's symbol table module and
using it to extend the syntax analyzer built in project 10. Presently,
whenever an identifier is encountered in the source code, say foo, the
syntax analyzer outputs the XML line "<identifier> foo </identifier>".

Instead, have your analyzer output the following information as part of
its XML output (using some output format of your choice):

- The identifier's name, as done by the current version of the syntax
  analyzer.
- The identifier's category: var, argument, static, field, class, or
  subroutine.
- If the identifier's category is var, argument, static, or field, the
  running index assigned to the identifier by the symbol table.
- Whether the identifier is presently being defined (e.g. the identifier
  stands for a variable declared in a "var" statement) or used.

You may test your symbol table module and the above capability by running
your extended syntax analyzer on the test Jack programs supplied in
project 10. Once the output of your extended syntax analyzer will include
the above information, it means that you have developed a complete
executable capability to understand the grammatical structure of Jack
programs.

At this stage you can make the switch to a full-scale compiler,
and start generating VM code instead of XML output. This can be done by
gradually morphing the code of the extended syntax analyzer into a
full-scale compiler.

### Stage II: Code Generation

Since we gave many translation examples in chapter 11, we don't provide
specific guidelines on how to develop the code generation features of the
compiler. Rather, we provide a set of six application programs, designed
to unit-test these features incrementally.

We strongly suggest to test your compiler on these programs in the given
order:

1. Seven,
2. ConvertToBin,
3. Square,
4. Average,
5. Pong,
6. ComplexArrays.

This way, you will end up building the compiler's code generation
capabilities in stages, according to the unfolding demands of each test
program.

### Testing Method

Normally, when one compiles a program and runs into some problems, one
concludes that the program is at fault. In this project though, the
setting is exactly the opposite: all Jack programs that we supply for
testing purposes are error-free. Therefore, if their compilation yields
any errors, it's the compiler that you have to fix, not the test programs.

For each test program, go through the following routine:

- Compile the program directory using your compiler. This action should
  compile all the .jack files in the directory into corresponding .vm files;
- Inspect the generated .vm files. If there are any visible problems, fix
  your compiler and go to step 1 (remember: all the supplied test programs
  are error-free);
- Test the translated VM program by loading the program directory into
  the supplied VM emulator and executing it using the "no animation" mode.
  Each one of the six test programs contains specific execution guidelines,
  as listed in the submission page; test the program according to these
  guidelines;
- If the test program behaves unexpectedly or some error message is
  displayed by the VM emulator, fix your compiler and go to to step 1.
- Don't forget: we supply you with a "built-in" JackCompiler, you can use
  it and compare your compiler to it.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
