module alu (
    input wire [63:0] A,
    input wire [63:0] B,

    input wire [3:0] control,

    output reg [63:0] result,
    output wire zero
);

always @(*) begin

    case (control)

        4'b0000:
            result = A + B; // ADD

        4'b0001:
            result = A - B; // SUB

        4'b0010:
            result = A & B; // AND

        4'b0011:
            result = A | B; // OR

        4'b0100:
            result = A ^ B; // XOR

        4'b0101:
            result = ($signed(A) < $signed(B)) ? 64'd1 : 64'd0;

        4'b0110:
            result = A << B[5:0]; // SLL

        4'b0111:
            result = A >> B[5:0]; // SRL

        4'b1000:
            result = (A < B) ? 64'd1 : 64'd0; // SLTU

        4'b1001:
            result = $signed(A) >>> B[5:0]; // SRA

        default:
            result = 64'b0;

    endcase

end

assign zero = (result == 64'b0);

endmodule
