module ALU (
    input [7:0] a,
    input [7:0] b,
    input [2:0] opcode,
    output reg [7:0] alu_out
);
    always @(a, b, opcode) begin
        case (opcode)
            3'b000: alu_out <= a & b;     // Bitwise AND
            3'b001: alu_out <= a | b;     // Bitwise OR
            3'b010: alu_out <= a + b;     // Addition
            3'b011: alu_out <= a - b;     // Subtraction
            3'b100: alu_out <= a + 1;     // Increment
            3'b101: alu_out <= a - 1;     // Decrement
            default: alu_out <= 8'h00;    // Default: Output 0
        endcase
    end
endmodule