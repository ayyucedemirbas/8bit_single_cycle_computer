module Accumulator (
    input [7:0] d_in,
    input load,
    input clk,
    output reg [7:0] d_out
);
    always @(posedge clk) begin
        if (load)
            d_out <= d_in;
    end
endmodule