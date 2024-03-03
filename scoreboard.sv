class fifo1_scoreboard extends uvm_test;
  `uvm_component_utils(fifo1_scoreboard)
  
  uvm_analysis_imp #(fifo1_sequence_item, fifo1_scoreboard) scoreboard_port;
  
  fifo1_sequence_item transactions[$];
  
  
  function new(string name = "fifo1_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  function void write(fifo1_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
  endtask: run_phase
  
  
  
  
endclass: fifo1_scoreboard