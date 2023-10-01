module clk_divider #(
    DIV_VALUE = 125000000  // Pynq Z2 default PL clock
) (
    output reg clk_out,
    input clk_in,
    input resetn
);
  reg [31:0] div_counter;

  always @(posedge clk_in) begin
    if (!resetn) begin
      div_counter <= 32'b0;
      clk_out <= 1'b0;
    end else begin
      if (div_counter == DIV_VALUE) begin
        div_counter <= 32'b0;
        clk_out <= ~clk_out;
      end else div_counter <= div_counter + 1'b1;
    end
  end

endmodule
