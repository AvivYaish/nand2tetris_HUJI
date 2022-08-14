# Project 8: Virtual Machine (Control)

We continue building the VM translator - a program that translates programs
written in the VM language into programs written in the Hack machine language.
This is a respectable chunk of engineering, so we are doing it in two stages.
Welcome to stage II.

## Objective

Extend the basic VM translator built in project 7 into a full-scale VMtranslator.
In particular, in project 7 we focused on handling the stack arithmetic and
memory access commands of the VM language. We now turn to handle the VM
language's branching and function calling commands.

## Resources

- Unit 8 of the lectures and book
- The built-in CPUEmulator
- The built-in VMEmulator
- The CPUEmulator's tutorial
- The VMEmulator's tutorial

## Contract

Write a full-scale VM-to-Hack translator, extending the basic translator
developed in project 7, and conforming to the VM Specification, Part II
(book section 8.2) and to the Standard VM-on-Hack Mapping, Part II (book section
8.3.1). Use your VM translator to translate the VM programs supplied below,
yielding corresponding programs written in the Hack assembly language.

## What To Submit

- You should submit a zip file with the following files:
  A run-file named “VMtranslator”, a Makefile called “Makefile”, an AUTHORS file,
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

You should include a run-file named ``VMtranslator`` which accepts a single input
parameter (that we will describe soon).
After calling ``make``, your project should execute by calling the run-file, and
the run-file should exit successfully.

The python template given to you contains a run-file that runs the template's
main function. Note that this file does not work on Windows.

### Input Parameter

The run-file should accept a single input parameter, which corresponds to a path
to either some valid .vm file, or a folder.

1. If a path to a single .vm file is given as an input, you should create the
   relevant output in the same folder as the input.
   For example, when running:
   ```console
   VMtranslator <path>/file.vm
   ```
   The following output file should be created: ``<path>/file.asm``
2. If the input is a directory, you should translate all .vm files present in
   the directory (ignore other file types and subdirectories) and store a single
   output .asm file in the same directory. The outpu's name should be the name
   of the last subdirectory.
   For example, assume '~/nand/dir/' is a path to a directory which contains
   two files: "t1.vm" and "t2.vm".
   If we execute:
   ```console
   VMtranslator ~/nand/dir/
   ```
   The output ``dir.asm`` should be created in ``~/nand/dir/``.
   The same behavior applies to the following execution:
   ```console
   VMtranslator ~/nand/dir
   ```
3. Your program should support both relative and absolute paths. 

The Python template given to you contains code that handles such input
parameters, and creates the corresponding output files in the correct paths.

## Implementation Details

In this project, we will extend the basic translator developed in project
7 to a full-scale VM-to-Hack translator which will conform to the VM
Specification, Part II (book section 8.2) and to the Standard VM-on-Hack
Mapping, Part II (book section 8.3.1).

To do this, you can use your submission for project 7 as a template. If you
implemented everything correctly, the parser from project 7 can be used
as-is, without any modifications. But, you will need to add the following
functions to your CodeWriter:
write_label, write_goto, write_if, write_function, write_call, write_return.

### Implementation Order

We recommend completing the implementation of the VM translator in the
following order:

1. First, implement and test the translation of the VM language's
   branching commands. This stage can be tested using the basic test
   BasicLoop and the slightly more advanced FibonacciSeries.
2. Next, implement and test the translation of the function call and
   return commands. "SimpleFunction" is a basic test for this step, while
   "NestedCall" is slightly more advanced, and also contains in-depth
   instructions on how to run the test (in NestedCall.html) and step-by-step
   visualizations of the stack's state in NestedCallStack.html.
3. Finally, add the bootstrap code, which initializes the SP to 256, and
   calls the function "Sys.init". After this step, some previous tests will
   stop working, specifically BasicLoop, FibonacciSeries and SimpleFunction!
   In order to test your implementation, you can use the FibonacciElement
   test, which includes a relatively simple recursive function, and the
   StaticsTest test, which includes multiple classes that utilize static
   variables.

This will allow you to unit-test your implementation incrementally, using
the test programs we supplied you with.
For each one of the five test programs, follow these steps:

- To get acquainted with the intended behavior of the supplied test
  program Xxx.vm, run it on the supplied VM emulator using the supplied
  XxxVME.tst script (if the program consists of one ore more files residing
  in a directory, load the _entire_ directory into the VM emulator and
  proceed to execute the code).)
- Use your VM translator to translate the supplied Xxx.vm file, or Xxx
  directory, as needed. The result should be a new text file containing
  Hack assembly code. The name of this file should be Xxx.asm.
- Inspect the translated Xxx.asm program. If there are visible syntax (or
  any other) errors, debug and fix your VM translator.
- To check if the translated code performs properly, use the supplied
  Xxx.tst and Xxx.cmp files to run the translated Xxx.asm program on the
  supplied CPU emulator. If there are any problems, debug and fix your VM
  translator.

The supplied test programs were carefully planned to test the incremental
features introduced by each stage in your VM implementation. Therefore,
it's important to implement your VM translator in the proposed order, and
to test it using the supplied test programs at each stage. Implementing a
later stage before an early one may cause the test programs to fail.

### Initialization

For the translated VM code to execute on the host computer platform, the
translated code (written in the machine language of the host platform) must
include some bootstrap code that maps the stack on the host RAM and starts
executing the code proper.

The first three test programs for this project assume that the bootstrap
code was not yet implemented, and include test scripts that effect the
necessary initializations (as was done in project 7).

The last two test programs assume that the bootstrap code is generated by
the VM translator. In other words, the assembly code that the final version
of your VM translator generates must start with some code that sets the
stack pointer and calls the Sys.init function. Sys.init will then call the
Main.main function, and the program will start running (similar to how
Java's JVM always looks for, and starts executing, a method named main).

Use your VM translator to translate the VM programs supplied as tests,
yielding corresponding programs written in the Hack assembly language.
When executed on the supplied CPU emulator, the translated code generated
by your VM translator should deliver the results mandated by the test
scripts and compare files supplied.

Note that the final project should always include a call to Sys.init in *every*
translation!
This means that the BasicLoop, FibonacciSeries, SimpleFunction tests are *not*
supposed to work with your final submission.

## Submission Template

- VMtranslator: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- Main.py: The project's main .py file.
- Parser.py: Handles the parsing of a single .vm file.
- CodeWriter.py: Translates VM commands into Hack assembly code.

## Tips

### Tools

Before setting out to extend your basic VM translator, we recommend
playing with the supplied .vm test programs. This will allow you to
experiment with branching and function call-and-return commands, using
the supplied VM emulator.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Testing

We provide you with five tests, which can be roughly split into two categories.

#### Tests for the VMtranslator's branching commands

- BasicLoop.vm computes the sum 1+2+...+ n and pushes the result onto the stack.
  This program tests the implementation of the VM language's branching commands
  goto and if-goto.
- FibonacciSeries.vm computes and stores in memory the first n elements of the
  Fibonacci series. This typical array manipulation program provides a more
  challenging test of the VM's branching commands.

#### Tests for the VMtranslator's call and return commands

- SimpleFunction.vm performs a simple calculation and returns the result.
  This program provides a basic test of the implementation of the VM commands
  `function` and `return`.
- NestedCall tests several requirements of the function calling protocol. 
  This is an optional and intermediate test, which may be useful when
  SimpleFunction (the previous test) passes but FibonacciElement (the next test)
  fails.
  The test can be used with or without the VM bootstrap code.
  For more information about this optional test, see the supplied guide and 
  stack diagram.
- FibonacciElement tests the handling of the VM's function calling commands, the
  bootstrap section, and most of the other VM commands.
  The program directory consists of two files, as follows:
  - Main.vm contains one function named Main.fibonacci. This recursive function
    returns the n'th element of the Fibonacci series, and is unrelated to the
    Fibonacci series program described previously in this project. 
  - Sys.vm contains a single function named Sys.init. This function calls the
    Main.fibonacci function with n=4, and then loops indefinitely (the Sys.init
    function, in turn, will be called by the VM implementation's bootstrap code).
  Since the program consists of more than one .vm file, the entire directory
  must be translated. The translation should yield a single assembly file named
  FibonacciElement.asm.
  Unlike the previous tests, this test assumes that the VMtranslator initializes
  the VM implementation. If the generated assembly file will not begin with
  bootstrap code, the test will fail.
- StaticsTest is split into two main files, Class1.vm and Class2.vm, which have
  functions designed to set and get various static values; this is done in order
  to test the handling of the static memory segment. 
  In addition, Sys.vm contains a single Sys.init function that calls the get/set
  functions of Class1 and Class2
  This test assumes that the VM translator initializes the VM implementation; if
  the generated assembly file will not begin with bootstrap code, the test will
  fail.

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
