module 2b_mux
    (
        input logic[0:1] a , b ,
        input logic sel,
        output logic f
    ) ;
    logic n_sel , f1 , f2 ;
    and g1 ( f1 , a , n_sel ) ;
    and g2 ( f2 , b , sel ) ;
    or g3 (f , f1 , f2 ) ;
    not g4 ( n_sel , sel ) ;
endmodule