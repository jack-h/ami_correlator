module gbe_readout_ctrl #(
    parameter WORDS_PER_PACKET = 7,
    parameter WORDS_PER_PACKET_BITS = 3
    ) (
    input clk,
    input ce,
    input gbe_empty,
    input lb_empty,
    output reg gbe_re,
    output reg lb_re
    );

    reg [WORDS_PER_PACKET_BITS - 1 : 0] word_ctr;
    reg reading_lb = 0;

    // let the word counter be free running
    always @(posedge clk) begin
        if (ce) begin
            word_ctr <= word_ctr == WORDS_PER_PACKET - 1 ? 0 : word_ctr + 1'b1;
        end
    end

    always @(posedge clk) begin
        if (ce) begin
           if (word_ctr == 0) begin
               // default states
               gbe_re <= 1'b0;
               lb_re <= 1'b0;
               // Round robin the two FIFOs. Be sure
               // that this is enough to prevent overflows.
               // Round robining means that the latency of
               // the empty flags on the two buffers doesn't
               // matter, so long as the latencies are the same
               if (reading_lb && !gbe_empty) begin
                    gbe_re <= 1'b1;
                    reading_lb <= 1'b0;
               end else if (!reading_lb && !lb_empty) begin
                    lb_re <= 1'b1;
                    reading_lb <= 1'b1;
               end
           end
       end
   end
endmodule


