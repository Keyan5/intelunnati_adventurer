module landrover_tb;

reg X, clk, reset;

wire [2:0] state; 

 // Instantiate the FSM module
  landrover t1 (
    .X(X),
    .clk(clk),
	 .reset(reset),
    .state(state)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
	
    X = 0;
    clk = 0;
	 reset = 0;
    
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 1;
    #10 X = 1;
	 #10 X = 1;
	 #10 X = 0;
	 #10 X = 1;
	 #10 X = 0;
	 #10 X = 1;
	 #10 X = 1;
	 #10 X = 0;
	 #10 X = 0;
	 #10 reset = 1;
	 #10 reset = 0;
	 #10 X = 1;
	 #10 X = 1;
	 #10 X = 1;

    #10 $finish;
	 
  end initial
  
  $monitor($time,"state = %b",state);

  // Monitor
  always @(posedge clk) begin
    $display("State: %b", state);
  end

endmodule