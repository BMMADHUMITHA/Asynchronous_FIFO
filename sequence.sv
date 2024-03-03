// Object class
class fifo1_base_sequence extends uvm_sequence;
  `uvm_object_utils(fifo1_base_sequence)
  
  fifo1_sequence_item reset_pkt;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name= "fifo1_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  
  //--------------------------------------------------------
  //Body Task
  //--------------------------------------------------------
  task body();
    `uvm_info("BASE_SEQ", "Inside body task!", UVM_HIGH)
    
    reset_pkt = fifo1_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() with {(rrst_n==0) && (wrst_n==0);};
    finish_item(reset_pkt);
        
  endtask: body
  
  
endclass: fifo1_base_sequence



class fifo1_test_sequence extends fifo1_base_sequence;
  `uvm_object_utils(fifo1_test_sequence)
  
  fifo1_sequence_item item;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name= "fifo1_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  
  //--------------------------------------------------------
  //Body Task
  //--------------------------------------------------------
  task body();
    `uvm_info("TEST_SEQ", "Inside body task!", UVM_HIGH)
    
    item = fifo1_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {(rrst_n==1) && (wrst_n==1);};
    finish_item(item);
        
  endtask: body
  
  
endclass: fifo1_test_sequence