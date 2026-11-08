module regfile (
  input logic clk,
  input logic rst,
  //read ports
  input logic [1:0] regA, regB,
  //data output ports
  output logic [6:0] dataA, dataB
  //write ports
  input logic [1:0] regC,
  input logic [6:0] dataC,
  input logic write_enable
);
