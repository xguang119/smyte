# smyte, 7-bit cpu
small but mighty (not really)

quick simple (hopefully) weekend project of a 7-bit cpu

Bored, so want to design a small processor to tapeout on TinyTapeout.

Very limited gate count and size, so required to have the absolute minimum!
7 bit instructions will be split into 3 bit opcodes, and 2 bit registers, giving us a total of 4 registers and 8 unique instructions to work with.
I want to challenge myself by not using any resources besides what I already know, so everything is esentially from scratch.
The end goal is to be able to slowly write programs by hand to print messages, or do simple math!

Starting off, I will determine what instructions are a must.

Load and Store are a must. 
- LD r1, [r2] //loads contents of address r2 into r1
- STR r1, [r2] //stores contents of r1 into address held in r2

Branch for control and jumps*
- B [r1] //branch to address held in r1
* for branches, we get two additional bits, which i think i will use as control signals or to signify different types of branches
  2'b00: branch if zero
  2'b01: branch if equal
  2'b10: branch if less or equal
  2'b11: branch if greater or equal

  This also means the CPSR register must carry some flags
  CPSR: [Negative][Zero][Carry][Overflow][3 bits idk]
  
ALU stuff (these instructions will update CPSR)
- ADD r1, r2 //adds r1 and r2, then stores back to r1
- SUB r1, r2 //subtracts r2 from r1, then stores back to r1
- AND r1, r2 //r1 = r1 & r2 (bitwise AND)

Two extra ones if I want to add something later.

Important Instructions that are technically not 100% needed:
- Load immediate //instead of loading immediate, we can preload memory with immediate values and use Ld
- Jump //we can force a jump by using B
- Move //just store a reg to memory, then load it into another memory

Now for registers (all 7 bits):
- 4 general-purpose addressable registers 
- pc (7 bits limits us to 128 addresses of 7 bits each, though on tinytapeout we will be lucky to get 20 smytes (small byte! 7 bits))
- CPSR (flags!)
