module branch (
    clk,instruction,pc
);
input clk;
input [31:0]instruction;
output reg[8:0]pc=0;
reg [31:0] register[31:0];
  integer i;
  initial begin
    for ( i= 0;i<32 ;i=i+1 ) begin
        register[i]=i;
    end
  end
always @(posedge clk) begin
    for ( i= 0;i<32 ;i=i+1 ) begin
        register[i]=i;
    end
    case (instruction[31:26])
        14 : begin    //opcode value 14 means instruction is used for beq
            if(register[instruction[25:21]] == register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end

        end  
        15 : begin //opcode value 15 means instruction is used for bne
            if(register[instruction[25:21]] != register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end
        end
        16 : begin //opcode value 16 means instruction is used for bgt
            if(register[instruction[25:21]] > register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end
        end 
        17 : begin  //opcode value 17 means instruction is used for bgte
            if(register[instruction[25:21]] >= register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end
        end  
        18 : begin  //opcode value 18 means instruction is used for ble
            if(register[instruction[25:21]] < register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end
        end
       19 : begin  //opcode value 19 means instruction is used for bleq
            if(register[instruction[25:21]] <= register[instruction[20:16]] )begin
                pc=pc+1+instruction[15:0];
            end
        end
        20 : begin  //opcode value 20 means instruction is used for j 
                pc=instruction[15:0];
        end
        21 : begin  //opcode value 20 means instruction is used for jr 
                pc=register[instruction[25:21]];
            end
        22 : begin  //opcode value 20 means instruction is used for jal 
                register[31]=pc+1;
                pc=instruction[15:0];
            end
    // 23 : data_path<=23;  //data_path 23 means instruction is used for slt
    // 24 : data_path<=24;  //data_path 24 means instruction is used for slti
    endcase
    
end 
endmodule