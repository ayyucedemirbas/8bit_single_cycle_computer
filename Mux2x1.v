module Mux2x1 (
    input [7:0] a,
    input [7:0] b,
    input sel,
    output reg [7:0] out
);
    always @* begin
        if (sel)
            out = b;
        else
            out = a;
    end
endmodule