//multiplexor to select reg wb input
module tt_wbmux (
    logic input [1:0] ctrlsig, //00 is nothing, 01 is imm, 10 is load, 11 is alu
    logic input [3:0] imm, //only 4 bits cause from instruction
    logic input [6:0] ld_mem,
    logic input [6:0] alu,
    logic output [6:0] out
    );

    always_comb begin
        case(ctrlsig):
            2'b00: begin //no operation
            end
            2'b01: begin //load immediate and extend
            out = {3'b000, imm};
            end
            2'b10: begin //load
            out = ld_mem;
            end
            2'b11: begin //alu
            out = alu;
            end
            default: begin
                out = 7'b0000000;
            end
        endcase
    end
endmodule


