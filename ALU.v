module alu (
    clk,reset,instruction,out,a,b
);
  input clk,reset;
  input [31:0]instruction; 
  output reg[31:0] out,a,b;
  reg [31:0] register[31:0];
//   output [8:0] ProgramCounter
  integer i;
  initial begin
    for ( i= 0;i<32 ;i=i+1 ) begin
        register[i]=i;
    end
  end
  always@(posedge clk)
begin
    if(reset)begin
        for ( i= 0;i<32 ;i=i+1 ) begin
        register[i]=i;
    end
    end
    case (instruction[31:26]) 
    0 : begin
        register[instruction[15:11]] = $signed(register[instruction[25:21]]) + $signed(register[instruction[20:16]]);     //data_path 0 means instruction is used for add
        a=register[instruction[25:21]];
        b=register[instruction[20:16]];
        out=register[instruction[15:11]];
    end 
    1 :begin
        register[instruction[15:11]] = $signed(register[instruction[25:21]]) - $signed(register[instruction[20:16]]);     //data_path 1 means instruction is used for sub
          a=register[instruction[25:21]];
          b=register[instruction[20:16]];
          out=register[instruction[15:11]];
    end 
    2 :begin
        register[instruction[15:11]]=register[instruction[25:21]]+register[instruction[20:16]];     //data_path 2 means instruction is used for addu
        a=register[instruction[25:21]];
        b=register[instruction[20:16]];
        out=register[instruction[15:11]];
    end 
    3 :begin
        register[instruction[15:11]]=register[instruction[25:21]]-register[instruction[20:16]];     //data_path 3 means instruction is used for subu
        a=register[instruction[25:21]];
        b=register[instruction[20:16]];
        out=register[instruction[15:11]];
    end 
    4 : register[instruction[20:16]] = $signed(register[instruction[25:21]]) + $signed(instruction[15:0]);     //data_path 4 means instruction is used for addi
    5 : register[instruction[20:16]] = register[instruction[25:21]] + instruction[15:0];      //data_path 5 means instruction is used for addiu
    6 : register[instruction[15:11]]=register[instruction[25:21]] & register[instruction[20:16]];     //data_path 6 means instruction is used for and
    7 : register[instruction[15:11]]=register[instruction[25:21]] | register[instruction[20:16]];      //data_path 7 means instruction is used for or
    8 : register[instruction[20:16]] = register[instruction[25:21]] & instruction[15:0];    //data_path 8 means instruction is used for andi
    9 : register[instruction[20:16]] = register[instruction[25:21]] | instruction[15:0];    //data_path 9 means instruction is used for ori
    10 :register[instruction[15:11]]=register[instruction[20:16]]<<register[instruction[10:6]];  //data_path 10 means instruction is used for sll
    11 :register[instruction[15:11]]=register[instruction[20:16]]>>register[instruction[10:6]];  //data_path 11 means instruction is used for srl
    
    endcase
end 
endmodule