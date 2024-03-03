
class fifo1_monitor extends uvm_monitor;
  `uvm_component_utils(fifo1_monitor)
  
  virtual fifo1_interface vif;
  fifo1_sequence_item item;
  
  uvm_analysis_port #(fifo1_sequence_item) monitor_port;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fifo1_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH)
    
    monitor_port = new("monitor_port", this);
    
    if(!(uvm_config_db #(virtual fifo1_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    forever begin
      item = fifo1_sequence_item::type_id::create("item");
      
      wait(!vif.rrst_n);
	  wait(!vif.wrst_n);
      
      //sample inputs
      @(posedge vif.rclk);
      item.wdata = vif.wdata;
      item.winc = vif.winc;
	  item.rinc = vif.rinc;
      item.wclk = vif.wclk;
      
      //sample output
      @(posedge vif.rclk);
      item.rdata = vif.rdata;
	  item.wfull = vif.wfull;
	  item.rempty = vif.rempty;
      
      // send item to scoreboard
      monitor_port.write(item);
    end
        
  endtask: run_phase
  
  
endclass: fifo1_monitor