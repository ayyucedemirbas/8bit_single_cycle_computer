module Controller (
    input [2:0] opcode,
    output reg rd_mem, wr_mem, ac_src, ld_ac, pc_src, jmp_uncond
);
    always @(opcode) begin
        case (opcode)
            3'b000: begin  // Load accumulator from memory
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b001: begin  // Subtract
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b010: begin  // AND
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b011: begin  // OR
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b100: begin  // Complement
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b1;
            end
            3'b101: begin  // XOR
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b110: begin  // XNOR
                rd_mem = 1'b1;
                wr_mem = 1'b0;
                ld_ac = 1'b1;
                ac_src = 1'b0;
            end
            3'b111: begin  // Store accumulator to memory
                rd_mem = 1'b0;
                wr_mem = 1'b1;
                ld_ac = 1'b0;
                ac_src = 1'b0;
            end
            default: begin
                rd_mem = 1'b0;
                wr_mem = 1'b0;
                ld_ac = 1'b0;
                ac_src = 1'b0;
            end
        endcase
        pc_src = 1'b1;      // Increment PC
        jmp_uncond = 1'b0;  // Conditional jump not enabled
    end
endmodule