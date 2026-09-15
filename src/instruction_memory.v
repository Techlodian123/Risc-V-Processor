module instruction_memory (
    input  wire [63:0] address,
    output wire [31:0] instruction
);

reg [31:0] memory [0:255];

assign instruction = memory[address[9:2]];

initial begin
    // Example instructions can be placed here.
    //
    // memory[0] = 32'h00500093;
    // memory[1] = 32'h00A00113;
    // memory[2] = 32'h002081B3;
end

endmodule
