// Code your design here
`include "pu.sv"
//parameter BW=8;
module SMM (
  input clk,
  input reg rst_n,
  input logic [BW-1:0] A [2:0][2:0],
  input logic [BW-1:0] B [2:0][2:0],
  output logic [2*BW-1:0] Y [2:0][2:0]);
 
  reg [2:0] counter=0;
  reg [BW-1:0] a0,a1,a2;
  reg [BW-1:0] b0,b1,b2;
  reg [BW-1:0] x00,x01,x02,x10,x11,x12,x20,x21,x22;
  reg [BW-1:0] y00,y01,y02,y10,y11,y12,y20,y21,y22;
  
 
  
      pu p_00(.clk(clk),.rst_n(rst_n),.x_i(a0),.y_i(b0),.x_o(x00),.y_o(y00),.pu_o(Y[0][0]));
      pu p_01(.clk(clk),.rst_n(rst_n),.x_i(x00),.y_i(b1),.x_o(x01),.y_o(y01),.pu_o(Y[0][1]));
      pu p_02(.clk(clk),.rst_n(rst_n),.x_i(x01),.y_i(b2),.x_o(x02),.y_o(y02),.pu_o(Y[0][2]));
      pu p_10(.clk(clk),.rst_n(rst_n),.x_i(a1),.y_i(y00),.x_o(x10),.y_o(y10),.pu_o(Y[1][0]));
      pu p_11(.clk(clk),.rst_n(rst_n),.x_i(x10),.y_i(y01),.x_o(x11),.y_o(y11),.pu_o(Y[1][1]));
      pu p_12(.clk(clk),.rst_n(rst_n),.x_i(x11),.y_i(y02),.x_o(x12),.y_o(y12),.pu_o(Y[1][2]));
      pu p_20(.clk(clk),.rst_n(rst_n),.x_i(a2),.y_i(y10),.x_o(x20),.y_o(y20),.pu_o(Y[2][0]));
      pu p_21(.clk(clk),.rst_n(rst_n),.x_i(x20),.y_i(y11),.x_o(x21),.y_o(y21),.pu_o(Y[2][1]));
      pu p_22(.clk(clk),.rst_n(rst_n),.x_i(x21),.y_i(y12),.x_o(x22),.y_o(y22),.pu_o(Y[2][2]));
  
  always@(posedge clk)
    begin
      //$display("Hello %d",rst_n);
      //$display("%d",counter);
      //$display("%d",Y[0][2]);
      case(counter)
         'd0: begin a0<=0; b0<=0; a1<=0; b1<=0; a2<=0; b2<=0; end
         'd1: begin a0<=A[0][0]; b0<=B[0][0]; end
         'd2: begin a0<=A[0][1]; b0<=B[1][0]; a1<=A[1][0]; b1<=B[0][1]; end
         'd3: begin a0<=A[0][2]; b0<=B[2][0]; a1<=A[1][1]; b1<=B[1][1]; a2<=A[2][0]; b2<=B[0][2]; end
         'd4: begin a0<=0;       b0<=0;       a1<=A[1][2]; b1<=B[2][1]; a2<=A[2][1]; b2<=B[1][2]; end
         'd5: begin a0<=0;       b0<=0;       a1<=0;       b1<=0;       a2<=A[2][2]; b2<=B[2][2]; end
         'd6: begin a0<=0; b0<=0; a1<=0; b1<=0; a2<=0; b2<=0; end
         'd7: begin a0<=0; b0<=0; a1<=0; b1<=0; a2<=0; b2<=0; end
         default: begin a0<=0; b0<=0; a1<=0; b1<=0; a2<=0; b2<=0; end
      endcase
      
     
     counter<=counter+1;
   end
endmodule
