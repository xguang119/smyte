//top module fr symte, targeting tinytapeout

module smytte (
  input logic clk,
  input logic rst,
  input logic [6:0] instruction,
  output logic [6:0] external_output
);
  
  //declarations for instruction decode
  logic [2:0] opcode, addr;
  logic [1:0] rd, r;
  logic flag;
  logic [3:0] imm;
  logic [9:0] ctrlsig;

  //declaratinos for register file
  logic [6:0] dataA, dataB, dataWB, dataP, dataLD;

  //simple instruction decode
  always_comb begin
    opcode = instruction[6:4]; //used in all instructions
    rd = instruction[3:2]; //used for LD, STR, ADD, SUB, AND, and OR
    r = instruction[1:0]; //used for LD, STR, ADD, SUB, AND, and OR
    imm = instruction[3:0]; //used only for LI
    
    flag = instruction[3]; //used only for PRT
    addr = instruction[2:0]; //used only for PRT
  end
  
  //control
  tt_control ctrl (.opcode(opcode), .ctrlsig(ctrlsig));
  //ctrlsig = {alu_op, mux_wb, reg_wr, reg_li, mem_load, mem_store};
  
  //mutiplexor to select regfile wb
  tt_wbmux mx (.ctrl(ctrlsig[5:4]), .imm(imm), .ld_mem(dataLD), .alu(dataC), .out(dataWB));

  //regfile
  tt_regfile rf (.clk(clk), .rst(rst), 
      .regA(rd), regB(r),
      .dataA(dataA), dataB(dataB),
      .dataWB(dataWB), .ctrl(ctrlsig[3:2])
      );
  
  //ALU stage
  tt_alu A (.a(dataA), .b(dataB), .alu_op(ctrlsig[9:6]), .c(dataC));
  
  //memory stage
  tt_memory M (.clk(clk), .rst(rst),
      .ld_addr(dataB[2:0]), .ld_data(dataLD), //for load
      .st_addr(dataB[2:0]), .st_data(dataA), mem_write_enable(ctrlsig[1]), //for store
      .pr_addr(addr), .pr_data(dataP) //for print
      );

  
endmodule




      
  
                           
                           
  
