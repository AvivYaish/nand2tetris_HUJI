"""This file is part of nand2tetris, as taught in The Hebrew University,
and was written by Aviv Yaish according to the specifications given in  
https://www.nand2tetris.org (Shimon Schocken and Noam Nisan, 2017)
and as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0 
Unported License (https://creativecommons.org/licenses/by-nc-sa/3.0/).
"""
import os
import sys
import typing
from CompilationEngine import CompilationEngine
from JackTokenizer import JackTokenizer
from SymbolTable import SymbolTable
from VMWriter import VMWriter


def compile_file(
        input_file: typing.TextIO, output_file: typing.TextIO) -> None:
    """Compiles a single file.

    Args:
        input_file (typing.TextIO): the file to compile.
        output_file (typing.TextIO): writes all output to this file.
    """
    """
    The proposed implementation is based on morphing the syntax analyzer
    built in the previous project into a the full-scale compiler. In
    particular, we propose to gradually replace the software modules that
    generate XML output with software modules that generate VM code. This can
    be done in two main development stages, as follows.

    Stage I: Symbol Table
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
    programs. At this stage you can make the switch to a full-scale compiler,
    and start generating VM code instead of XML output. This can be done by
    gradually morphing the code of the extended syntax analyzer into a
    full-scale compiler. 

    Stage II: Code Generation 
    Since we gave many translation examples in chapter 11, we don't provide
    specific guidelines on how to develop the code generation features of the
    compiler. Rather, we provide a set of six application programs, designed
    to unit-test these features incrementally. We strongly suggest to test
    your compiler on these programs in the given order: Seven, ConvertToBin,
    Square, Average, Pong, ComplexArrays. This way, you will end up building
    the compiler's code generation capabilities in stages, according to the
    unfolding demands of each test program.

    Testing Method: 
    Normally, when one compiles a program and runs into some problems, one
    concludes that the program is at fault. In this project though, the
    setting is exactly the opposite: all the Jack programs that we supply for
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
    as listed below; test the program according to these guidelines;
    - If the test program behaves unexpectedly or some error message is
    displayed by the VM emulator, fix your compiler and go to to step 1.
    - Don't forget: we supply you with a "built-in" JackCompiler, you can use
    it and compare your compiler to it.
    """
    # Your code goes here!
    pass


if "__main__" == __name__:
    # Parses the input path and calls compile_file on each input file.
    # This opens both the input and the output files!
    # Both are closed automatically when the code finishes running.
    # If the output file does not exist, it is created automatically in the
    # correct path, using the correct filename.
    if not len(sys.argv) == 2:
        sys.exit("Invalid usage, please use: JackCompiler <input path>")
    argument_path = os.path.abspath(sys.argv[1])
    if os.path.isdir(argument_path):
        files_to_assemble = [
            os.path.join(argument_path, filename)
            for filename in os.listdir(argument_path)]
    else:
        files_to_assemble = [argument_path]
    for input_path in files_to_assemble:
        filename, extension = os.path.splitext(input_path)
        if extension.lower() != ".jack":
            continue
        output_path = filename + ".vm"
        with open(input_path, 'r') as input_file, \
                open(output_path, 'w') as output_file:
            compile_file(input_file, output_file)
