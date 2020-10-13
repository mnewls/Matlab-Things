%%Homework 8
%problem 10.3
clear all
clc

dF = inline('y+t^3');
h = 0.5;
N = 3;
t(1) = 0;
y(1) = 1;

for i = 1:1:N
    t(i+1) = t(i) + h;
    t_m = t(i) + h/2;
    y_m = y(i) + dF(t(i),y(i)) * (h/2);
    y(i+1) = y(i) + dF(t_m,y_m)*h;
end
t
y

Err = 7*exp(t)-t.^3-3*t.^2-6*t-6-y

%Output

% t =
% 
%          0    0.5000    1.0000    1.5000
% 
% 
% y =
% 
%     1.0000    1.6328    2.8799    5.7814
% 
% 
% Err =
% 
%          0    0.0332    0.1481    0.4655

%% 10.3 B using RK method
clear
clc

dF = inline('y+t^3');
h = 0.5;
N = 3;
t(1) = 0;
y(1) = 1;

for i=1:1:N
    t(i+1) = t(i) +h;
    
    K1 = dF(t(i),y(i));
    K2 = dF(t(i) + 0.5*h,y(i)+K1*h/2);
    K3 = dF(t(i) + 0.5*h,y(i)+K2*h/2);
    K4 = dF(t(i+1),y(i)+K3*h);
    
    y(i+1) = y(i) + (K1 + 2*K2 + 2*K3 + K4) *h/6;
end

t
y


Err = 7*exp(t)-t.^3-3*t.^2-6*t-6-y

%output

% t =
% 
%          0    0.5000    1.0000    1.5000
% 
% 
% y =
% 
%     1.0000    1.6655    3.0263    6.2421
% 
% 
% Err =
% 
%          0    0.0005    0.0017    0.0048
%% 10.6 
clear
clc

a=0; b=1.2;

dxdt = @ (x,y,t) x-y*t;
dydt = @ (x,y,t) t+y;

sx = @ (t) 4*exp(t) - 3*t - t.^2.*exp(t) - t.^2 - 3;
sy = @ (t) 2*exp(t) - t- 1;
x(1) = 1; y(1) = 1;

t(1)=a;

h=0.4;

N=3;

for i = 1:N

t(i+1) = t(i) + h;

x(i+1) = x(i) + dxdt(x(i),y(i),t(i))*h;

y(i+1) = y(i) + dydt(x(i),y(i),t(i))*h;

end

t

x

y

xerr=sx(t)-x

yerr=sy(t)-y


%output

% t =
% 
%          0    0.4000    0.8000    1.2000
% 
% 
% x =
% 
%     1.0000    1.4000    1.7360    1.7520
% 
% 
% y =
% 
%     1.0000    1.4000    2.1200    3.2880
% 
% 
% xerr =
% 
%          0   -0.0314   -0.2982   -1.2925
% 
% 
% yerr =
% 
%          0    0.1836    0.5311    1.1522
%% 10.6 b RK
clear
clc

a=0; b=1.2;

dxdt = @ (t,x, y) x-y*t;

dydt = @ (t,x, y) t+y;

sx = @ (t) 4*exp(t) - 3*t - t.^2.*exp(t) - t.^2 - 3;
sy = @ (t) 2*exp(t) - t- 1;
x(1) = 1; y(1) = 1;

t(1)=a;

h=0.4;

N= 3;

for i= 1:N

t(i+1) = t(i) + h;

Kx1= dxdt(t(i),x(i),y(i));
Ky1= dydt(t(i),x(i), y(i));
Kx2= dxdt(t(i)+0.5*h,x(i)+Kx1*h/2, y(i)+Ky1*h/2);
Ky2= dydt(t(i)+0.5*h,x(i)+Kx1*h/2, y(i)+Ky1*h/2);
Kx3= dxdt(t(i)+0.5*h,x(i)+Kx2*h/2,y(i)+Ky2*h/2);
Ky3= dydt(t(i)+0.5*h,x(i)+Kx2*h/2,y(i)+Ky2*h/2);
Kx4= dxdt(t(i+1),x(i)+Kx3*h, y(i)+Ky3*h);
Ky4= dydt(t(i+1),x(i)+Kx3*h, y(i)+Ky3*h);
x(i+1) = x(i) + (Kx1+2*Kx2+2*Kx3+Kx4)*h/6;
y(i+1) = y(i) + (Ky1+2*Ky2+2*Ky3+Ky4)*h/6;
end

t

x

y

xe=sx(t)-x

ye=sy(t)-y

%output
% 
% t =
% 
%          0    0.4000    0.8000    1.2000
% 
% 
% x =
% 
%     1.0000    1.3686    1.4385    0.4624
% 
% 
% y =
% 
%     1.0000    1.5835    2.6505    4.4390
% 
% 
% xe =
% 
%          0   -0.0000   -0.0006   -0.0029
% 
% 
% ye =
% 
%          0    0.0002    0.0005    0.0012

%% 10.12 a
clear
clc

a=0; b=1.5;

dydx = @ (w) w;

dwdx = @ (w,y,x) exp(3*x)-y;
sy=@ (x) (exp (3*x)-cos(x)+7*sin(x))/10;
w(1) = 1; y(1) = 0;

x(1)=a;

h = 0.5;

N=round ( (b-a) /h);

for i = 1:N
x(i+1) = x(i) + h;

y(i+1) = y(i) + dydx(w(i))*h;

w(i+1) = w(i) + dwdx(w(i),y(i),x(i))*h;
end

x

y

error=sy (x)-y

%output
% 
% x =
% 
%          0    0.5000    1.0000    1.5000
% 
% 
% y =
% 
%          0    0.5000    1.2500    2.9954
% 
% 
% error =
% 
%          0    0.1960    1.2936    6.6975

%% 10.12 b
clear
clc

a=0; b=1.5;

dydx = @ (w) w;
dwdx = @ (x,w,y) exp(3*x)-y;

sy=@ (x) (exp (3*x)-cos (x) +7*sin (x) )/10;
w(1) = 1; y(1) = 0;

x(1)=a;

h = 0.5;

N=round ( (b-a) /h);

for i= 1:N

x(i+1) = x(i) + h;

xm = x(i) + h/2;

Kw1 = dwdx(x(i),w(i),y(i));

Ky1 = dydx(w(i));

Kw2 = dwdx(xm,w(i)+Kw1*h/2,y(i)+Ky1*h/2);
Ky2 = dydx(w(i)+Kw1*h/2);

Kw3 = dwdx(xm,w(i)+Kw2*h/2,y(i)+Ky2*h/2);
Ky3 = dydx(w(i)+Kw2*h/2);

Kw4 = dwdx (x(i+1),y(i) +Ky3*h, y(i) +Ky3*h);
Ky4 = dydx(w(i)+Kw3*h);

w(i+1) = w(i) + (Kw1 + 2*Kw2 + 2*Kw3 + Kw4) *h/6;
y(i+1) = y(i) + (Ky1 + 2*Ky2 + 2*Ky3 + Ky4)*h/6;
end

x

y

error=sy(x) -y

%output

% x =
% 
%          0    0.5000    1.0000    1.5000
% 
% 
% y =
% 
%          0    0.6946    2.5373    9.6662
% 
% 
% error =
% 
%          0    0.0014    0.0062    0.0267