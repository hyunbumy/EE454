//////////////////////////////////////////////////////////////////////////////////
// Module Name: decoder
// Author: Daniel Dai, Brad Yang, Juliana Echternach
//////////////////////////////////////////////////////////////////////////////////

module decoder(value, dig1, dig2, dig3, dig4);

input [11:0] value;
output [6:0] dig1, dig2, dig3, dig4;

assign dig1 = value / 1000;
assign dig2 = (value / 100) % 10;
assign dig3 = (value/ 10) % 10;
assign dig4 = value % 10;

endmodule