module control_signal_controller (
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
