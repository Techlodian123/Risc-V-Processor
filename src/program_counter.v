module program_counter (
    input  wire        clk,
    input  wire        reset,
    input  wire [63:0] next_pc,
    output reg  [63:0] pc
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 64'b0;
    else
        pc <= next_pc;
end

endmodule
