//my memory for smytte
//not sure how much room is avaliable, but i'll set it to 8 smytes for now (since PRT can only print 8 addresses anyways)
//note: to syntheize into ram, change the reset behavior to not reset everything in one clock cycle

module tt_memory (
  input logic clk,
  input logic rst,
  //read stuff (load)
  input logic [2:0] ld_addr,
  input logic mem_load,
  output logic [6:0] ld_data,
  //write stuff (store)
  input logic [2:0] st_addr,
  input logic [6:0] st_data,
  input logic mem_store,
  //print stuff (print)
  input logic [2:0] pr_addr,
  output logic [6:0] pr_data,
);

  logic [6:0] mem [2:0]; //8 symtes

  //synch write and read port
  always_ff @(posedge clk) begin
      if (mem_store) begin
          mem[st_addr] <= st_data;
      end else if (mem_load) begin
          ld_data <= mem[ld_addr];
      end
  end

  //no print function
  


  //async read port
  //assign ld_data = mem[ld_addr];

endmodule
  
  
