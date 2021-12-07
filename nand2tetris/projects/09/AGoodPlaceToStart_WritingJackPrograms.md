This file is part of nand2tetris, as taught in The Hebrew University,
and was written by Aviv Yaish according to the specifications given in  
https://www.nand2tetris.org (Shimon Schocken and Noam Nisan, 2017)
and as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0 
Unported License (https://creativecommons.org/licenses/by-nc-sa/3.0/).

### Developing Jack applications
- Put all the app files in one directory, whose name is the app's name
- Write / edit your Jack class files using a standard text editor. We recommend
  using [VSCode](https://code.visualstudio.com/) together with the recommended nand2tetris syntax highlighting
  [plugin](https://marketplace.visualstudio.com/items?itemName=loyio.Nand2Tetris-vscode).
  If you prefer Notepad++ or Vim, see the syntax highlighting themes supplied in
  nand2tetris/syntax_highlighting
- Compile your Jack files / directory using the supplied JackCompiler available
  in nand2tetris/tools. The same directory contains detailed instructions on how
  to use the compiler. Note: the compiler is a **command-line** program, and thus
  will not execute by simply double-clicking on it.
- Execute your app by loading the app's directory (which now contains
  the compiled .vm files) into the supplied VM emulator, and running the code.
  Note: you should load the app's **directory**, and not one of the app's
  single files.

### Using the JackCompiler
Typing "JackCompiler fileName.jack" will compile the supplied Jack file. Typing 
"JackCompiler directoryName" will compile all the Jack file that are found in the 
specified directory. Wildcards are not supported. Here are some examples:

- Compile the current directory:
  > C:\...\projects\09\Reflect>JackCompiler
  > 
  > Compiling "c:\...\projects\09\Reflect"
- Compile a single file:
  > C:\...\projects\09\Reflect>JackCompiler Mirrors.jack 
  > 
  > Compiling "C:\...\projects\09\Reflect\Mirrors.jack"
- Compile the "Reflect" directory (for example):
  > C:\...\projects\09>JackCompiler Reflect
  > 
  > Compiling "C:\...\projects\09\Reflect"