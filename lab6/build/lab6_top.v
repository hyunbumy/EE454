
module lab6_top;
  input Clk;
  input Rst_n;

  // Instantiate  network
  mkNetwork dut
  (.CLK(Clk)
   ,.RST_N(Rst_n)

   ,.send_ports_0_putFlit_flit_in(flit_in[0])
   ,.EN_send_ports_0_putFlit(send_flit[0])

   ,.EN_send_ports_0_getCredits(1'b1) // drain credits
   ,.send_ports_0_getCredits(credit_out[0])

   ,.send_ports_1_putFlit_flit_in(flit_in[1])
   ,.EN_send_ports_1_putFlit(send_flit[1])

   ,.EN_send_ports_1_getCredits(1'b1) // drain credits
   ,.send_ports_1_getCredits(credit_out[1])

   // add rest of send ports here
   //
   ,.send_ports_2_putFlit_flit_in(flit_in[2])
   ,.EN_send_ports_2_putFlit(send_flit[2])

   ,.EN_send_ports_2_getCredits(1'b1) // drain credits
   ,.send_ports_2_getCredits(credit_out[2])

   ,.send_ports_3_putFlit_flit_in(flit_in[3])
   ,.EN_send_ports_3_putFlit(send_flit[3])

   ,.EN_send_ports_3_getCredits(1'b1) // drain credits
   ,.send_ports_3_getCredits(credit_out[3])

   ,.send_ports_4_putFlit_flit_in(flit_in[4])
   ,.EN_send_ports_4_putFlit(send_flit[4])

   ,.EN_send_ports_4_getCredits(1'b1) // drain credits
   ,.send_ports_4_getCredits(credit_out[4])

   ,.send_ports_5_putFlit_flit_in(flit_in[5])
   ,.EN_send_ports_5_putFlit(send_flit[5])

   ,.EN_send_ports_5_getCredits(1'b1) // drain credits
   ,.send_ports_5_getCredits(credit_out[5])

   ,.send_ports_6_putFlit_flit_in(flit_in[6])
   ,.EN_send_ports_6_putFlit(send_flit[6])

   ,.EN_send_ports_6_getCredits(1'b1) // drain credits
   ,.send_ports_6_getCredits(credit_out[6])

   ,.send_ports_7_putFlit_flit_in(flit_in[7])
   ,.EN_send_ports_7_putFlit(send_flit[7])

   ,.EN_send_ports_7_getCredits(1'b1) // drain credits
   ,.send_ports_7_getCredits(credit_out[7])

   ,.send_ports_8_putFlit_flit_in(flit_in[8])
   ,.EN_send_ports_8_putFlit(send_flit[8])

   ,.EN_send_ports_8_getCredits(1'b1) // drain credits
   ,.send_ports_8_getCredits(credit_out[8])

////////////////////////////////////////////////////////////////////////////////

   ,.EN_recv_ports_0_getFlit(1'b1) // drain flits
   ,.recv_ports_0_getFlit(flit_out[0])

   ,.recv_ports_0_putCredits_cr_in(credit_in[0])
   ,.EN_recv_ports_0_putCredits(send_credit[0])

   ,.EN_recv_ports_1_getFlit(1'b1) // drain flits
   ,.recv_ports_1_getFlit(flit_out[1])

   ,.recv_ports_1_putCredits_cr_in(credit_in[1])
   ,.EN_recv_ports_1_putCredits(send_credit[1])

   // add rest of receive ports here
   // 

   ,.EN_recv_ports_2_getFlit(1'b1) // drain flits
   ,.recv_ports_2_getFlit(flit_out[2])

   ,.recv_ports_2_putCredits_cr_in(credit_in[2])
   ,.EN_recv_ports_2_putCredits(send_credit[2])

   ,.EN_recv_ports_3_getFlit(1'b1) // drain flits
   ,.recv_ports_3_getFlit(flit_out[3])

   ,.recv_ports_3_putCredits_cr_in(credit_in[3])
   ,.EN_recv_ports_3_putCredits(send_credit[3])

   ,.EN_recv_ports_4_getFlit(1'b1) // drain flits
   ,.recv_ports_4_getFlit(flit_out[4])

   ,.recv_ports_4_putCredits_cr_in(credit_in[4])
   ,.EN_recv_ports_4_putCredits(send_credit[4])

   ,.EN_recv_ports_5_getFlit(1'b1) // drain flits
   ,.recv_ports_5_getFlit(flit_out[5])

   ,.recv_ports_5_putCredits_cr_in(credit_in[5])
   ,.EN_recv_ports_5_putCredits(send_credit[5])

   ,.EN_recv_ports_6_getFlit(1'b1) // drain flits
   ,.recv_ports_6_getFlit(flit_out[6])

   ,.recv_ports_6_putCredits_cr_in(credit_in[6])
   ,.EN_recv_ports_6_putCredits(send_credit[6])

   ,.EN_recv_ports_7_getFlit(1'b1) // drain flits
   ,.recv_ports_7_getFlit(flit_out[7])

   ,.recv_ports_7_putCredits_cr_in(credit_in[7])
   ,.EN_recv_ports_7_putCredits(send_credit[7])

   ,.EN_recv_ports_8_getFlit(1'b1) // drain flits
   ,.recv_ports_8_getFlit(flit_out[8])

   ,.recv_ports_8_putCredits_cr_in(credit_in[8])
   ,.EN_recv_ports_8_putCredits(send_credit[8])

   );

endmodule