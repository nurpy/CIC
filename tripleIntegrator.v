module integrator(
    input clk,
      input rst,
  input[31:0] data_in,
  output[31:0] data_out
);

  reg[31: 0] sum;
  
  always@(posedge clk) begin
    if(rst)
      sum <= 32'b0;
    else
      sum <= sum + data_in;
  end
  assign data_out = sum;
  
endmodule

module integrator_order3(
  input clk,
  input rst,
  input[15:0] data_in,
  output[31:0] data_out
);
  
  wire [31:0] data_out_i1; wire [31:0] data_out_i2; wire [31:0] data_out_i3;
  
  integrator i1(.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out_i1));
  
  integrator i2(.clk(clk), .rst(rst), .data_in(data_out_i1), .data_out(data_out_i2));
  
  integrator i3(.clk(clk), .rst(rst), .data_in(data_out_i2), .data_out(data_out_i3));
  
  assign data_out = data_out_i3;
  
endmodule
