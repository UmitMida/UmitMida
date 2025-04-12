module prog #(parameter Psize = 8, Isize = 8) // psize - address width, Isize - instruction width
(input logic clk,reset,
input logic [Psize-1:0] address,
output logic [Isize:0] I); // I - instruction code

// program memory declaration, note: 1<<n is same as 2^n
logic [Isize:0] WaveMem[ (1<<Psize)-1:0];

// get memory contents from file
initial
  $readmemh(".\Program\wave.hex", WaveMem);
  
// program memory read 
always_ff @(posedge clk, negedge reset) begin
  if (!reset)
  I <= 8'b0;
  else
  I <= WaveMem[address];
end

endmodule // end of module prog
