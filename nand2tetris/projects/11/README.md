partner1_username, partner2_username

# Project 11: Compilation, Continued

## Submitter details

- Partner1FirstName Partner1LastName, ID 011111111, partner1_email@mail.huji.ac.il
- Partner2FirstName Partner2LastName, ID 022222222, partner2_email@mail.huji.ac.il

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

- Your zip should only include a run-script named 'JackCompiler', a Makefile
  called "Makefile", a README.md file, and the source code for your
  implementation.
- Include other files required by your project, if there are any.
- The README.md file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.
- You can change the template however you want, or even not use it at all.
  But, your project should use the same standard installation and running
  procedures, and standard inputs that the template uses.

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
