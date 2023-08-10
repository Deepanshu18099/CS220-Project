`include "PDS4.v"
module PDS4_tb ();
 reg clk;
 reg reset;
 wire [8:0] ProgramCounter;
 wire [31:0] instruction;

 instruction_fetch uut(
    .clk(clk),
    .reset(reset),
    .pc(ProgramCounter),
    .instruction(instruction)
 );
always #5 clk=~clk; 
initial begin
    $dumpfile("PDS4_tb.vcd");
    $dumpvars(0,PDS4_tb);
end
 initial begin
    
    clk=0;
    reset=1;
    #10 reset=0;
    #60 $finish;

 end

 initial begin
     $monitor("time=%d,instruction=%b,program_Counter=%d",$time,instruction,ProgramCounter);
 end

 endmodule