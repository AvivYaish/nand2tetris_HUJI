# Built-in tools

After downloading, put the downloaded .zip file in an empty directory on your
computer, and extract its contents as is, without changing the directories
structure and names.

The supplied software tools are designed to be run from your computer's
command-line environment (also known as "terminal", or "shell"). Command-line
environments vary from one operating system to another, and working in them
requires some knowledge of various OS shell commands. For additional
information in Hebrew about command-line environments, see
[this](https://www.youtube.com/playlist?list=PLuHmgt1HXB7Cb2b1LKWad9HpEZ_Rt5MZt).

In order to eliminate this overhead, we supply batch files (for Windows) and
scripts (for Unix and Mac OS), developed by Mark Armbrust. These batch and
script files enable invoking the supplied nand2tetris tools from the command
line on your computer, painlessly. They can be used from any working directory
on your computer, without requiring full paths to the files on which they
operate. Further, they accept spaces in directory and file names, so they will
work if nand2tetris is installed under a directory named, say, "My Documents".

In order to use the nand2tetris software tools, your computer must be equipped
with a Java Run-time Environment. The JRE can be downloaded freely from many
sites, including [here](http://java.com/en/download/index.jsp).
For best performance, download the latest available version.

## Mac and Linux users

Before running the scripts, you must first change their file attributes to
include "executable", in some environments this can be done like so:

```console
chmod +x *.sh
```

You can then run the scripts by typing their name, as
well as the .sh extension, in the terminal environment.

If you want to avoid typing the 'sh' extensions, you can create (once and for
all) symbolic links in your ~/bin directory. Here is an example how to do it for,
say, the HardwareSimulator tool:

```console
ln -s ~/nand2tetris/tools/HardwareSimulator.sh HardwareSimulator
chmod +x HardwareSimulator
```

## MacOS users (written by Yong Bakos)

Older versions of Apple OS X come with Java pre-installed, so there may be no
need to install Java on your Mac. Furthermore, there is no need to modify your
Java CLASSPATH.

To find out if Java is already installed on your Mac, start the Terminal
application (Applications - Utilities - Terminal). Once the terminal window
appears, type the following:

```console
java -version
```

Depending on what happens next, you may or may not need to install Java.

- If you see an output on the console such as java version "1.8.0_31", then Java
  is already installed. You can proceed to install the Nand2Tetris software suite.
- If a window appears, stating To use the "java" command-line tool you need to
  install a JDK, then click the More Info... button. A web page will open, and
  you should follow the instructions to download and install Java.

After installing Java, verify the installation by starting a new Terminal window
and typing:

```console
java -version
```

You should see something like java version "1.8.0_31".

### Install the Nand2Tetris Software Suite

Double-click the .zip file you've downloaded from the Nand2Tetris Software page.
OS X will automatically extract the contents of the .zip file to a folder. Move
this folder to your desktop.

To run any one of the Nand2Tetris tools on OS X, you must use the command line.
Start the Terminal application (Applications - Utilities - Terminal). Once the
terminal window appears, type the following:

```console
~/Desktop/nand2tetris/tools/HardwareSimulator.sh
```

(The first character, called a "tilde," is located to the left of the number 1
key on most keyboards.) At this point, the supplied Hardware Simulator should
started running in a new window.

From now on, when you wish to run the supplied Hardware Simulator, simply
execute the command shown above.

### Why Am I Seeing a "Command Not Found" Message?

The likely reason is that your folder location is not on the Mac OS X desktop,
which is assumed by the instructions above. Replace Desktop above with the
correct path to your nand2tetris/tools folder, or move your nand2tetris folder
to your desktop.

## Windows users

For the ".bat" batch files to work from the command line, you must add (once and
for all) the nand2tetris/toolsdirectory to your PATH variable.

To run a batch file from command-line, type its name, without the .bat extension.
If you use a 64-bit version of Windows, you need to install the 64-bit version of
Java so that 64-bit cmdexe can run Java commands in batch files. If you get the
output "'java' is not recognized..." you likely only have the 32-bit Java
installed on your computer.

You can create desktop icons and use them to invoke the interactive versions of
the following supplied tools: HardwareSimulator, Assembler, CPUEmulator and
VMEmulator. This can be done by finding the disk locations of the respective
batch files, right-clicking on them and picking "Send to > Desktop." Edit the
shortcuts' properties and set "Run" to "minimized."

## Usage

Depending on your OS and commandline, you may or may not be required to prefix
our scripts with "./" or ".\", for example:

![prefixingScriptsOnWindows](https://user-images.githubusercontent.com/12000894/145036984-da96e986-f731-405d-b150-42d56aca102b.png)

### Hardware Simulator

To invoke the hardware simulator in interactive mode, type "HardwareSimulator"
in the command line. For example:

```console
C:\...\projects\02>HardwareSimulator
```

(a window will open up, running the interactive version of the Hardware Simulator)

To invoke the hardware simulator in batch (shell/cmd) mode, type
"HardwareSimulator" in the command line together with an input ".tst" file.
For example:

```console
C:\...\projects\02>HardwareSimulator ALU.tst
```

(invokes the simulator, loads the given test script, executes it, and reports the
result). Note that the simulator's interactive mode also enables loading and
executing test scripts. Some examples of executions and their resulting outputs:

- Successful test (example):

  ```console
  C:\...\projects\02>HardwareSimulator ALU.tst
  End of script - Comparison ended successfully
  ```

- Failed test (example):

  ```console
  C:\...\projects\02>HardwareSimulator ALU.tst
  Comparison failure at line 24
  ```

- Error in the associated HDL file:

  ```console
  C:\...\projects\02>HardwareSimulator ALU.tst
  In HDL file C:\...\projects\02\ALU.hdl, Line 60, out[16]: the specified sub
  bus is not in the bus range: load ALU.hdl
  ```

### CPU Emulator and VM Emulator

Operation of these tools follow the same convention described above. If you
invoke either tool without a parameter, the tool will work in interactive mode;
if you supply a parameter (a test script), the tool will run batch-style.

### Assembler

Typing "Assembler" will start the supplied assembler in interactive mode. Typing
"Assembler xxx.asm" will assemble the specified xxx.asm file and generate a file
named xxx.hack, containing the translated binary code. Note that the assembler's
interactive mode also enables loading and translating .asm files.
Some examples of executions and their resulting outputs:

- Successful assembly (example):

  ```console
  C:\...\projects\04\fill>Assembler Fill.asm
  Assembling "c:\...\projects\04\fill\Fill.asm"
  ```

- Failed assembly (example):

  ```console
  C:\...\projects\04\fill>Assembler Fill.asm
  Assembling "C:\...\projects\04\fill\Fill.asm" In line 15, Expression expected
  ```

To compare the resulting .hack code file to some expected .hack file, use the
supplied TextComparer tool, described below.

### TextComparer

Compares two given files ignoring white space, and reports success or failure. For
example, suppose you run the hardware simulator with some test script and get a
comparison failure. If you want, you can then use the TextComparer to investigate
the problem:

```console
C:\...\projects\02>HardwareSimulator ALU.tst
Comparison failure at line 24
```

```console
C:\...\projects\02>TextComparer ALU.cmp ALU.out
Comparison failure in line 23:
|0101101110100000|0001111011010010|1|1|0|0|0|0|0001111011010010|0|0| |0101101110100000|0001111011010010|1|1|0|0|0|0|0001111011010010|0|1|
```

(Note the line number discrepancy between the reports of the two tools).

This tool stops the comparison upon find the first discrepancy. If you would
like to compare the rest of the files, we recommend using other tools such as
[KDiff](http://kdiff3.sourceforge.net/), or even the standard "diff" tool
available in most operating systems. For more info (in Hebrew) on how to use
"diff", see [this](https://www.youtube.com/watch?v=ksm2JMhJsL8).

### JackCompiler

Typing "JackCompiler fileName.jack" will compile the supplied Jack file. Typing
"JackCompiler directoryName" will compile all Jack files that are found in the
specified directory. Wildcards are not supported. Here are some examples:

- Compile the current directory:

  ```console
  C:\...\projects\09\Reflect>JackCompiler
  Compiling "c:\...\projects\09\Reflect"
  ```

- Compile a single file:

  ```console
  C:\...\projects\09\Reflect>JackCompiler Mirrors.jack
  Compiling "C:\...\projects\09\Reflect\Mirrors.jack"
  ```

- Compile the "Reflect" directory (for example):

  ```console
  C:\...\projects\09>JackCompiler Reflect
  Compiling "C:\...\projects\09\Reflect"
  ```

### Additional Help

In Windows, each batch file accepts a "/?" option that shows its intended usage.
In Mac and Unix, use "-h". For example:

```console
C:\...\projects\09>JackCompiler /?
Usage:
JackCompiler Compiles all the .jack files in the current working directory.
JackCompiler directoryName Compiles all the .jack files in the specified directory.
JackCompiler fikeName.jack Compiles the specified Jack file
```

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
