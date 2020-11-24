%% Michael Newlin HW 11 4160
%problem 6.2 graphs
clc

sigma = [0:.1:40];

y_tan = tan(sigma);
y = -sigma;

plot(sigma,y,'r',sigma,y_tan,'b')

figure

%plotting modes < solved from intersect of graph
x = [0:.001:2];
y_1 = sin(2.03.*x);
y_2 = sin(4.91.*x);
y_3 = sin(7.98.*x);
y_4 = sin(11.08.*x);

plot(x,y_1,'r',x,y_2,'b',x,y_3,'g',x,y_4,'k')
legend