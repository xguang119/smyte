module smyte (
  input logic clk,
  input logic rst,
  input logic [6:0] instruction,
  output logic [6:0] external_output
);
  
  logic [2:0] opcode;
  logic [1:0] reg1, reg2;

  //basically instruction fetch and decode
  always_comb begin
    assign opcode = instruction[6:4];
    assign reg1 = instruction[3:2];
    assign reg2 = instruction[1:0];
  end

  //create simple control signals for different instructions
  logic [6:0] control_signals; // {alu_operation, reg_write, mem_write, mem_read, flags_read, flags_write};
  control_signal_controller CSC (.opcode(opcode), .control_signals(control_signals));

  //register file
  logic [6:0] regA, regB;
  regfile RG (.reg1(reg1), .reg2(reg2), .reg_write(control_signals[4]), .a(regA), .b(regB));
  

  //execute and ALU stage
  logic [6:0] regC;
  
  alu A (.a(regA), .b(regB), .alu_op(control_signals[6:5]), .c(regC), .negative(), .zero(), .carry(), .overflow());
  
endmodule


    
    
  
      
  
                           
                           
  
