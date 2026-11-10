# smyte, 7-bit cpu
small but mighty (not really)

quick simple (hopefully) weekend project of a 7-bit cpu.
I got bored, so want to design a small processor to tapeout on TinyTapeout.

I think I will try to make two versions, on which is a more "traditional" cpu in which programs are loaded into memory, then the pc starts execution from the first line.
Another which will target tinytapeout, such that you can input instructions, which will instantly execute.
The main differences would be the lack of avaliable memory, the function of a program counter, and possible instruction to view registers and memory.

My head tells me doing the first, then the second, would be easier.
My heart tells me the second is more fun.

## Instruction Set
Very limited gate count and size, so required to have the absolute minimum!
7 bit instructions will be split into 3 bit opcodes, and 2 bit registers, giving us a total of 4 registers and 8 unique instructions to work with.
I want to challenge myself by not using any resources besides what I already know, so everything is esentially from scratch.
The end goal is to be turing complete, ignoring the potential lack of memory

Starting off, I will determine what instructions are a must / make life easier.

### Instruction definition
Load and Store are a must. 
- LD r1, [r2] //loads contents of address r2 into r1
- STR r1, [r2] //stores contents of r1 into address held in r2
- LI # //loads immediate into r1 (thus allowing a 4 bit immediate)

Branching for control and jumps (tinytapeout version wont even use this)
- B [r1] //branch to address held in r1
  for branches, we get two additional bits, which will signify different branch types
    2'b00: branch if zero
    2'b01: branch if equal
    2'b10: branch if less than or equal
    2'b11: branch no matter what

    This also means we need a flags register 
  
ALU stuff (these instructions will update FR)
- ADD r1, r2 //adds r1 and r2, then stores back to r1
- SUB r1, r2 //subtracts r2 from r1, then stores back to r1

Misc. (probably only for tinytapeout version)
- PRT #, [addr] //prints addr contents into output, # selects if reg or memory

### Instruction Formats
- C: [6:4][3:2][1:0] = {opcode, rd, ro} //used for LD, STR, ADD, and SUB
- B: [6:4][3:2][1:0] = {opcode, type, r} //used for all branch instructions
- H: [6:4][3:0] = {opcode, immediate} //used for LI
- S: [6:4][3][2:0] = {opcode, type, addr/reg} //used for PRT

## Register Set
Now for registers (all 7 bits):
- 4 general-purpose addressable registers 
- pc (7 bits limits us to 128 addresses of 7 bits each, though on tinytapeout we will be lucky to get 20 smytes (small byte! aka 7 bits))
- fr (flag register: [Negative][Zero][Carry][Overflow][3 bits idk]



