# Project 5: Computer Architecture

In previous projects we've built the computer's basic processing and storage devices (ALU and RAM, respectively). In this project we will put everything together, yielding the complete Hack Hardware Platform. The result will be a general-purpose computer that can run programs written in the Hack machine language.
Objective

Complete the construction of the Hack CPU and the Hack hardware platform, leading up to the top-most Computer chip.


Chips

Test your chip using the supplied Memory.tst and Memory.cmp files.

The Hack CPU

Description

Test your chip using the supplied CPU.tst and CPU.cmp files. 
 

Alternative test files (less thorough but do not require using the built-in DRegister) are supplied in CPU-external.tst and CPU-external.cmp.

Testing

The platform's

top-most chip

Description

Test by running some Hack programs on the constructed chip. See more instructions below.

Testing
Contract

The computer platform that you build should be capable of executing programs written in the Hack machine language, specified in Chapter 4. Demonstrate this capability by having your Computer chip run the three test programs given below.
Testing

Testing the Memory and CPU chips: It's important to unit-test these chips before proceeding to build the overall Computer chip. Use the the test scripts and compare files listed above.

​

Testing the Computer chip: A natural way to test the overall Computer chip implementation is to have it execute some sample programs written in the Hack machine language. In order to perform such a test, one can write a test script that (i) loads the Computer.hdl chip description into the supplied Hardware Simulator, (ii) loads a machine-level program from an external .hack file into the ROM chip-part of the loaded Computer.hdl chip, and then (iii) runs the clock enough cycles to execute the loaded instructions. We supply all the files necessary to run three such tests, as follows:

Program

Add.hack

Program

Comments

Comments

Adds up the two constants 2 and 3 and writes the result in RAM[0]. Recommended test: ComputerAdd.tst and ComputerAdd.cmp. Alternative test (less thorough but only requires usage of the built-in RAM16K): ComputerAdd-external.tst and ComputerAdd-external.cmp. 

Max.hack

Program

Comments

Computes the maximum of RAM[0] and RAM[1] and writes the result in RAM[2]. Recommended test: ComputerMax.tst and ComputerMax.cmp. Alternative test (less thorough but only requires usage of the built-in RAM16K): ComputerMax-external.tst and ComputerMax-external.cmp.

Rect.hack

Program

Draws a rectangle of width 16 pixels and length RAM[0] at the top left of the screen. Recommended tests: testComputerRect.tst and ComputerRect.cmp. Alternative test (less thorough but does not require usage of any built-in chips): ComputerRect-external.tst and ComputerRect-external.cmp.

Comments

Before testing your Computer chip on any one of the above programs, read the relevant .tst file and be sure to understand the instructions given to the simulator. The TDL Guide may be a useful reference here.
Resources

See Chapter 5, the HDL Guide, the TDL Guide, (for reference), and the Hack Chip Set.

​

The tools that you need for this project are the supplied hardware simulator and the files listed above. If you've downloaded the Nand2Tstris Software Suite, these files are stored in your projects/05 folder.
Tips

Complete the computer's construction in the following order:

​

Memory: This chip includes three chip-parts: RAM16K, Screen, and Keyboard. The Screen and the Keyboard are available as built-in chips, and thus there is no need to implement them. Although the RAM16K chip was built in Project 3, we recommend using its built-in version, as it provides a debugging-friendly GUI.

​

CPU: This chip can be constructed according to the proposed CPU implementation given in Figure 5.9 of Chapter 5, using the ALU and register chips built in Projects 2 and 3, respectively. We recommend though using built-in chip-parts instead, in particular ARegister and DRegister. The built-in versions of these two chips have exactly the same interface and functionality as those of the Register chip specified in Chapter 3; however, they feature GUI side-effects that come handy for testing purposes.

​

In principle, your CPU implementation may include internal chips of your own specification, i.e. chips not mentioned in Figure 5.9 of Chapter 5. However, this is not recommended, and will most likely yield a less efficient CPU design. If you choose to create new chips not mentioned in the book, be sure to document and unit-test them carefully before you plug them into the architecture.

​

Instruction memory: Use the built-in ROM32K chip.

​

Computer: The top-most Computer chip can be constructed according to the proposed implementation shown in Figure 5.10 of Chapter 5.
Tools

All the chips mentioned in this project, including the topmost Computer chip, can be implemented and tested using the supplied hardware simulator. Here is a screen shot of testing the Rect.hack program on a Computer chip implementation.

The Rect program illustrated above draws a rectangle of width 16 pixels and length RAM[0] at the top-left of the screen. Now here is an interesting observation: normally, when you run a program on some computer, and you don't get the desired result, you conclude that the program is buggy. In our case though, the supplied Rect program is bug-free. Thus, if running this program yields unexpected results, it means that the computer platform on which it runs (Computer.hdl and/or some of its lower-level chip parts) is buggy. If that is the case, you have to debug your chips.

You should also implement the following chips:
Chip
	Description
ExtendAlu.hdl
	The inputs of ExtendALU are instruction[9], x[16], y[16].
The output is defined as follows:

    If instruction[8]=1 and instruction[7]=1 the output is identical to the regular ALU, where instruction[5]=zx, instruction[4]=nx, ..., instruction[0]=no.
    Else, if instruction[8]=0 and instruction[7]=1, the output will be a shift. If instruction[4]=0, the chip should shift y, otherwise it should shift x.
    Moreover, if instruction[5]=0 the shift will be a right-shift, otherwise it will be a left-shift.
    The "ng" and "zr" output pins behave the same as in the regular ALU
    All other inputs are undefined.

CpuMul.hdl 	This chip is an extension of the regular CPU that uses the extended ALU.
The chip should support the following inputs:
Instruction
	15
	14
	13
	12,a
	11,c1
	10,c2
	9,c3
	8,c4
	7,c5 	6,c6
Regular a-instruction
	0
	*
	 * 	 * 	*
	*
	*
	*
	*
	*
Regular c-instruction
	1
	1
	1
	*
	*
	*
	 * 	*
	*
	*
dest=D<<;jump
	1
	0
	1
	0
	1
	1
	 0 	 0 	 0 	 0
dest=A<<;jump
	1
	0
	1
	0
	1
	0
	 0 	 0 	 0 	 0
dest=M<<;jump
	1
	0
	1
	1
	1
	0
	 0 	 0 	 0 	 0
dest=D>>;jump
	1
	0
	1
	0
	0
	1
	 0 	 0 	 0 	 0
dest=A>>;jump
	1
	0
	1
	0
	0
	0
	 0 	 0 	 0 	 0
dest=M>>;jump
	1
	0
	1
	1
	0
	0
	 0 	 0 	 0
	 0
Where "<<" is a left shift, and ">>" is a right shift, both as defined in project 2.
These notations were chosen because they are actually used in real programming languages.
Shift instructions support the same "dest" and "jump" options as other c-commands, and use the same input bits to do so.
You should submit a tar file with a README and the following files: Computer.hdl, Memory.hdl, CPU.hdl, ExtendAlu.hdl, CpuMul.hdl. The tar should not contain any folder.
Please refer to the notes of project 1 regarding grading metrics and using custom chips that you created.
When implementing the CPU, you must use the built in chips Aregister and Dregister.
Writing into Memory addresses 24576 and after is undefined, and you should not deal with it.
Reading from 24576 is allowed, and reading from any larger address is not and again is undefined.
Note that assigning the A register values between 24577-32767 is allowed and valid, so you can assume that the Memory chip is not accessed when these values are assigned.
Note that the CPU supports more commands than shown in the table given to you.
For example, the CPU can perform a Nand16 operation between the outputs of the Dregister and the Aregister.
This means that our assembly language is less expressive than our CPU!
Can you think of other operations that the CPU can perform that are not exposed by our assembly language? 

## What To Submit

- You should submit a zip file with the following files:
  AUTHORS, Computer.hdl, Memory.hdl, CPU.hdl, ExtendAlu.hdl, CpuMul.hdl.
- Include other files required by your project, if there are any.
- The submission should not contain any folder.
- The AUTHORS file must contain the following:
  - In the first line: login(s) of the author(s), separated by commas and
    nothing else! If you work alone, do not include a comma.
    Logins should be identical to the names of your home folders and are
    case-sensitive.
  - Name(s), email(s) and ID(s) of the project's author(s).
  - Any remarks you have about your submission.

## The Complete Hack Chip-set

The following list provides the API for all chips we built so-far, including
those from the current project.

- Add16(a=,b=,out=). Adds up two 16-bit two's complement values.
- ALU(x=,y=,zx=,nx=,zy=,ny=,f=,no=,out=,zr=,ng=). Hack ALU.
- And(a=,b=,out=). And gate.
- And16(a=,b=,out=). 16-bit And.
- ARegister(in=,load=,out=). Address register (built-in).
- Bit(in=,load=,out=). 1-bit register.
- CPU(inM=,instruction=,reset=,outM=,writeM=,addressM=,pc=). Hack CPU.
- CpuMul(inM=,instruction=,reset=,outM=,writeM=,addressM=,pc=). Extended CPU.
- DFF(in=,out=). Data flip-flop gate (built-in).
- DMux(in=,sel=,a=,b=). Channels the input to one out of two outputs.
- DMux4Way(in=,sel=,a=,b=,c=,d=). Channels the input to one out of four outputs.
- DMux8Way(in=,sel=,a=,b=,c=,d=,e=,f=,g=,h=). A DMux with eight outputs.
- DRegister(in=,load=,out=). Data register (built-in).
- ExtendAlu(x=,y=,instruction=,out=,zr=,ng=). Extended ALU.
- HalfAdder(a=,b=,sum=, carry=). Adds up 2 bits.
- FullAdder(a=,b=,c=,sum=,carry=). Adds up 3 bits.
- Inc16(in=,out=). Sets out to in + 1.
- Keyboard(out=). Keyboard memory map (built-in).
- Memory(in=,load=,address=,out=). Data memory of the Hack platform (RAM).
- Mux(a=,b=,sel=,out=). Selects between two inputs.
- Mux16(a=,b=,sel=,out=). Selects between two 16-bit inputs.
- Mux4Way16(a=,b=,c=,d=,sel=,out=). Selects between four 16-bit inputs.
- Mux8Way16(a=,b=,c=,d=,e=,f=,g=,h=,sel=,out=). A Mux with 8 inputs.
- Nand(a=,b=,out=). Nand gate (built-in).
- Not16(in=,out=). 16-bit Not.
- Not(in=,out=). Not gate.
- Or(a=,b=,out=). Or gate.
- Or8Way(in=,out=). 8-way Or.
- Or16(a=,b=,out=). 16-bit Or.
- PC(in=,load=,inc=,reset=,out=). Program Counter.
- RAM8(in=,load=,address=,out=). 8-word RAM.
- RAM64(in=,load=,address=,out=). 64-word RAM.
- RAM512(in=,load=,address=,out=). 512-word RAM.
- RAM4K(in=,load=,address=,out=). 4K RAM.
- RAM16K(in=,load=,address=,out=). 16K RAM.
- Register(in=,load=,out=). 16-bit register.
- ROM32K(address=,out=). Instruction memory of the Hack platform (built-in).
- Screen(in=,load=,address=,out=). Screen memory map (built-in).
- ShiftLeft(in=,out=). Shift the input one bit to the left.
- ShiftRight(in=,out=). Shift the input one bit to the right.
- Xor(a=,b=,out=). Xor gate.

We went through quite a lot, huh? Great job!

## License

This file is part of nand2tetris, as taught in The Hebrew University, and
was written by Aviv Yaish. It is an extension to the specifications given
[here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).
