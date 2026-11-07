module smyte (
  input clk,
  input rst,
  input [6:0] instruction,
  output [6:0] external_output
);

  
  logic [2:0] opcode;
  logic [1:0] reg1, reg2;

  //basically instruction fetch and decode
  always_comb @(*) begin
    assign opcode = instruction[6:4];
    assign reg1 = instruction[3:2];
    assign reg2 = instruction[1:0];
  end

  //create simple control signals for different instructions
  //note, move this into own module later
  logic [6:0] control_signals;
  
  always_comb @(*) begin
    case(opcode)
      3'b000: begin //load
        control_signals = {7'b
      end
      3'b001: begin //store
      end
      3'b010: begin //branches
        case(reg1)
          2'b00: begin //branch if zero
          end
          2'b01: begin //branch if equal
          end
          2'b10: begin //branch if less or equal
          end
          2'b11: begin //branch if greater or equal
          end
        endcase
      end
      3'b011: begin //ADD
      end
      3'b100: begin //SUB
      end
      3'b101: begin //AND
      end
      3'b110: begin //nothing for now
      end
      3'b111: begin //nothing for now
      end
    endcase
  end
                           
  
