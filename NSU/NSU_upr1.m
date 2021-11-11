% a=-1;
% b=2;
% syms x(t)
% ode = diff(x,t) == a*x + b*(x^2)
% xSol(t) = dsolve(ode)
% 
% [t,y] = ode45(@odefun,[0 1.5],[0;1/2])
% plot(t,y); grid on

% xprime = @(x) -1*x+2*x^2
% x0=0:1
% tspan = [0 3];
% [y] = ode45(xprime,tspan,x0)
% plot(tspan,y); grid on 
tc=10;
[t1,x1]=ode45('fun1', [0,tc],0.25);
[t2,x2]=ode45('fun1', [0,tc],0.49);
[t3,x3]=ode45('fun1', [0,tc],0.50);
[t4,x4]=ode45('fun1', [0,tc],-0.5);
figure(1)
plot(t1,x1);grid on
hold on
plot(t2,x2);grid on
plot(t3,x3);grid on
plot(t4,x4);grid on
hold off