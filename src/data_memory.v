module data_memory (
    input wire        clk,

    input wire        mem_read,
    input wire        mem_write,

    input wire [63:0] address,
    input wire [63:0] write_data,

    output wire [63:0] read_data
);

reg [63:0] memory [0:255];

assign read_data =
    mem_read ? memory[address[9:3]] : 64'b0;

always @(posedge clk) begin

    if (mem_write)
        memory[address[9:3]] <= write_data;

end

endmodule
