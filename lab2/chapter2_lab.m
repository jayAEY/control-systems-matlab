%Jo Apuya
%EXPERIMENT 2.1 - POLYNOMIALS, TRANSFER FUNCTIONS AND PARTIAL FRACTIONS
%1 - Find P3 P3 and P5
P1 = [1 7 2 9 10 12 15];
P2 = [1 9 8 9 12 15 20];
P3 = P1+P2

%2 - Find P6 in one command
P6 = poly([-7 -8 -3 -5 -9 -10])

%3 - Find G1 in polynomial form in 2 Commands
s = tf('s');
G1 = 20*(s+2)*(s+3)*(s+6)*(s+8)/(s*(s+7)*(s+9)*(s+10)*(s+15))

%4 Find G2 in factored form in 2 commands
G2TF = tf([1 17 99 223 140],[1 32 363 2092 5052 4320]);
G2 = zpk(G2TF)

%6a - evaluate partial fraction expansions
G6num = 5*[1 2];
G6den = conv([1 0],[1 8 15]);
[r6,p6,k6] = residue(G6num, G6den)

%6b
G7num = 5*[1 2];
G7den = conv([1 0],[1 6 9]);
[r7,p7,k7] = residue(G7num, G7den)

%6c
G8num = 5*[1 2];
G8den = conv([1 0],[1 6 34]);
[r8,p8,k8] = residue(G8num, G8den)



%EXPERIMENT 2.2 - SYMBOLIC MATH AND LAPLACE TRANSFORMS
syms f(t) F(s) s;

%1a - generate f(t) symbolically  
f(t) = 0.0075 - 0.00034*cos(22*t)*exp(-2.5*t) + 0.087*sin(22*t)*exp(-2.5*t) - 0.0072*(exp(-8*t))
 
%1b generate F(s) symbolically in factored and polynomial forms
F2(s) = (2*(s+3)*(s+5)*(s+7))/(s*(s+8)*(s^2+10*s+100)) %Factored form 
[numF2,denF2] = numden(F2(s)); 
polynomial_F2(s) = expand(numF2)/expand(denF2) % polynomial form
 
%1c - Laplace transform of 1a
F(s) = laplace(f(t))

%1d - inverse Laplace transform of 1b
f2(t) = ilaplace(F2(s),s,t)
 
%1e - LTI TF of 1b in factored and polynomial form
GS = tf(double(sym2poly(numF2)), double(sym2poly(denF2))) %polynomial form
factoredGS = zpk(GS) %factored form

%1f - solve for mesh currents
syms V(s);

Z = [(5/s)+s+7  -(s+2)        -5
     -(s+2)     (3/s)+2*s+4   -(s+2)
     -5         -(s+2)        (4/s)+s+8];

Z_const = [V(s); 0; 0];

I = simplify(Z\Z_const);
I1 = I(1)
 
I2 = I(2)
 
I3 = I(3)