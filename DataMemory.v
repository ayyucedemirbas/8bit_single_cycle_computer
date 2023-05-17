module DataMemory (
    input [4:0] abus,
    input [7:0] dbus,
    input rd_mem, wr_mem,
    output reg [7:0] d_out
);
    reg [7:0] dm_array [0:15];
    
    always @(abus) begin
        if (rd_mem)
            d_out = dm_array[abus];
        else if (wr_mem)
            dm_array[abus] = dbus;
        else
            d_out = 8'h00;
    end
endmodule