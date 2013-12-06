module max_fanout_reg #(
    parameter MAXFANOUT = 1
    )(
    input clk,
    input ce,
    input din,
    output dout
    );

    (* max_fanout = MAXFANOUT *) reg dout_reg=0;
    
    always @(posedge clk) begin
        dout_reg <= din;
    end

    assign dout = dout_reg;

endmodule

