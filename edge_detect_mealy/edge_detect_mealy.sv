module edge_detect_mealy
    (
        input logic clk , rst ,
        input logic in,
        output logic out
    );
    typedef enum {s1, s2} state_t;
    state_t state_reg , state_next;

    always_ff @(posedge clk , posedge rst)
        if (rst)
            state_reg <= s1;
        else
            state_reg <= state_next;

    always_comb begin
        state_next = state_reg; // default state: the same
        out = 1'b0; // default output: 0
        unique case (state_reg)
            s1:
                if (in) begin
                    state_next = s2;
                    out = 1'b1;
                end
                else
                    out = 1'b0;
            s2: begin
                if (in)
                    out = 1'b0;
                else begin
                    state_next = s1;
                    out = 1'b0;
                end
            end
        endcase
    end
endmodule
