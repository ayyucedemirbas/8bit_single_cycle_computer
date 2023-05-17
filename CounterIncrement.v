module CounterIncrement (
    input [4:0] a, input [4:0] b,
    output [4:0] adder_out
);
    assign adder_out = a + b;
endmodule