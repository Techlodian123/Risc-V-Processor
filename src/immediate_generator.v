module immediate_generator (
    input  wire [31:0] instruction,
    input  wire [6:0]  opcode,

    output reg  [63:0] immediate
);

always @(*) begin

    case (opcode)

        // I-type
        7'b0010011,     // ALU immediate
        7'b0000011,     // LOAD
        7'b1100111:     // JALR
        begin
            immediate = {{52{instruction[31]}},
                         instruction[31:20]};
        end

        // S-type
        7'b0100011:
        begin
            immediate = {{52{instruction[31]}},
                         instruction[31:25],
                         instruction[11:7]};
        end

        // B-type
        7'b1100011:
        begin
            immediate = {{51{instruction[31]}},
                         instruction[31],
                         instruction[7],
                         instruction[30:25],
                         instruction[11:8],
                         1'b0};
        end

        // U-type
        7'b0110111,     // LUI
        7'b0010111:     // AUIPC
        begin
            immediate = {{32{instruction[31]}},
                         instruction[31:12],
                         12'b0};
        end

        // J-type
        7'b1101111:     // JAL
        begin
            immediate = {{43{instruction[31]}},
                         instruction[31],
                         instruction[19:12],
                         instruction[20],
                         instruction[30:21],
                         1'b0};
        end

        default:
            immediate = 64'b0;

    endcase

end

endmodule
