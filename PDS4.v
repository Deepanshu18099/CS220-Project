
module vedaInstruction(clk, rst, write_enable, address, datain, mode, dataout);
    input clk, rst, write_enable, mode;
    input [8:0] address;
    input [31:0] datain;
    output reg [31:0] dataout;
    reg [31:0] mem [511:0];
    integer i;
    initial begin
            // mem[0]<=32'b01111101011010110000000000000001;
            mem[0]<=32'b01011100000100000000000001100100;
            mem[1]<=32'b01011100000010000000000000000000;
            mem[2]<=32'b01011100000010010000000000000000;
            mem[3]<=32'b01011100000100010000000000000101;
            mem[4]<=32'b01011100000100100000000000000101;
            mem[5]<=32'b00000000000100000101000000000000;
            mem[6]<=32'b00000000000100000101100000000000;
            mem[7]<=32'b00010010001100011111111111111111;

            mem[8]<=32'b01011100000010010000000000000000;
            mem[9]<=32'b00010010010100101111111111111111;
            mem[10]<=32'b00000000000100000101100000000000;


            mem[11]<=32'b00110001011100110000000000000000;
            // mem[12]<=32'b11111001011010110000000000000001;
            mem[12]<=32'b00010001011010110000000000000001;
            // mem[13]<=32'b01111101011010110000000000000001;
            mem[13]<=32'b00110001011101000000000000000000;
            mem[14]<=32'b00010001001010010000000000000001;

            mem[15]<=32'b011000_10011_10100_0110000000000000;
            mem[16]<=32'b00111101100000000000000000000100;

            mem[17]<=32'b00110101011100110000000000000000;
            mem[18]<=32'b00110101011101001111111111111111;
            mem[19]<=32'b00110001011101000000000000000000;


            mem[20]<=32'b00111101001100101111111111110111;

            mem[21]<=32'b00010001000010000000000000000001;
            mem[22]<=32'b00111101000100011111111111110010;

            mem[23]<=32'b01011100000010000000000000000000;
            mem[24]<=32'b00010010001100010000000000000001;
            mem[25]<=32'b001100_10000_10001_0000000000000000;
            mem[26]<=32'b001100_10000_10010_0000000000000001;
            mem[27]<=32'b001100_10000_10011_0000000000000010;
            mem[28]<=32'b001100_10000_10100_0000000000000011;
            mem[29]<=32'b001100_10000_10101_0000000000000100;
            mem[30]<=32'b011111_10000_10101_0000000000000100;
            mem[100]<=90;
            mem[101]<=80;
            mem[102]<=70;
            mem[103]<=75;
            mem[104]<=95;
            

            
    end
//     initial begin
//    $monitor("%d %d %d %d %d",mem[100],mem[101],mem[102],mem[103],mem[104]);
    
// end
    always @( * ) begin
        if(rst) begin
            for(i = 0; i < 512; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else if(write_enable) begin
            if(mode == 0) begin
                 mem[address] <= datain;
                // dataout <= datain;
            end
            else begin
                // dataout <= mem[address];
                mem[address] <= datain;
            end
        end
        else begin
            dataout <= mem[address];
        end
    end
endmodule

module instruction_fetch(clk,reset,pc,instruction);
    input clk,reset;
    output reg [8:0] pc=9'b000000000;
    output reg[31:0] instruction;
    wire [31:0]instruction_wire;
vedaInstruction uut(clk, 1'b0, 1'b0, pc, 0, 1'b0, instruction_wire);
always @(*) begin
    instruction <= instruction_wire; 
end
always @(posedge clk ) begin
    if(reset) begin
        pc<=0;
    end
    else begin
        pc <= pc + 1;
    end
        
    end
endmodule