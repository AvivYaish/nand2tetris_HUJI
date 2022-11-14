# Project 10: Compilation

The Jack compiler, like those of Java and C#, is two-tiered: the compiler's
front-end translates from the high-level language to an intermediate VM
language; the compiler's back-end translates further from the VM language to the
native code of the host platform.

In projects 7-8 we've built the compiler's back-end (the VM translator); we now
turn to building the compiler's front-end. This development will span two
projects: syntax analysis (this project), and code generation (next project).

Welcome to syntax analysis.

## Objective

In this project we build a syntax analyzer that parses Jack programs according
to the Jack grammar, producing an XML file that renders the program's structure
using marked-up text.

In the next project, the logic that generates the XML output will be morphed
into logic that generates VM code.

## Resources

- Unit 10 of the lectures and book

## Contract

Write a syntax analyzer for the Jack language.
For each input .jack file, your analyzer should generate an .xml output file.
The generated files should be identical to the supplied compare-files, up to
white space.

## What To Submit

- You should submit a zip file with the following files:
  A run-file named “JackAnalyzer”, a Makefile called “Makefile”, an AUTHORS file,
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

You should include a run-file named ``JackAnalyzer`` which accepts a single input
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
   JackAnalyzer <path>/file.jack
   ```
   The following output file should be created: ``<path>/file.xml``
2. If the input is a directory, you should translate all .jack files present in
   the directory (ignore other file types and subdirectories) and store the
   output .xml files in the same directory.
   For example, assume '~/nand/dir/' is a path to a directory which contains
   two files: "t1.jack" and "t2.jack".
   If we execute:
   ```console
   JackAnalyzer ~/nand/dir/
   ```
   The outputs ``t1.xml`` and ``t2.xml`` should be created in ``~/nand/dir/``.
   The same behavior applies to the following execution:
   ```console
   JackAnalyzer ~/nand/dir
   ```
3. Your program should support both relative and absolute paths. 

The Python template given to you contains code that handles such input
parameters, and creates the corresponding output files in the correct paths.

## Implementation Details

We propose implementing the project in two stages. First, write and test
the JackTokenizer module. Next, write and test the CompilationEngine
module, which implements the parser described in the chapter.

### Stage I: JackTokenizer

Tokenizing, a basic service of any syntax analyzer, is the act of
breaking a given textual input into a stream of tokens, where each token should
be printed in a separate line. And while it is at it, the tokenizer can also
classify the tokens into lexical categories:
symbol, keyword, identifier, integer constant or string constant.

With that in mind, your first task it to implement, and test, the JackTokenizer
module. Specifically, you have to develop:

1. A Tokenizer implementation, and
2. A test program that goes through a given .jack input file.

We will now follow an example. Given an input Jack source code:

```Java
if (x < 0) {
  let state = "negative";
}
```

Your tokenizer should output the following XML code:

```XML
<tokens>
  <keyword> if </keyword>
  <symbol> ( </symbol>
  <identifier> x </identifier>
  <symbol> &lt; </symbol>
  <integerConstant> 0 </integerConstant>
  <symbol> ) </symbol>
  <symbol> { </symbol>
  <keyword> let </keyword>
  <identifier> state </identifier>
  <symbol> = </symbol>
  <stringConstant> negative </stringConstant>
  <symbol> ; </symbol>
  <symbol> } </symbol>
</tokens>
```

Note that in the case of string constants, the tokenizer throws away the
double-quote characters (``"``). This behavior is intended, and is part of our tokenizer
specification.
 
Also note that three of the symbols used in the Jack language (``<``, ``>``, and
``&``) are also used for XML markup, and thus they cannot appear verbatim as XML
data. To solve the problem, we require the tokenizer to output these tokens as
``&lt;``, ``&gt;``, and ``&amp;``, respectively.
For example, in order for the symbol ``<`` to be displayed properly in a
web browser, it should be generated as ``<symbol>&lt;</symbol>``.

Finally, note that unlike the Tokeinizer module, the tokenizer test program that
you are to write is not part of the syntax analyzer. This test program entails
an intermediate testing stage, focusing on unit-testing the Tokenizer only.
Once this is completed successfully, the test program is no longer necessary.

#### Tokenizer Testing

Test your tokenizer on the Square Dance and the TestArray programs.

- Apply your tokenizer test to each Xxx.jack source file of the relevant test.
- Given an Xxx.jack source file, have your tokenizer give the output file
  the name XxxT.xml, and then iterate on every token of the source file like so:
- Each token should be printed in a separate line, along with its
  classification: symbol, keyword, identifier, integer constant or string
  constant.
- Use the supplied TextComparer utility to compare the generated output
  to the supplied .xml compare files.
- Since the output files generated by your tokenizer test will have the
  same names and extensions as those of the supplied compare files, we
  suggest putting them in separate directories.

### Stage II: Parser (CompilationEngine)

In the context of this project, parsing is defined narrowly as the act of
going over the tokenized input and rendering its grammatical structure
using some agreed-upon format. The specific parser that we implement here
is based on the Jack grammar, and is designed to emit XML output. Both
the grammar and the agreed-upon XML tags are described in chapter 10.

The Jack parser is implemented by the CompilationEngine module. Your task
is to implement this API: write each one of the specified methods, and
make sure that it emits the correct XML output. For the benefit of
unit-testing, we recommend to begin by:

1. First, write a compilation engine that handles any given Jack code except
   for expressions;
2. Next, extend the compilation engine to handle expressions as well.

The test programs supplied are designed to support this staged strategy.

#### Parser Testing

- Apply your syntax analyzer to the supplied test programs, then use the
  supplied TextComparer utility to compare the generated output to the
  supplied .xml compare files.
- Since the output files generated by your syntax analyzer will have the
  same names and extensions as those of the supplied compare files, we
  suggest putting them in separate directories.
- Note that the indentation of the XML output is only for readability.
  Web browsers and the supplied TextComparer ignore white space.

## Submission Template

- JackAnalyzer: The executable for the project. This allows our graders to run
  your project in a standard manner on UNIX-like operating systems.
- Makefile: A makefile for the project. This allows our graders to prepare your
  project for execution in a standard manner on UNIX-like operating systems.
- JackAnalyzer.py: The project's main .py file.
- JackTokenizer.py: Tokenizes an input .jack file according to Jack's grammar.
- CompilationEngine.py: Gets input from a JackTokenizer and emits its parsed
  structure into an output stream.

## Tips

### Tools

If you are wondering whether some Jack program is valid or not, you should
use the built-in JackCompiler to compile it; if compilation fails, it is
invalid. Otherwise, it is valid.

If you want, you can compile the supplied SquareDance and TestArray
programs using the supplied ("built-in") JackCompiler, then use the
supplied VM emulator to run the compiled code. This shows that the
test programs are not just plain text; they also have semantics, or
meaning, something that the syntax analyzer does not care about.

For more information about our built-in tools, see the tutorials in the
lectures and submission page, and additional information provided in
tools/README.md.

### Test Programs

A natural way to test your syntax analyzer it is to have it parse some
representative Jack programs. We supply two such test programs:

- Square Dance: a simple interactive application, described in project 9.
  This test includes all the syntactic features of the Jack language except for
  array processing.
  The implementation is organized in three classes:
  - Main.jack: initializes and starts a new "square dance" session".
  - Square.jack: implements an animated square. A Square object has a screen
    location and size properties, and methods for drawing, erasing, moving, and
    size changing.
  - SquareGame.jack: runs the show according to the game rules.
  - Note: the three source Jack files comprising the Square Dance application
    are identical to those stored in the projects/09/Square directory. For
    completeness, an identical copy of these files is also available in the
    ``projects/10/Square`` directory.
- Expressionless Square Dance: in this version of Square Dance, each expression
  in the original source code has been replaced with a single identifier (some
  variable name in scope).
  This version of the program was designed in order to facilitate unit-testing
  of your syntax analyzer's ability to parse everything except for expressions.
  Note that the replacement of expressions with variables has resulted in
  nonsensical code which, however, is grammatically correct.
  For convenience, the expressionless files have the same names as those of the
  original files, but they are stored in a separate
  ``projects/10/ExpressionlessSquare`` directory.
- Array Test: a single-class Jack program designed to test how the syntax
  analyzer handles array processing. The class ``Main.jack`` computes the
  average of a user-supplied sequence of integers using an array data structure
  and array manipulation commands.

### Input Validity

You can assume you will only be asked to handle valid code:

- Use Jack's grammar table! It is included in the documentation of
  ``JackTokenizer.py``, and can help you understand which code is considered
  valid. In addition, the built-in JackCompiler can help: if it can compile
  some code, then the code is considered valid.
- Code is considered valid only if after removing all comments and
  non-functional whitespaces and replacing each one of them with one white space
  it is valid.
- Keywords can't be used as identifiers.
- Empty tags (tags that have no content between the opening tag and closing tag)
  should be written as:
  ```XML
  <xxx>
  </xxx>
  ```
  Where ``xxx`` is the corresponding tag name and the opening and closing tags
  are separated by a line-break.
  For example, this is relevant for empty ``parameterLists``.
- In case you output indented .xml files: we will use ``diff -w`` to compare
  your files with the correct output, so we will ignore whitespace.
- You should support two additional unary operators: ``^`` and ``#``, which
  respectively perform a left-shift and a right-shift, as defined in previous
  projects.
  These symbols were picked instead of ``<<``, ``>>`` so that it would be easy
  to differentiate between shifts and comparison operators.
  They are used similarly to other unary operators, such as ``~``, for example:
  ```Java
  let x = ^(y+3); // left-shifts the value (y+3), and assigns the result to x
  let x = #x;     // shifts x to the right, and assigns the result to x
  ```
  These symbols should be translated like any other symbol, for example ``^`` is
  translated to
  ```XML
  <symbol> ^ </symbol>
  ```

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
