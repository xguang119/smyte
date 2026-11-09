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

  logic [6:0] registers [1:0];
  intger i;

  //async reads
  assign dataA = registers[regA];
  assign dataB = registers[regB];

  //synch write
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      for (i = 0; i < 4; i = i + i) begin
        registers[i] <= '0;
      end
    end else if (write_enable) begin
      registers[regC] <= dataC;
    end
  end
endmodule
