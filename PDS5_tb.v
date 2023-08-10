`include "PDS5.v"
module decode_tb (
    
);
reg clk;
reg [31:0]instruction;
wire[4:0] data_path;
 
decode_instruction uut(clk,instruction,data_path);

always #5 clk=~clk; 

initial begin
    $dumpfile("decode_tb.vcd");
    $dumpvars(0,decode_tb);
end
initial begin
        clk=1;
        instruction=32'b00010000000000000000000000000000;
    #10 instruction=32'b00000100000000000000000000000000;
    #10 instruction=32'b01000000000000000000000000000000;
    #60 $finish;

 end
initial begin
    $monitor("time=%d,instruction=%b,data_path=%d",$time,instruction,data_path);
 end

endmodule