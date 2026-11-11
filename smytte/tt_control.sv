module tt_control (
    input logic [2:0] opcode,
    output logic [6:0] ctrlsig
    );

    logic [3:0] alu_op;
    logic reg_wr, mem_wr, ld;

    always_comb begin
        case(opcode)
            3'b000: begin //ADD
                alu_op = 4'b0001;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
            3'b001: begin //SUB
                alu_op = 4'b0010;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
            3'b010: begin //AND
                alu_op = 4'b0100;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
            3'b011: begin //OR
                alu_op = 4'b1000;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
            3'b100: begin //load
                alu_op = 4'b0000;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b1;
            end
            3'b101: begin //store
                alu_op = 4'b0000;
                reg_wr = 1'b0;
                mem_wr = 1'b1;
                ld = 1'b0;
            end
            3'b110: begin //load immediate
                alu_op = 4'b0000;
                reg_wr = 1'b1;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
            3'b111: begin //print
                alu_op = 4'b0000;
                reg_wr = 1'b0;
                mem_wr = 1'b0;
                ld = 1'b0;
            end
    end

    assign ctrlsig = {alu_op, reg_wr, mem_wr, ld};

endmodule
