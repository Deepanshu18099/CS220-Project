`include "ALU.v"
module alu_tb();
reg [31:0]instruction;
reg clk,reset;
wire [31:0] out,a,b;
alu uut(clk,reset,instruction,out,a,b);
always #5 clk=~clk; 
initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0,alu_tb);
end
 initial begin
    clk=0;
    reset=1;
        instruction=32'b00001001000011000111000000000000; 
    #1 reset=0;     
    #10 instruction=32'b00001101100010001110000000000000;
    #60 $finish;

 end

 initial begin
     $monitor("time=%d,instruction=%b,out=%d,a=%d,b=%d",$time,instruction,out,a,b);
 end

endmodule