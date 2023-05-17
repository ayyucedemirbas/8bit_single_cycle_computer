module InstructionMemory (
    input [4:0] abus,
    output reg [7:0] dbus
);
    reg [7:0] im_array [0:12];
    
    always @(abus)
        dbus = im_array[abus];
    
    initial begin
        im_array[0] = 8'h00; // Initialize Accumulator with 0 and do addition with content of DataMemory at address 0.
        im_array[1] = 8'h21; // Subtract content of accumulator with content of DataMemory at address 1.
        im_array[2] = 8'h42; // Logical AND of accumulator with content of DataMemory at address 2.
        im_array[3] = 8'h63; // Logical OR of accumulator with content of DataMemory at address 3.
        im_array[4] = 8'h84; // Bitwise complement of content of DataMemory at address 4.
        im_array[5] = 8'hA5; // Logical XOR of accumulator with content of DataMemory at address 5.
        im_array[6] = 8'hC6; // Logical XNOR of accumulator with content of DataMemory at address 6.
        im_array[7] = 8'h07; // No operation.
        im_array[8] = 8'h28; // Store content of accumulator into DataMemory at address 8.
        im_array[9] = 8'h49; // Load content of DataMemory at address 9 into accumulator.
        im_array[10] = 8'h8A; // Load content of DataMemory at address 10 into accumulator.
        im_array[11] = 8'hCB; // Load content of DataMemory at address 11 into accumulator.
        im_array[12] = 8'h0C; // Halt.
    end
endmodule