# Project 9: High-Level Programming

This project introduces Jack - a simple, Java-like, object-based programming
language. Before building a Jack compiler in projects 10-11, it makes sense to
become familiar with the language itself. That's the main purpose of this
project. And... there is also the thrill of writing a little computer game in a
cool little language.

## Objective

Adopt or invent an application idea like a simple computer game or some other
interactive program. Examples include Tetris, Snake, Hangman, Space Invaders,
Sokoban, Pong, etc.
Your job is to implement this application in Jack.

## Contract

You should implement, completely by yourselves, a valid non-trivial Jack
program which utilizes all the features of the Jack language and of our
operating system.

## Resources

- Unit 9 of the lectures and book
- The built-in JackCompiler
- The built-in VMEmulator
- The VMEmulator's tutorial

## What To Submit

- You should submit a zip file with the following files:
  AUTHORS and all .jack files required for your project.
- The submission should not contain any folder.
- The submission should not contain any OS implementation.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## Implementation Details

We will now describe all the objective requirements which your projects should
fulfill.

- Your submission should compile successfully on the built in JackCompiler and
  run successfully on the built in VMEmulator using the built-in OS.
- Your game can be an unoriginal idea (Tetris, Snake, etc'), but must be
  original code - you can't use code you found online!
- The program should be comparable in scope to Tetris/Snake/Pong.
  Although the number of code-lines is not a good estimation of the amount of 
  effort put into a project, a project of less than 600 "meaningful" lines is
  definitely too short.
  Whitespace, comments, and various fluff (such as the class/function
  definition lines, variable declaration, code that prints bitmaps, etc)
  don't count as "meaningful".
- You should make use of all OS classes directly and demonstrate a thorough
  knowledge of the OS API and Jack language features (classes, members,
  methods, loops, types, operators, etc').
  Project 10's JackTokenizer.py includes a list of all Jack features.
  Project 12's instructions include the API of the entire OS, and a list of OS
  errorcodes.
  Make a list of all such features and make sure you're using each one in a
  non-trivial way. Usage should be meaningful in the context of your program -
  don't call functions and throw away their results or define useless variables!

Now, we would like to briefly explain the reasoning behind the aforementioned
requirements.
In projects 10 and 11 we will build a compiler for the Jack language, so using
all Jack features could help you test them, and in project 12 we will build an operating system, thus using all OS classes could help test that project, too.

### Developing Jack Applications

The following is a general step-by-step guideline to developing Jack apps:

- Plan your app carefully: design all the graphical objects and user
  interaction on paper. Then think about classes, methods, an API, and a
  testing strategy. Then start implementing and testing.
- Write / edit your Jack class files using a standard text editor. We
  recommend using [VSCode](https://code.visualstudio.com/) together with
  the recommended nand2tetris syntax highlighting
  [plugin](https://marketplace.visualstudio.com/items?itemName=AvivYaish.nand-ide).
- Make sure your code is well-documented.
- Try to write efficient code. For example, in order to optimize animation
  speed, use the bitmap editor supplied in ``nand2tetris/projects/09``.
- Put all relevant .jack application files in one directory.
- Compile your Jack files / directory using the supplied JackCompiler
  available in ``nand2tetris/tools``. The same directory contains detailed
  instructions on how to use the compiler. Note: the compiler is a
  **command-line** program, and thus will not execute by simply
  double-clicking on it.
- Execute your app by loading the app's directory (which now contains
  the compiled .vm files) into the supplied VMEmulator, and running the
  code. Note: you should load the app's **directory**, and not one of the
  app's single files.
- Important: Have fun!

## Tips

### Project Ideas

To get an idea for your app, watch some existing Nand to Tetris apps, for
example on [YouTube](https://www.youtube.com).
[Here](https://www.youtube.com/watch?v=wA83jdD2KII) is an example of a game
that would qualify for a perfect grade, you can find other examples in our hall
of fame.
[Here](https://www.youtube.com/watch?v=inFJ5EyOhpM) is an example of a game
that is a bit over the top.

### Sample Jack Programs

We encourage you to play with some of the Jack programs supplied in
``nand2Tetris/projects/09`` and in ``nand2Tetris/projects/11``, and review
their code.

For example, we supply you with a simple interactive program called Square
Dance which allows the user to move a graphical square around the screen.

The program's handling of the keyboard and the screen illustrates programming
practices that are applicable to developing interactive Jack applications in
general. Therefore, it is recommended to explore the program's code, which is
given to you in the ``nand2tetris/projects/09/Square`` folder.

When the program starts running, a square of size 30 by 30 pixels pops up at
the top-left corner of the screen. The program then listens, and responds, to
the following key-pressing events:

- ``Right-arrow`` moves the square to the right;
- ``Left-arrow`` moves the square to the left;
- ``Up-arrow`` moves the square up;
- ``Down-arrow`` moves the square down;
- ``x`` increments the square's size by 2 pixels;
- ``z`` decrements the square size by 2 pixels;
- ``q`` quits the program.

Animation speed can be controlled by changing the delay constant in the
``moveSquare`` method in the ``SquareGame.jack`` class source code.

### The Jack OS

Writing Jack programs requires working with the Jack OS, just like writing Java
programs requires working with the Java class library. The Jack OS can be
viewed as a collection of software services that extend the basic language's
capabilities and close gaps between it and the underlying hardware.

The Nand2tetris Software Suite includes two Jack OS implementations. One OS 
implementation was written in Jack, and was then translated using a Jack 
compiler into the set of 8 class files Math.vm, Screen.vm, Output.vm,
Keyboard.vm, Memory.vm, String.vm, Array.vm, and Sys.vm.
These files are stored in the ``nand2tetris/tools/os`` folder.
The second OS implementation was written in Java, and is an integral part of
the supplied VMEmulator, also available in ``nand2tetris/tools``.

If you wish to use the compiled OS version, for example in order to run an app
called MyApp, copy the compiled OS .vm files from the ``nand2tetris/tools/os``
folder into your MyApp folder.
If you wish to use the OS version which is built into the VMEmulator, this
step is not necessary.

Which OS version to use is up to you. The built-in version is faster. The
VMEmulator does not care which OS version is used, for the following reason:

Suppose you've loaded a folder into the VM emulator, and proceeded to execute
it. Whenever the emulator detects a call for some OSclass.function, it checks
if this function is available in the loaded code base; if so, it executes this
function's VM code; otherwise, it reverts to using the built-in implementation
of this OS function.

Therefore, you are welcome to use all, or some, or none of the compiled OS
class files, as you see fit. This flexibility will be quite a boon when we'll
develop and unit-test the Jack OS in project 12.

Note: there is no random function in our operating system, but you are welcome
to search the web for tutorials on writing pseudo-random number generators.

### Tools

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

## A Message From Aviv

Each semester, course staff is delighted to see the cool ideas you come up with.
I hope your games are fun, I can't wait to see them all!

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
