%% in class
clear
clc

dN_dT = @ (O,V,T) (-3*O + 1.5 *V)/(4*T);
dV_dT = @ (O,N,T) (-4.5*O + 1.4*N)/(T^2);
dO_dT = @ (O,V,N,T) (O/40) + (1/(5*T))*exp((1/(V+N)));


h = 5;
iter = 4;
t(1) = 25;

N_val(1) = 42;
V_val(1) = 50;
O_val(1) = 28;

count = 1;

for Temp = 25:h:40
    
    N_val(count+1) = N_val(count) + dN_dT(O_val(count),V_val(count),Temp)*h;
    
    V_val(count+1) = V_val(count) + dV_dT(O_val(count),N_val(count),Temp)*h;
    
    O_val(count+1) = O_val(count) + dO_dT(O_val(count),V_val(count),V_val(count),Temp)*h;
    
    count = count+1;
end

N_val

V_val

O_val

%output
% N_val =
% 
%    42.0000   41.5500   40.6988   39.5183   38.0468
% 
% 
% V_val =
% 
%    50.0000   49.4624   48.9971   48.5773   48.1879
% 
% 
% O_val =
% 
%    28.0000   31.5404   35.5166   39.9851   45.0085

%% b 
temperature = [25:5:45];

y_Int = NewtonInt(temperature, O_val, 37)

error = abs((y_Int - 39.168) / 39.168)*100

% output
% y_Int =
% 
%    37.2416
% 
% 
% error =
% 
%     4.9184



function Yint = NewtonInt(x,y,Xint)

n = length(x);
a(1) = y(1);
for i = 1:1:n-1
    div_diff(i,1) = (y(i+1) - y(i))/(x(i+1) - x(i));
end
for j = 2:1:n-1
    for i = 1:1:n-j
        div_diff(i,j) = (div_diff(i+1,j-1) - div_diff(i,j-1))/(x(j+i) - x(i));
    end
end
for j = 2:1:n
    a(j) = div_diff(1,j-1);
end
Yint = a(1);
xn = 1;
for k=2:1:n
    xn = xn*(Xint - x(k-1));
    Yint = Yint + a(k)*xn;
end
end


