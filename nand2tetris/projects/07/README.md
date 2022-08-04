# Project 7: Virtual Machine (Arithmetic)

Java (or C#) compilers generate code written in an intermediate language called
bytecode (or IL). This code is designed to run on a virtual machine architecture
like the JVM (or CLR).

One way to implement such VM programs is to translate them further into
lower-level programs written in the machine language of some concrete (rather
than virtual) host computer.

In projects 7 and 8 we build such a VM translator, designed to translate
programs written in the VM language into programs written in the Hack assembly
language. The VM language, abstraction, and translation process are described in
chapters 7 and 8 of the book.
For the purpose of this project, chapter 8 can be ignored.

## Objective

Build a basic VM translator, focusing on the implementation of the VM language's
stack arithmetic and memory access commands.
In Project 8, this basic translator will be extended into a full-scale VM
translator.

## Resources

- Unit 7 of the lectures and book
- The built-in CPUEmulator
- The built-in VMEmulator
- The CPUEmulator's tutorial
- The VMEmulator's tutorial

## Contract

Write a VM-to-Hack translator, conforming to the VM Specification, Part I
(book section 7.2) and to the Standard VM-on-Hack Mapping, Part I (book section
7.3.1).

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
   the directory (ignore other file types and subdirectories) and store the 
   output .asm files in the same directory.
   For example, assume '~/nand/dir/' is a path to a directory which contains
   two files: "t1.vm" and "t2.vm".
   If we execute:
   ```console
   VMtranslator ~/nand/dir/
   ```
   The outputs ``t1.asm`` and ``t2.asm`` should be created in ``~/nand/dir/``.
   The same behavior applies to the following execution:
   ```console
   VMtranslator ~/nand/dir
   ```
3. Your program should support both relative and absolute paths. 

The Python template given to you contains code that handles such input
parameters, and creates the corresponding output files in the correct paths.

## Implementation Details

We propose implementing the basic VM translator in two stages. This allows
unit-testing your implementation incrementally, using the test programs we
supplied you. In what follows, when we say “your VM translator should implement
some VM command" we mean “your VM translator should translate the given VM
command into a sequence of assembly commands that accomplish the same task".

### Stage I: Handling stack arithmetic commands

The first version of your basic VM translator should implement the nine
arithmetic / logical commands of the VM language as well as the VM
command push constant x.
The latter command is the generic push command for which the first
argument is constant, and the second argument is some non-negative integer
x. This command comes handy at this early stage, since it helps provide
values for testing the implementation of the arithmetic / logical VM
commands. For example, in order to test how your VM translator handles
the VM add command, we can test how it handles the VM code:

```
push constant 3
push constant 5
add
```

The other arithmetic and logical commands are tested similarly:
add, sub, neg, and, or, not, shiftleft, shiftright, eq, gt, lt
This stage can be tested using SimpleAdd, which is relatively simple, and
StackTest, which is slightly more complex.

### Stage II: Handling memory access commands

The next version of your basic VM translator should include a full
implementation of the VM language's push and pop commands, handling the
eight memory segments described in chapter 7. We suggest breaking this
stage into the following sub-stages:

- You have already handled the constant segment;
- Next, handle the segments local, argument, this, and that. This can be
  tested using BasicTest.
- Next, handle the pointer and temp segments, in particular allowing
  modification of the bases of the this and that segments. This can be
  tested using PointerTest.
- Finally, handle the static segment. This can be tested using StaticTest.

### Testing

We supply VM programs designed to unit-test the staged implementation
proposed above. For each program Xxx we supply four files:
- The Xxx.vm file contains the program's VM code
- The XxxVME.tst script allows running the program on the supplied VM emulator,
  to experiment with the program’s intended operation.
- After translating the program using your VMtranslator, the supplied Xxx.tst
  script and Xxx.cmp compare file allow testing the translated assembly code on
  the supplied CPU emulator.

We supply you with five test programs:

- SimpleAdd.vm pushes two constants onto the stack and adds them up.
- StackTest.vm executes a sequence of arithmetic and logical operations on the
  stack.
- BasicTest.vm executes push/pop operations using the virtual memory segments
  constant, local, argument, this, that, and temp.
- PointerTest executes push/pop operations using the virtual memory segments
  pointer, this, and that.
- StaticTest.vm executes push/pop operations using the virtual memory segment
  static.

For each one of the five test programs, follow these steps:

- To get acquainted with the intended behavior of the supplied test
  program Xxx.vm, run it on the supplied VM emulator using the supplied
  XxxVME.tst script.
- Use your VM translator to translate the supplied Xxx.vm file. The
  result should be a new text file containing Hack assembly code, named
  Xxx.asm.
- Inspect the Xxx.asm program generated by your VM translator. If there
  are visible syntax (or any other) errors, debug and fix your VM translator.
- To check if the generated code performs properly, use the supplied
  Xxx.tst and Xxx.cmp files to run the Xxx.asm program on the supplied CPU
  emulator. If there are any problems, debug and fix your VM translator.

### Implementation Order

The supplied test programs were carefully planned to test the incremental
features introduced by each development stage of your basic VM
translator.

Therefore, it's important to implement your translator in the
proposed order, and to test it using the appropriate test programs at
each stage. Implementing a later stage before an early one may cause the
test programs to fail.

### Submission Template

- VMtranslator: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- Main.py: The project's main .py file.
- Parser.py: Handles the parsing of a single .vm file.
- CodeWriter.py: Translates VM commands into Hack assembly code.

## Tips

### Tools

Before setting out to develop your VM translator, we recommend getting
acquainted with the virtual machine architecture model and language. As
mentioned above, this can be done by running, and experimenting with, the
supplied .vm test programs using the supplied VM emulator.

### The VM Emulator

This program, located in your nand2tetris/tools directory, is designed to
execute VM programs in a direct and visual way, without having to first
translate them into machine language. For example, you can use the
supplied VM emulator to see - literally speaking - how push and pop
commands effect the stack. And, you can use the simulator to execute any
one of the supplied .vm test programs.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Input Validity

You can assume your VMtranslator will only receive valid .vm files.
So, for example, you should not support popping into the constant segment as it
is considered invalid.
On the other hand, our VM language does not have segment bounds checks, so you
should support accessing the pointer and temp segments for all indices, and not
only 0/1 for pointer and 0-6 for temp.

### Output Validity

Some notes regarding the .asm code which your VMtranslator should produce:

- You should not end your programs with infinite loops like in project 4, we will
  understand why in project 12.
- Let's closely examine the comparison commands (<,>):
  A naive translation can cause overflows when comparing certain numbers, thus
  giving a wrong answer for some valid inputs.
  This is bad - we want our hardware to handle comparisons between all valid
  numbers correctly!
  Can you think of a method that avoids overflows?
- You should output correct, readable and fast .asm code, meaning code that runs
  in as few CPU tick-tocks as possible. You will not lose points in this
  assignment for code that is not the most efficient, but you should still know
  how to write efficient .asm code.
- Our computer can only run programs of a certain maximum length; hark back to
  project 5 - what limits the maximal program length? 
  Your job is to make sure that programs of reasonable length are translated to
  asm code that doesn't exceed the maximal length.
  More concretely:
  - Your translator should succeed in translating every program, even if the
    output asm file is too large for the computer. Although the output is not
    valid because of its length, it should be correct in every other way.
    As a general rule, no truncation of output code is allowed.
  - Given an 800-line long VM program, your VMtranslator should output the
    complete (with no truncation) ASM translation such that its length is at
    most the longest valid program that our computer can run.
    This can be achieved without using fancy tricks.
- Translation order is not important.
  For example, if folder T contains two files: T1.vm and T2.vm, the translation
  of T2 can appear before that of T1 in the output file T.asm, and vice versa.
  We will see why this doesn't matter in projects 8 and 12.

### Project 8

Project 8 is a direct continuation of this project, keep this in mind if you
don't want to use the proposed implementation.
If you already finished project 8, you can use it as your submission for project
7 too, as long as it fulfills all requirements. Note that the bootstrap code
will cause the project to fail, so remove it before submission. 

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
