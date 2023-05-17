module ProgramCounter (
    input [7:0] d_in,
    input reset,
    input clk,
    output reg [7:0] d_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            d_out <= 8'h00;
        else
            d_out <= d_in;
    end
endmodule