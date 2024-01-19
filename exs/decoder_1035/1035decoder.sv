module decoder1035(output o, input [15:0] inp);
  wire [15:0] ninp;
  
  generate
    for (genvar i = 0; i < 16; i++) begin
      not(ninp[i], inp[i]);
    end
  endgenerate

  and(o, inp[0], inp[1], ninp[2], inp[3], ninp[4], ninp[5], ninp[6], ninp[7], ninp[8], ninp[9], inp[10], ninp[11], ninp[12], ninp[13], ninp[14], ninp[15]);

endmodule