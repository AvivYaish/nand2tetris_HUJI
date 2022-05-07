# Project 5: Computer Architecture

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
