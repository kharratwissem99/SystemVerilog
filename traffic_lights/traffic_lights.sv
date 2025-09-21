module traffic_lights
    (
        input logic clk , rst ,
        input logic Ta, Tb,
        output logic[1:0] La, Lb
    );
    typedef enum {s0, s1, s2, s3} state_t;
    state_t state_reg , state_next;

    // typedef enum {red, yellow, green} light_t;
    // light_t La_light, Lb_light, La_light_nxt, Lb_light_nxt;

    logic [31:0] counter, nxt_counter;
    logic cnt_done, count;

    always_ff @(posedge clk , posedge rst)
        if (rst) begin
            state_reg <= s0;
            counter <= 32'd0;
        end
        else begin
            state_reg <= state_next;
            counter <= nxt_counter;
        end

    always_comb begin
        state_next = state_reg; // default state: the same
        La = 2'b10;
        Lb = 2'b00;
        count = 0;
        unique case (state_reg)
            s0:
                if (Ta)
                    state_next = state_reg; // state: the same
                else
                    state_next = s1;
            s1: begin
                La = 2'b01;
                Lb = 2'b00;
                count = 1;
                if (cnt_done)
                    state_next = s2;
                else
                    state_next = state_reg; // state: the same
            end
            s2: begin
                La = 2'b00;
                Lb = 2'b10;
                if (Tb)
                    state_next = state_reg; // state: the same
                else
                    state_next = s3;
            end
            s3: begin
                La = 2'b00; //red
                Lb = 2'b01; //yellow
                count = 1;
                if (cnt_done)
                    state_next = s0;
                else
                    state_next = state_reg; // state: the same
            end
        endcase
    end

    always_comb begin
        nxt_counter = counter; // default state: the same
        cnt_done = 1'b0;
        if (count)
            if (counter == 32'd500000) begin
                nxt_counter = 32'd0;
                cnt_done = 1'b1;
            end
            else 
                nxt_counter = counter + 1; 
    end


endmodule
