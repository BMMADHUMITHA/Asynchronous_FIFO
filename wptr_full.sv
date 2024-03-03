module wptr_full(output reg wfull,
   output [3:0] waddr,
   output reg [4:0] wptr,
   input [4:0] wq2_rptr,
   input winc, wclk, wrst_n);

  reg [4:0] wbin;
  wire [4:0] wgraynext, wbinnext;
  wire wfull_val;

  always_ff @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      wbin <= 0;
      wptr <= 0;
    end else begin
      wbin <= {wbinnext, wgraynext};
      wptr <= wbin;
    end
  end

  // Memory write-address pointer (okay to use binary to address memory)
  assign waddr = wbin[3:0];
  assign wbinnext = wbin + (winc & ~wfull);
  assign wgraynext = (wbinnext >> 1) ^ wbinnext;

  // Simplified version of the full-test
  assign wfull_val = (wgraynext == {~wq2_rptr[4:3], wq2_rptr[2:0]});

  always_ff @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n)
      wfull <= 1'b0;
    else
      wfull <= wfull_val;
  end
endmodule
