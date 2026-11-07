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

  //execute and ALU stage
  alu A (.a(), .b(), .alu_op(control_signals[6:5]), .c(), .negative(), .zero(), .carry(), .overflow());
  
endmodule

module alu (
    input  logic [6:0] a,
    input  logic [6:0] b,
    input  logic [1:0] alu_op,

    output logic [6:0] c,
    output logic       negative,
    output logic       zero,
    output logic       carry,
    output logic       overflow
);

    logic [7:0] temp;
  
    always_comb begin
        c        = 7'b0;
        negative = 1'b0;
        zero     = 1'b0;
        carry    = 1'b0;
        overflow = 1'b0;
        temp     = 8'b0;

        case (alu_op)
            2'b00: begin
            end
            2'b01: begin //add
                temp = {1'b0, a} + {1'b0, b};
                c    = temp[6:0];
                carry = temp[7];
                overflow = (a[6] == b[6]) &&
                           (c[6] != a[6]);
            end
            2'b10: begin //sub
                c = a - b;
                carry = (a >= b);
                overflow = (a[6] != b[6]) &&
                           (c[6] != a[6]);
            end
            2'b11: begin //AND
                c = a & b;
            end
            default: begin
                c = 7'b0;
            end
        endcase
        // These flags describe the ALU result
        negative = c[6];
        zero     = (c == 7'b0);
    end

endmodule
  
    
    
  
      
  
                           
                           
  
