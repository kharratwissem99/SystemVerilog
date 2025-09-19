module n_bit_mux
    (
        input logic a , b , c , d,
        input logic [1:0] sel,
        output logic f
    ) ;

    logic f1, f2;

    mux mux1(.a(a), .b(b), .sel(sel[0]), .f(f1));
    mux mux2(.a(c), .b(d), .sel(sel[0]), .f(f2));

    mux mux3(.a(f1), .b(f2), .sel(sel[1]), .f(f));
endmodule