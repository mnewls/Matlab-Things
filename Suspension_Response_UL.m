% Time Response (1D Passive Suspension)
% 3230 Spring 2020 - Alex Hakimi

%{ 
  Time response for vehicle encountering a 2 in. (0.05 m) lip in the road
    r(t) = 0.05 m
    x1(t) = ...            (spring mass displacement)
    x2(t) = ...            (unsprung mass displacement)
    x1(t) - x2(t) = ...    (delta)
%}

clc
clear all

% System (Vehicle) Parameters
m1 = 275;      % kg    (sprung mass, 1/4 of vehicle)
m2 = 25;       % kg    (unsprung mass, 1/4 of suspension)
b1 = 1120;     % N*/m  (vehicle damper stiffness)
k1 = 150000;   % N/m   (vehicle spring constant)
b2 = 3100;     % N*s/m (tire damper stiffness)
k2 = 310000;   % N/m   (tire spring constant)

% Create symbolic transfer function expression using Cramer's Rule

syms s R

% define coefficient matrix 'A'
A = [(m1*s^2+b1*s+k1), -(b1*s+k1); -(b1*s+k1), (m2*s^2+(b1+b2)*s+k1+k2)];

% define input matrix 'b'
b = [0; R*(b2*s+k2)];

% determinant of coefficient matrix 'delta'
delta = det(A);

% sprung mass (m1) displacement, X1(s), (using Cramer's Rule)
deltaX1 = det([0, A(1,2); b(2,1), A(2,2)]);
X1 = deltaX1/delta;

% unsprung mass (m2) displacement, X2(s), (using Cramer's Rule)
deltaX2 = det([A(1,1), 0; A(2,1), b(2,1)]);
X2 = deltaX2/delta;

% transfer function G1 = X1(s)/R(s)

g1 = X1/R;
% transfer function G2 = X2(s)/R(s)
g2 = X2/R;

% transfer function G3 = (X1(s)-X2(s))/R(s)
  % delta of sprung and unsprung mass displacements

g3 = (X1-X2) / R;

% symbolic equation to transfer function (LTI)
  % utilizing user-defined function 'sym2tf' at end of script

  % note 4th order system
G1 =sym2tf(g1);
G2 =sym2tf(g2);
G3 =sym2tf(g3);
% zero / pole / gain form of each TF
g1_zpk = zpk(G1)
g2_zpk = zpk(G2)
g3_zpk = zpk(G3)

% system poles (characteristic equation roots)

poles = pole(G1);
% Time Response (System Output)

%{
  sprung mass should settle 2 inches (0.05 m) above equilibrium position
    unsprung mass should settle 2 inches (0.05 m) above equilibrium position
    mass delta should settle to 0 m (both masses return to equil. position)
%}

r = 0.05;
x1_equil = 0.7;
x2_equil = 0.3;
% meters, road disturbance (input)
 % meters, x1 equilibrium position
 % meters, x2 equilibrium posotion

% step function, r(t) = 1 m
step(r*G1 + x1_equil, r*G2 + x2_equil, r*G3)

xlabel('time')
ylabel('height (m) ')
legend('x1 sprung', 'x2 unsprung','x1-x2')
axis([0 2.5 -0.1 0.85])
grid on

% Simulink T.F. Representation

[numG1,denG1] = tfdata(G1,'v')
[numG2,denG2] = tfdata(G2,'v')
[numG3,denG3] = tfdata(G3,'v')


function G = sym2tf(g)
% Symbolic Transfer Function to Numerical Transfer Function

% Syntax:  G = sym2tf(g)

[n,m]=size(g);

for i=1:n
    for j=1:m
        [num,den]=numden(g(i,j));
        num_n=sym2poly(num);
        den_n=sym2poly(den);
        G(i,j)=tf(num_n,den_n);
    end
end

end
