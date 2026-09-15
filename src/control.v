module control_unit (
    input wire [6:0] opcode,

    output reg       reg_write,
    output reg       mem_read,
    output reg       mem_write,
    output reg       mem_to_reg,

    output reg       alu_src,
    output reg       branch,
    output reg       jump,

    output reg       auipc,
    output reg       lui
);

always @(*) begin

    reg_write = 1'b0;
    mem_read  = 1'b0;
    mem_write = 1'b0;
    mem_to_reg = 1'b0;

    alu_src = 1'b0;
    branch  = 1'b0;
    jump    = 1'b0;

    auipc = 1'b0;
    lui   = 1'b0;

    case (opcode)

        // R-type
        7'b0110011:
        begin
            reg_write = 1'b1;
            alu_src   = 1'b0;
        end

        // I-type ALU
        7'b0010011:
        begin
            reg_write = 1'b1;
            alu_src   = 1'b1;
        end

        // Load
        7'b0000011:
        begin
            reg_write = 1'b1;
            mem_read  = 1'b1;
            mem_to_reg = 1'b1;
            alu_src   = 1'b1;
        end

        // Store
        7'b0100011:
        begin
            mem_write = 1'b1;
            alu_src   = 1'b1;
        end

        // Branch
        7'b1100011:
        begin
            branch = 1'b1;
        end

        // JAL
        7'b1101111:
        begin
            reg_write = 1'b1;
            jump = 1'b1;
        end

        // JALR
        7'b1100111:
        begin
            reg_write = 1'b1;
            jump = 1'b1;
            alu_src = 1'b1;
        end

        // LUI
        7'b0110111:
        begin
            reg_write = 1'b1;
            lui = 1'b1;
        end

        // AUIPC
        7'b0010111:
        begin
            reg_write = 1'b1;
            auipc = 1'b1;
        end

        default:
        begin
        end

    endcase

end

endmodule
