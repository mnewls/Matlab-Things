%%Michael Newlin HW6
% p1)a
clear
clc

x = [0 1 2 3];
y = [3 5 4 1];
k = 100;

splinecoeff(x,y)

splineplot(x,y,k);

%% p3
clear
clc

x = [0 1 2 3 4];
y = [1 3 3 4 2];
k = 100;

splinecoeff(x,y)

splineplot(x,y,k);

%% P5
clear
clc

x = [0 1 2 3 4];
y = [1 3 3 4 2];
k = 100;

splinecoeff_1(x,y)

splineplot_1(x,y,k);

function coeff = splinecoeff(x,y)

n=length(x);           
A=zeros(n,n);            
b=zeros(n,1);

for i=1:1:n-1        
    
    dx(i) = x(i+1)-x(i);
    dy(i)=y(i+1)-y(i);
    
end

for i=2:1:n-1   
    
    A(i,i-1:i+1)=[dx(i-1) 2*(dx(i-1)+dx(i)) dx(i)];
    b(i)=3*(dy(i)/dx(i) - dy(i-1)/dx(i-1)); 
    
end

A(1,1) = 1;              
A(n,n) = 1;
coeff=zeros(n,3);
coeff(:,2)=A\b;          

for i=1:1:n-1         
    
    coeff(i,3)=(coeff(i+1,2)-coeff(i,2))/(3*dx(i));
    coeff(i,1)=dy(i)/dx(i)-dx(i)*(2*coeff(i,2)+coeff(i+1,2))/3;
    
end

coeff=coeff(1:n-1,1:3);

end

function [x1,y1] = splineplot(x,y,k)

n=length(x);
coeff = splinecoeff(x,y);
x1=[];
y1=[];

for i=1:1:n-1
    
    xs = linspace(x(i), x(i+1),k+1);
    dx = xs-x(i);
    ys = coeff(i,3)*dx;
    ys = (ys + coeff(i,2)).*dx;
    ys = (ys +coeff(i,1)).*dx+y(i);
    x1 = [x1; xs(1:k)'];
    y1=[y1;ys(1:k)'];
    
end

x1 =[x1; x(end)];
y1=[y1;y(end)];
plot(x,y,'o',x1,y1)
title('some spliney boi');

end

function coeff=splinecoeff_1(x,y)

n=length(x);           
A=zeros(n,n);            
b=zeros(n,1);  

for i=1:1:n-1   
    
    dx(i) = x(i+1)-x(i);
    dy(i)=y(i+1)-y(i);
    
end

for i=2:1:n-1    
    
    A(i,i-1:i+1)=[dx(i-1) 2*(dx(i-1)+dx(i)) dx(i)];
    b(i)=3*(dy(i)/dx(i) - dy(i-1)/dx(i-1)); 
    
end

A(1,1:2) = [2*dx(1) dx(1)];
b(1) = 3*(dy(1)/dx(1));
A(n,n-1:n) = [dx(n-1) 2*dx(n-1)];
b(n) = 3*(1-dy(n-1)/dx(n-1));
coeff=zeros(n,3);
coeff(:,2)=A\b;          

for i=1:1:n-1    
    
    coeff(i,3)=(coeff(i+1,2)-coeff(i,2))/(3*dx(i));
    coeff(i,1)=dy(i)/dx(i)-dx(i)*(2*coeff(i,2)+coeff(i+1,2))/3;
    
end

coeff=coeff(1:n-1,1:3);

end

function [x1,y1] = splineplot_1(x,y,k)

n=length(x);
coeff = splinecoeff_1(x,y);
x1=[];
y1=[];

for i=1:1:n-1
    
    xs = linspace(x(i), x(i+1),k+1);
    dx = xs-x(i);
    ys = coeff(i,3)*dx;
    ys = (ys + coeff(i,2)).*dx;
    ys = (ys +coeff(i,1)).*dx+y(i);
    x1 = [x1; xs(1:k)'];
    y1=[y1;ys(1:k)'];
    
end

x1 =[x1; x(end)];
y1=[y1;y(end)];
plot(x,y,'o',x1,y1)
title('some spliney boi');

end






