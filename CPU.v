module CPU (
    input clk,
    input reset,
    output reg [7:0] accumulator_out,
    output reg [7:0] data_memory_out
);

    wire [2:0] opcode;
    wire [7:0] instruction_out;
    wire [7:0] alu_out;
    wire [4:0] counter_out;
    wire [7:0] pc_out;
    wire rd_mem, wr_mem, ac_src, ld_ac, pc_src, jmp_uncond;

    Accumulator accumulator (
        .d_in(alu_out),
        .load(ld_ac),
        .clk(clk),
        .d_out(accumulator_out)
    );

    Adder adder (
        .a(accumulator_out),
        .b(data_memory_out),
        .sum(alu_out)
    );

    ALU alu (
        .a(accumulator_out),
        .b(data_memory_out),
        .opcode(opcode),
        .alu_out(alu_out)
    );

    Controller controller (
        .opcode(opcode),
        .rd_mem(rd_mem),
        .wr_mem(wr_mem),
        .ac_src(ac_src),
        .ld_ac(ld_ac),
        .pc_src(pc_src),
        .jmp_uncond(jmp_uncond)
    );

    CounterIncrement counter_increment (
        .a(counter_out),
        .b(1),
        .adder_out(counter_out)
    );

    DataMemory data_memory (
        .abus(counter_out),
        .dbus(alu_out),
        .rd_mem(rd_mem),
        .wr_mem(wr_mem),
        .d_out(data_memory_out)
    );

    InstructionMemory instruction_memory (
        .abus(counter_out),
        .dbus(instruction_out)
    );

    Mux2x1 mux_pc_src (
        .a(pc_out),
        .b(counter_out),
        .sel(pc_src),
        .out(pc_out)
    );

    ProgramCounter program_counter (
        .d_in(pc_out),
        .reset(reset),
        .clk(clk),
        .d_out(counter_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

endmodule
