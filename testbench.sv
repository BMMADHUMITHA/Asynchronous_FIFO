
`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"


//--------------------------------------------------------
//Include Files
//--------------------------------------------------------
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;
  
  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------

   input logic [7:0] wdata,
   input logic winc, wclk, wrst_n,
   input logic rinc, rclk, rrst_n);

  logic rclk;
  
  fifo1_interface intf(.rclk(rclk));
  
  fifo1 dut(
    .rclk(intf.rclk),
    .rdata(intf.rdata),
    .wfull(intf.wfull),
    .rempty(intf.rempty),
    .wdata(intf.wdata),
    .winc(intf.winc),
	.wclk(intf.wclk),
	.wrst_n(intf.wrst_n),
	.rinc(intf.rinc),
    .rrst_n(intf.rrst_n)
  );
  
  
  //--------------------------------------------------------
  //Interface Setting
  //--------------------------------------------------------
  initial begin
    uvm_config_db #(virtual fifo1_interface)::set(null, "*", "vif", intf );
  end
  
  
  
  //--------------------------------------------------------
  //Start The Test
  //--------------------------------------------------------
  initial begin
    run_test("fifo1_test");
  end
  
  
  //--------------------------------------------------------
  //Clock Generation
  //--------------------------------------------------------
  initial begin
    rclk = 0;
    #5;
    forever begin
      rclk = ~rclk;
      #2;
    end
  end
  
  
  //--------------------------------------------------------
  //Maximum Simulation Time
  //--------------------------------------------------------
  initial begin
    #10000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
  
  
  //--------------------------------------------------------
  //Generate Waveforms
  //--------------------------------------------------------
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
  
  
endmodule: top