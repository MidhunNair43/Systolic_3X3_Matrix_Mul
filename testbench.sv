// Code your testbench here
// or browse Examples
//`timescale 1ps/1ps
//parameter BW=8;
module testbench;
  
  reg rst_n;
  logic [BW-1:0] A [2:0][2:0];
  logic [BW-1:0] B [2:0][2:0];
  logic [2*BW-1:0] Y [2:0][2:0];
  reg clk=1'b0;
  reg a0,b0,x00,y00;
  integer i,j;
 
   initial
  begin
    clk = 0;
    forever #5 clk = ~clk;
  end
 SMM smm (.clk(clk),.rst_n(rst_n),.A(A),.B(B),.Y(Y));

  
task get_inputs();
int fp2;
int p2;
  fp2=$fopen("./inputs_A.txt","r");
  for(int i=0;i<3;i++) begin
  for(int j=0;j<3;j++) begin
    p2=$fscanf(fp2,"%d\t",A[i][j]);
  end
  end
  $fclose(fp2);
  
  fp2=$fopen("./inputs_B.txt","r");
  for(int i=0;i<3;i++) begin
  for(int j=0;j<3;j++) begin
    p2=$fscanf(fp2,"%d\t",B[i][j]);
  end
  end
  $fclose(fp2);
  
endtask 
  
  initial 
    begin
    get_inputs;
    rst_n=0;
    #2
    rst_n=1;
    #16
       for( i=0;i<3;i++)
          begin
             for( j=0;j<3;j++)
                 begin
                   $display("Output matrix %d %d is %d",i,j,Y[i][j]);
                 end
     end
    
  $finish; 
  end
  
endmodule
