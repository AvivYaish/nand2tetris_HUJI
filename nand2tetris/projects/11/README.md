# Project 11: Compilation, Continued

In this project we complete the construction of the Jack Compiler that we
started building in the previous project.

## Objective

Extend the JackAnalyzer from the previous project to a full compiler which emits
VM code, instead of XML code.

## Resources

- Unit 11 of the lectures and book
- Unit 10 of the lectures and book
- The built-in JackCompiler
- The built-in VMEmulator
- The VMEmulator's tutorial

## Contract

Given a valid Jack file, the output of the JackCompiler should be valid VM code
which corresponds to the input Jack file and is designed to run on the virtual
machine implemented in projects 7-8.

## What To Submit

- You should submit a zip file with the following files:
  A run-file named “JackCompiler”, a Makefile called “Makefile”, an AUTHORS file,
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

Your project should use the same standard installationת running procedures,
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

You should include a run-file named ``JackCompiler`` which accepts a single input
parameter (that we will describe soon).
After calling ``make``, your project should execute by calling the run-file, and
the run-file should exit successfully.

The python template given to you contains a run-file that runs the template's
main function. Note that this file does not work on Windows.

### Input Parameter

The run-file should accept a single input parameter, which corresponds to a path
to either some valid .jack file, or a folder.

1. If a path to a single .jack file is given as an input, you should create the
   relevant output in the same folder as the input.
   For example, when running:
   ```console
   JackCompiler <path>/file.jack
   ```
   The following output file should be created: ``<path>/file.vm``
2. If the input is a directory, you should translate all .jack files present in
   the directory (ignore other file types and subdirectories) and store the
   output .vm files in the same directory.
   For example, assume '~/nand/dir/' is a path to a directory which contains
   two files: "t1.jack" and "t2.jack".
   If we execute:
   ```console
   JackCompiler ~/nand/dir/
   ```
   The outputs ``t1.vm`` and ``t2.vm`` should be created in ``~/nand/dir/``.
   The same behavior applies to the following execution:
   ```console
   JackCompiler ~/nand/dir
   ```
3. Your program should support both relative and absolute paths. 

The Python template given to you contains code that handles such input
parameters, and creates the corresponding output files in the correct paths.

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
syntax analyzer outputs the XML line `<identifier> foo </identifier>`.

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

### Submission Template

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

## Tips

### The Built-in JackCompiler

We supply you with a built-in JackCompiler which produces valid .vm code when
given Jack programs as input.

The built-in compiler is a command-line program that is supplied together with
the rest of the software-suite (e.g. HardwareSimulator, CPUEmulator, etc').

When you open your command-line at the same directory of the built-in
JackCompiler's executable file (``nand2tetris/tools/``), you can execite the
compiler like so:

- Compile a single file which is located in ``<path>\File.jack``:

  ```console
  JackCompiler <path>\File.jack
  Compiling "<path>\File.jack"
  ```

- Compile all .jack files contained in a directory ``<path>\directory``:

  ```console
  JackCompiler <path>\directory
  Compiling "<path>\directory"
  ```

Your generated VM code does not have to be identical to the one produced by the
built-in compiler, but comparing yourselves to the built-in compiler can
definitely help.

### Possible Inputs and Outputs

Refer to project 10's notes regarding possible inputs and corresponding outputs.
You can assume Jack code can only contain user-visible characters from Jack's
character set, specifically characters 32-126. You can find this character set
in Appendix 5 of the book.

### Tests

- Seven
  - Purpose: tests how your compiler handles a simple program containing three
    things: an arithmetic expression with integer constants (without variables),
    a ``do`` statement, and a ``return`` statement.
  - Description: computes the value of the expression ``(3*2)+1`` and prints the
    result at the top left of the screen.
    To test if your compiler has translated the program correctly, run the
    translated code in the supplied VMEmulator and make sure that it displays
    ``7`` correctly.
- ConvertToBin
  - Purpose: tests how your compiler handles all the procedural elements of the
    Jack language, i.e.expressions, functions, and all the language statements.
    The program does not test the handling of methods, constructors, arrays,
    strings, static variables and field variables.
  - Description: unpacks a 16-bit number into its binary representation.
    The program takes the 16-bit value stored in ``RAM[8000]`` and stores its
    individual bits in ``RAM[8001..8016]`` (each location will contain ``0`` or
    ``1``).
    Before the conversion starts, the program initializes ``RAM[8001...8016]``
    to ``-1``. To test if your compiler has translated the program correctly,
    load the translated code into the supplied VMEmulator and go through the
    following routine:
    - Put (interactively) some value in ``RAM[8000]``;
    - Run the program for a few seconds, then stop its execution
    - Check (interactively) that ``RAM[8001...8016]`` contain the correct
      results, and that none of them contains ``-1``.
- Square
  - Purpose: tests how your compiler handles the object oriented constructs of
    the Jack language: constructors, methods, fields and expressions that
    include method calls.
    The program does not test the handling of static variables.
  - Description: a simple interactive app, described in detail in project 9.
    Enables moving a graphical square around the screen using the keyboard's
    four arrow keys.
    While moving, the size of the square can be increased / decreased by
    pressing the ``z`` and ``x`` keys, respectively. To quit the app, press the
    ``q`` key.
    To test if your compiler has translated the source code correctly, run the
    translated code in the supplied VMEmulator and make sure that it works
    according to the above description.
- Average
  - Purpose: tests how your compiler handles arrays and strings.
  - Description: computes the average of a user-supplied sequence of integers.
    To test if your compiler has translated the program correctly, run the
    translated code in the supplied VMEmulator and follow the instructions
    displayed on the screen.
- Pong
  - Purpose: provides a complete test of how your compiler handles objects and
    static variables.
  - Description: in this classical game, a ball is moving randomly, bouncing off
    the screen "walls". The user can move a small paddle horizontally by
    pressing the keyboard's left and right arrow keys.
    Each time the paddle hits the ball, the user scores a point and the paddle
    shrinks a little, to make the game slightly more challenging. If the user
    misses and the ball hits the bottom, the game is over.
    To test if your compiler has translated this program correctly, run the
    translated code in the supplied VMEmulator and play the game.
    Make sure to score some points, to test the part of the program that
    displays the score on the screen, and to have some fun while you're at it!
- Complex Arrays
  - Purpose: tests how your compiler handles complex array references and
    expressions.
  - Description: performs five complex calculations using arrays.
    For each such calculation, the program prints on the screen the expected
    result versus the actual result, as performed by the compiled program.
    To test if your compiler has translated the program correctly, run the
    translated code in the supplied VMEmulator and make sure that the actual
    results are identical to the expected results.
- A great and fun test for your compiler is your submission for project 9!

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
  the supplied VMEmulator and executing it using the "no animation" mode.
  Each one of the six test programs contains specific execution guidelines,
  as listed in the submission page; test the program according to these
  guidelines;
- If the test program behaves unexpectedly or some error message is
  displayed by the VMEmulator, fix your compiler and go to to step 1.
- Don't forget: we supply you with a "built-in" JackCompiler, you can use
  it and compare your compiler to it.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Food For Thought

After you finish the compiler, take some time to appreciate some of the things
we did in previous projects, for example the VMtranslator and Assembler, and how
they've come to help us when building the compiler.

Can you think of things that were implemented easily in the compiler thanks to
design decisions made in previous projects?

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
