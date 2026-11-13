module tt_control (
    input logic [2:0] opcode,
    output logic [9:0] ctrlsig
    );

    logic [3:0] alu_op;
    logic [1:0] mux_wb; //signals for mux, selecting input for reg wb
    logic reg_wr, reg_li; //signals for reg, write and load imm
    logic mem_load, mem_store; //signals for mem, load vs store

    always_comb begin
        case(opcode)
            3'b000: begin //ADD
                alu_op = 4'b0001;
                mux_wb = 2'b11;
                reg_wr = 1'b1;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
            3'b001: begin //SUB
                alu_op = 4'b0010;
                mux_wb = 2'b11;
                reg_wr = 1'b1;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
            3'b010: begin //AND
                alu_op = 4'b0100;
                mux_wb = 2'b11;
                reg_wr = 1'b1;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
            3'b011: begin //OR
                alu_op = 4'b1000;
                mux_wb = 2'b11;
                reg_wr = 1'b1;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
            3'b100: begin //load
                alu_op = 4'b0000;
                mux_wb = 2'b10;
                reg_wr = 1'b1;
                reg_li = 1'b0;
                mem_load = 1'b1;
                mem_store = 1'b0;
            end
            3'b101: begin //store
                alu_op = 4'b0000;
                mux_wb = 2'b00;
                reg_wr = 1'b0;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b1;
            end
            3'b110: begin //load immediate
                alu_op = 4'b0000;
                mux_wb = 2'b01;
                reg_wr = 1'b1;
                reg_li = 1'b1;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
            //ignore print for now
            3'b111: begin //print
                alu_op = 4'b0000;
                mux_wb = 2'b00;
                reg_wr = 1'b0;
                reg_li = 1'b0;
                mem_load = 1'b0;
                mem_store = 1'b0;
            end
    end

    assign ctrlsig = {alu_op, mux_wb, reg_wr, reg_li, mem_load, mem_store};

endmodule
