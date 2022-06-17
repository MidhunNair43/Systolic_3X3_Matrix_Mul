// Module for processing unit
parameter BW=8;
module pu(
    input clk,
    input  rst_n,
  input reg [BW-1:0] x_i,
  input reg [BW-1:0] y_i,
  output reg [BW-1:0] x_o,
  output reg [BW-1:0] y_o,
  output reg [2*BW-1:0] pu_o
  );
    
  wire [2*BW-1:0] mul;
  assign mul=x_i*y_i;
    wire [2*BW:0] pu_sum;
    
    always@(posedge clk)
      begin
        if(!rst_n)
          begin
            x_o<=0;
            y_o<=0;
            pu_o<=0;
          end
        else
          begin
            x_o<=x_i;
            y_o<=y_i;
            pu_o<=pu_o+mul;
          end      
      end
endmodule
