interface fifo1_interface (input logic rclk);
   
  logic [7:0] rdata;
  logic wfull;
  logic rempty;
  logic [7:0] wdata;
  logic winc, wclk, wrst_n;
  logic rinc, rrst_n;

endinterface: fifo1_interface
