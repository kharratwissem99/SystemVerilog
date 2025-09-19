module mux_tb
    (
        // no inputs???
    ) ;

    logic a , b, c, d, f;
    logic [1:0] sel;
    assign a = 0;
    assign b = 1;
    assign c = 1;
    assign d = 0;
    assign sel = 2'b11;
    n_bit_mux mux1(.a(a), .b(b), .c(c) , .d(d) , .sel(sel), .f(f));
    
    
endmodule