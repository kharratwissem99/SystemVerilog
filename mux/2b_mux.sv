module 2b_mux
    (
        input logic[0:1] a , b ,
        input logic sel,
        output logic[0:1] f
    ) ;

    mux mux1(.a(a[0]), .b(b[0]), .sel(sel), .f(f[0]));
    mux mux2(.a(a[1]), .b(b[1]), .sel(sel), .f(f[1]));
endmodule