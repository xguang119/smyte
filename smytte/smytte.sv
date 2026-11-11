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
  logic [6:0] ctrlsig;

  //declaratinos for register file
  logic [6:0] dataA, dataB, dataWB, dataP;

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

  //regfile

  tt_regfile rf (.clk(clk), .rst(rst), 
      .regA(rd), regB(r),
      .dataA(dataA), dataB(dataB),
      .regWB(rd), .dataWB(dataWB), .write_enable(ctrlsig[2])
      );
  
  //ALU stage
  tt_alu A (.a(dataA), .b(dataB), .alu_op(ctrlsig[6:3]), .c(dataC));
  
  //memory stage
  tt_memory M (.clk(clk), .rst(rst),
      .read_addr(dataB[2:0]), .data_out(dataLD), //for load
      .wr_addr(dataB[2:0]), .data_in(dataA), mem_write_enable(ctrlsig[1]), //for store
      .pr_addr(addr), .pr_data(dataP) //for print
      );

  //multiplexor to select either load or load imm data
  assign dataL = (ctrlsig[0]) ? dataLD : {3'b000, imm};

  //multiplexor to select either ALU data or load data
  assign dataWB = (ctrlsig[6] == 0) ? dataC : dataL; 
  
endmodule




      
  
                           
                           
  
