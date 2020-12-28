`timescale 1ns / 1ps
`include "code.v"

module code_test;

    reg [3:0] a;
    reg [3:0] b;
    
    wire [7:0] p;

    code uut(a, b, p);

    initial begin
        $dumpfile("code.vcd");
        a = 0100;
        b = 0001;

        #20
        a = 0100;
        b = 0010;

        #20
        a = 0101;
        b = 0010;
        
        #20
        a = 0010;
        b = 0010;

        $display("Test complete!");
    end       

endmodule