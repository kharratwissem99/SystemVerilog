module universal_bin_cnt
#(parameter N = 4)
    (
        input logic clk , rst , syn_clr , load, en, up,
        input logic [N-1:0] d,
        output logic [N-1:0] q
    ) ;
    // logic n_sel , f1 , f2 ;
    // and g1 ( f1 , a , n_sel ) ;
    // and g2 ( f2 , b , sel ) ;
    // or g3 (f , f1 , f2 ) ;
    // not g4 ( n_sel , sel ) ;
    // state register

    logic [N -1:0] r_reg , r_next ;

    always_ff @ ( posedge clk , posedge rst )
        if ( rst )
        r_reg <= '0;
        else
        r_reg <= r_next ;


    // next - state logic
    always_comb
        if (syn_clr)
            r_next = '0;

        else
            if (load)
                r_next = d;
            else
                if (en)
                    if (up)
                        r_next = r_next + 1;
                        // we should consider the overflow case
                    else
                        r_next = r_next - 1;
                else
                    r_next = r_reg;

    assign q = r_reg;

endmodule