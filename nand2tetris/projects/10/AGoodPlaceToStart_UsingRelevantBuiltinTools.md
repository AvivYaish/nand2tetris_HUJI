This file is part of nand2tetris, as taught in The Hebrew University,
and was written by Aviv Yaish according to the specifications given in  
https://www.nand2tetris.org (Shimon Schocken and Noam Nisan, 2017)
and as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0 
Unported License (https://creativecommons.org/licenses/by-nc-sa/3.0/).

### TextComparer
Compares two given files ignoring white space, and reports success or failure. For 
example, suppose you run the hardware simulator with some test script and get a 
comparison failure. If you want, you can then use the TextComparer to investigate the 
problem:
> C:\...\projects\02>HardwareSimulator ALU.tst
> 
> Comparison failure at line 24
> 
> C:\...\projects\02>TextComparer ALU.cmp ALU.out
> 
> Comparison failure in line 23:
> 
> |0101101110100000|0001111011010010|1|1|0|0|0|0|0001111011010010|0|0| |0101101110100000|0001111011010010|1|1|0|0|0|0|0001111011010010|0|1|

(Note the line number discrepancy between the reports of the two tools).

This tool stops the comparision upon find the first discrepancy. If you would like
to compare the rest of the files, we recommend using other tools such as [KDiff](http://kdiff3.sourceforge.net/), 
or even the standard "diff" tool available in most operating systems.
For more info (in Hebrew) on how to use "diff", see:
https://www.youtube.com/watch?v=ksm2JMhJsL8

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
