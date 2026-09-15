module mux (
    input wire [63:0] input0,
    input wire [63:0] input1,

    input wire select,

    output wire [63:0] output_data
);

assign output_data =
    select ? input1 : input0;

endmodule
