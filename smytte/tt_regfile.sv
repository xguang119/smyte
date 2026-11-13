module tt_regfile (
  input logic clk,
  input logic rst,
  //read ports
  input logic [1:0] regA, regB,
  //data output ports
  output logic [6:0] dataA, dataB
  //write ports
  input logic [6:0] dataWB,
  input logic [1:0] ctrl 
);

  logic [6:0] registers [1:0];
  integer i;

  logic li = ctrl[0]; //control signal for loading immediate
  logic we = ctrl[1]; //control signal to enable writing reg
  logic 
  //control
  assign 

  //async reads
  assign dataA = registers[regA];
  assign dataB = registers[regB];

  //synch write
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      for (i = 0; i < 4; i = i + i)
        registers[i] <= '0;
    end 
    else if (write_enable) begin
        if (li)
          registers[2'b00] <= dataWB;
        else
          registers[regWB] <= dataWB;
    end
  end
endmodule
