module code(a, b, p);
input [3:0] a, b;
output [7:0] p;

supply1 one;
supply0 zero;
wire [5:0] c;
wire [5:0] w;

assign p[0] = a[0]&b[0];
ha h1(a[1]&b[0], a[0]&b[1], p[1], c[0]);
adder4_2 h2(a[2]&b[0], a[1]&b[1], a[0]&b[2], c[0], zero, p[2], c[1], w[0]);
adder5_2 h3(a[3]&b[0], a[2]&b[1], a[1]&b[2], a[0]&b[3], c[1], w[0], zero, p[3], c[2], w[1], w[2]);
adder5_2 h4(a[3]&b[1], a[2]&b[2], a[1]&b[3], c[2], zero, w[1], w[2], p[4], c[3], w[3], w[4]);
adder4_2 h5(a[3]&b[2], a[2]&b[3], c[3], w[3], w[4], p[5], c[4], w[5]);
fa h6(a[3]&b[3], c[4], w[5], p[6], p[7]);
endmodule

module ha(a, b, s, c);
input a, b;
output s, c;
assign s = a^b;
assign c = a&b;
endmodule 

module fa(x, y, z, s, c);
input x, y, z;
output s, c;
assign s = x^y^z;
assign c = (x^y)&z | (x&y);
endmodule

module adder4_2(a, b, c, d, xin, sum, carry, xout);
input a, b, c, d, xin;
output sum, carry, xout;
wire w1;
fa f1(a, b, c, w1, xout);
fa f2(xin, w1, d, sum, carry);
endmodule 

module adder5_2(a, b, c, d, e, x1in, x2in, sum, carry, x1out, x2out);
input a, b, c, d, e, x1in, x2in;
output sum, carry, x1out, x2out;
fa f1(a, b, c, w1, x1out);
fa f2(x1in, w1, d, w2, x2out);
fa f3(x2in, w2, e, sum, carry);
endmodule 
