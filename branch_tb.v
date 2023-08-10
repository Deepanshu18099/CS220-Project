`include "branch.v"
module branch_tb ;
 reg [31:0]instruction;
reg clk;
wire [8:0] pc;
branch uut(clk,instruction,pc);
always #5 clk=~clk; 
initial begin
    $dumpfile("branch_tb.vcd");
    $dumpvars(0,branch_tb);
end
 initial begin
    clk=0;
        instruction=32'b00111001000010000000000000011100;     
    #10 instruction=32'b00111101000011000000000000011100;
    #10 instruction=32'b01000011000011000000000000011100;
    #10 $finish;

 end

 initial begin
     $monitor("time=%d,instruction=%b,pc=%d",$time,instruction,pc);
 end
   
endmodule