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
  control_creator mycc (.opcode(opcode), .control_signals(control_signals));

  //execute and ALU stage
  logic [
  alu myalu (.control_signals(control_signals), .reg1(reg1), .reg2(reg2), .reg_out(reg_out));
  
endmodule




module control_creator (
  input logic [2:0] opcode,
  output logic [6:0] control_signals
);

  always_comb begin
    case(opcode)
      3'b000: //load
        control_signals = 7'b0010100;
      3'b001: //store
        control_signals = 7'b0001000;
      3'b010: begin //branches
        case(reg1)
          2'b00: //branch if zero
          control_signals = 7'b0000010;
          2'b01: //branch if equal
          control_signals = 7'b0000010;
          2'b10: //branch if less or equal
          control_signals = 7'b0000010;
          2'b11: //branch if greater or equal
          control_signals = 7'b0000010;
        endcase
      end
      3'b011: //ADD
      control_signals = 7'b0110001;
      3'b100: //SUB
      control_signals = 7'b1010001;
      3'b101: //AND
      control_signals = 7'b1110001;
      3'b110: //nothing for now
      control_signals = 7'b0000000;
      3'b111: //nothing for now
      control_signals = 7'b0000000;
    endcase
  end
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
  
    
    
  
      
  
                           
                           
  
