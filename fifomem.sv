module fifomem (output logic [7:0] rdata,
   input logic [7:0] wdata,
   input logic [3:0] waddr, raddr,
   input logic wclken, wfull, wclk);

  // Check if VENDORRAM is defined
  `ifdef VENDORRAM
    // Instantiation of a vendor's dual-port RAM
    vendor_ram mem (.dout(rdata), .din(wdata),
                    .waddr(waddr), .raddr(raddr),
                    .wclken(wclken),
                    .wclken_n(wfull), .clk(wclk));
  `else
    // RTL Verilog memory model
    reg [7:0] mem [0:15];
    assign rdata = mem[raddr];

    always_ff @(posedge wclk)
    begin
      if (wclken && !wfull)
        mem[waddr] <= wdata;
    end
  `endif
endmodule
