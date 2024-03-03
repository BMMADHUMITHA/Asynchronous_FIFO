module rptr_empty (output reg rempty,
   output [3:0] raddr,
   output reg [4:0] rptr,
   input [4:0] rq2_wptr,
   input rinc, rclk, rrst_n);

  reg [4:0] rbin;
  wire [4:0] rgraynext, rbinnext;
  wire rempty_val;

  always_ff @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
      rbin <= 0;
      rptr <= 0;
    end else begin
      rbin <= {rbinnext, rgraynext};
      rptr <= rbin;
    end
  end

  // Memory read-address pointer (okay to use binary to address memory)
  assign raddr = rbin[3:0];
  assign rbinnext = rbin + (rinc & ~rempty);
  assign rgraynext = (rbinnext >> 1) ^ rbinnext;

  // FIFO empty when the next rptr == synchronized wptr or on reset
  always_ff @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n)
      rempty <= 1'b1;
    else
      rempty <= rempty_val;
  end

  // Calculate the value for rempty based on the comparison
  assign rempty_val = (rgraynext == rq2_wptr);

endmodule
