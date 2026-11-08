//top module fr symte, targeting tinytapeout

module smytte (
  input logic clk,
  input logic rst,
  input logic [6:0] instruction,
  output logic [6:0] external_output
);
  
  logic [2:0] opcode, addr;
  logic [1:0] rd, r, bt;
  logic f;

  //basically instruction fetch and decode
  always_comb begin
    opcode = instruction[6:4]; //used in all instructions
    bt = instruction [3:2]; //used only in branches
    rd = instruction[3:2]; //used for LD, STR, ADD, and SUB
    r = instruction[1:0]; //used for LD, STR, ADD, SUB and branches
    
    f = instruction[3]; //used only for PRT
    addr = instruction[2:0]; //used only for PRT
  end


  //create simple control signals for different instructions
  logic [6:0] control_signals; // {alu_operation, reg_write, mem_write, mem_read, flags_read, flags_write};
  control_signal_controller CSC (.opcode(opcode), .control_signals(control_signals));

  //register file
  logic [1:0] regC;
  logic [6:0] dataA, dataB, dataC;
  regfile RG (.regA(rd), .regB(r), .dataA(dataA), .dataB(dataB), .regC(regC), .dataC(dataC), .write_enable(control_signals[4]));
  
  //execute and ALU stage

  alu A (.a(dataA), .b(dataB), .alu_op(control_signals[6:5]), .c(dataC), .negative(), .zero(), .carry(), .overflow());
  
endmodule




      
  
                           
                           
  
