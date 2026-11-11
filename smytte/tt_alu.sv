module tt_alu (
    input  logic [6:0] a,
    input  logic [6:0] b,
    input  logic [3:0] alu_op,

    output logic [6:0] c,
);
  
    always_comb begin
        case (alu_op)
            4'b0000: begin //no operation
               c = '0;
            end
            4'b0001: begin //add
               c = a + b; 
            end
            4'b0010: begin //sub
               c = a - b;
            end
            4'b0100: begin //AND
               c = a & b;
            end
            4'b1000: begin //OR
               c = a | b;
            end
            default: begin //invalid operation
               c = '0;
            end
        endcase
    end

endmodule
