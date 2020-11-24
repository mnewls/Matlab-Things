%% 1.53

t=0:0.001:4*pi;
x1=1.122.*exp(-0.02.*t).*sin(2.*t+1.099);
plot(t,x1)
hold on
x2=1.2289.*exp(-0.4.*t).*sin(1.9596.*t+0.95);
plot(t,x2,'r')
x3=1.1677.*exp(-0.2.*t).*sin(1.989.*t+1.028);
plot(t,x3,'g')
x4=1.4015.*exp(-0.8.*t).*sin(1.833.*t+0.7945);
plot(t,x4,'m')
x5=2.3863.*exp(-1.6.*t).*sin(1.2.*t+0.4324);
plot(t,x5,'b')
legend('x1','x2','x3','x4','x5')
xlabel t
ylabel x(t)

%% 1.54
t=0:0.001:4*pi;
x1=10.05.*exp(-0.2.*t).*sin(1.99.*t+1.47);
plot(t,x1)
hold on
x1=100.5.*exp(-0.2.*t).*sin(1.99.*t+1.47);
plot(t,x2)
legend('x1','x2')
xlabel t
ylabel x(t)
