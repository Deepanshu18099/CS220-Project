module decode_instruction (
    clk,instruction,data_path
);
  input clk;
  input [31:0]instruction;
  output reg[4:0] data_path; 
  always@(posedge clk)
begin
    case (instruction[31:26])
    
    0 : data_path<=0;    //data_path 0 means instruction is used for add
    1 : data_path<=1;    //data_path 1 means instruction is used for sub
    2 : data_path<=2;    //data_path 2 means instruction is used for addu
    3 : data_path<=3;    //data_path 3 means instruction is used for subu
    4 : data_path<=4;    //data_path 4 means instruction is used for addi
    5 : data_path<=5;    //data_path 5 means instruction is used for addiu
    6 : data_path<=6;    //data_path 6 means instruction is used for and
    7 : data_path<=7;    //data_path 7 means instruction is used for or
    8 : data_path<=8;    //data_path 8 means instruction is used for andi
    9 : data_path<=9;    //data_path 9 means instruction is used for ori
    10 : data_path<=10;  //data_path 10 means instruction is used for sll
    11 : data_path<=11;  //data_path 11 means instruction is used for srl
    12 : data_path<=12;  //data_path 12 means instruction is used for lw
    13 : data_path<=13;  //data_path 13 means instruction is used for sw
    14 : data_path<=14;  //data_path 14 means instruction is used for beq
    15 : data_path<=15;  //data_path 15 means instruction is used for bne
    16 : data_path<=16;  //data_path 16 means instruction is used for bgt
    17 : data_path<=17;  //data_path 17 means instruction is used for bgte
    18 : data_path<=18;  //data_path 18 means instruction is used for ble
    19 : data_path<=19;  //data_path 19 means instruction is used for bleq
    20 : data_path<=20;  //data_path 20 means instruction is used for j
    21 : data_path<=21;  //data_path 21 means instruction is used for jr
    22 : data_path<=22;  //data_path 22 means instruction is used for jal
    23 : data_path<=23;  //data_path 23 means instruction is used for slt
    24 : data_path<=24;  //data_path 24 means instruction is used for slti
    default : data_path<=25;
    endcase
end 
endmodule