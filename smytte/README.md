## Instruction Set (tinytapeout version)
Very limited gate count and size, so required to have the absolute minimum!
7 bit instructions will be split into 3 bit opcodes, and 2 bit registers, giving us a total of 4 registers and 8 unique instructions to work with.
I want to challenge myself by not using any resources besides what I already know, so everything is esentially from scratch.

Starting off, I will determine what instructions are a must / make life easier.

### Instruction definition
Load and Store are a must. 
- LD r1, [r2] //loads contents of address r2 into r1
- STR r1, [r2] //stores contents of r1 into address held in r2
- LI r1, # //loads # (4-bit immediate) into r1

ALU stuff
- ADD r1, r2 //adds r1 and r2, then stores back to r1
- SUB r1, r2 //subtracts r2 from r1, then stores back to r1
- AND r1, r2 //ANDs r2 and r1, stores back to r1
- OR r1, r2  //ORs r2 and r1, stores back to r1

Misc.
- PRT #, [addr] //prints addr contents into output, # selects if reg or memory

### Instruction Formats
- G: [6:4][3:2][1:0] = {opcode, rd, ro} //used for LD, STR, ADD, SUB, AND and OR
- I: [6:4][3:0] = {opcode, imm} //used for LI
- P: [6:4][3][2:0] = {opcode, type, addr/reg} //used for PRT

## Register Set
Now for registers (all 7 bits):
- 4 general-purpose addressable registers

## Memory
8 memory addresses (each 7 bits)

