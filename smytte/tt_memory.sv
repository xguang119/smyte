//my memory for smytte
//not sure how much room is avaliable, but i'll set it to 8 smytes for now (since PRT can only print 8 addresses anyways)
//note: to syntheize into ram, change the reset behavior to not reset everything in one clock cycle

module tt_memory (
  input logic clk,
  input logic rst,
  //read stuff (load)
  input logic [2:0] ld_addr,
  output logic [6:0] ld_data,
  //write stuff (store)
  input logic [2:0] st_addr,
  input logic [6:0] st_data,
  input logic mem_write_enable,
  //print stuff (print)
  input logic [2:0] pr_addr,
  output logic [6:0] pr_data,
);

  logic [6:0] mem [2:0]; //8 symtes

  //NONE OF THE STUFF BELOW IS CORRECT
 
  


  //synch write port and reset
  always_ff @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 8; i = i + i) begin
        mem[i] <= '0;
      end
    end else if (mem_write_enable)
      mem[addr] <= data_in;
  end

  //async read port
  assign data_out = mem[addr];

endmodule
  
  
