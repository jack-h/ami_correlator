module p_to_s_sr (
    clk,
    ce,
    load,
    din,
    dout,
    vld
    );
   
    parameter N_SLICES = 4;
    parameter SLICE_SIZE = 32;
    
    input clk;
    input ce;
    input load;
    input[N_SLICES*SLICE_SIZE-1:0] din;
    output [SLICE_SIZE-1:0] dout;
    output vld;

    reg [N_SLICES*SLICE_SIZE-1:0] shreg = 0;
    reg [N_SLICES-1:0] vld_reg = 0;

    always @(posedge clk) begin
        if (ce) begin
            if (load) begin
                shreg <= din;
                vld_reg <= {N_SLICES{1'b1}};
            end else begin
                shreg[(N_SLICES-1)*SLICE_SIZE-1:0] <= shreg[N_SLICES*SLICE_SIZE-1:SLICE_SIZE];
                shreg[N_SLICES*SLICE_SIZE-1:(N_SLICES-1)*SLICE_SIZE] <= {SLICE_SIZE{1'b0}};
                vld_reg[N_SLICES-1-1:0] <= vld_reg[N_SLICES-1:1];
                vld_reg[N_SLICES-1] <= 1'b0;
            end
        end
    end
    
    assign dout = shreg[SLICE_SIZE-1:0];
    assign vld = vld_reg;
    
endmodule
