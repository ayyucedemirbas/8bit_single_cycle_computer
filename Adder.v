module Adder (
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] sum
);
    always @(a, b) begin
        sum = a + b;
    end
endmodule