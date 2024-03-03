//Object class


class fifo1_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(fifo1_sequence_item)

  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------
  
  rand logic [7:0] wdata;
  rand logic wclk;
  rand logic winc, wrst_n;
  rand logic rinc, rrst_n;
  
  logic [7:0] rdata; //output
  logic wfull;  // output
  logic rempty;
 
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fifo1_sequence_item");
    super.new(name);

  endfunction: new

endclass: fifo1_sequence_item