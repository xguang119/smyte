//my memory for smytte
//not sure how much room is avaliable, but i'll set it to 8 smytes for now (since PRT can only print 8 addresses anyways)
//note: to syntheize into ram, change the reset behavior to not reset everything in one clock cycle

module memory (
  input logic clk,
  input logic rst,
  input logic [2:0] addr,
  input logic [6:0] data_in,
  input logic write_enable,
  output logic [6:0] data_out,
);

  logic [6:0] mem [2:0]; //8 symtes
  integer i;

  //synch read port and reset
  always_ff @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 8; i = i + i) begin
        mem[i] <= '0;
      end
    end else if (write_enable)
      mem[addr] <= data_in;
  end

  //async write port
  assign data_out = mem[addr];

endmodule
  
  
