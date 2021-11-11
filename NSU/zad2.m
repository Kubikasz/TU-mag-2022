syms a b c x1;
a=0.5
b=0.95

%+-0.7255

sx=-a*x1-b*x1^3;
solx=solve(sx);
[t1,y1] = ode45(@fun2,[0 20],[-1; 0.08]);
[t2,y2] = ode45(@fun2,[0 20],[-1; 0.5]);
[t3,y3] = ode45(@fun2,[0 20],[0.3; 0]);
figure(1)
plot(y1(:,1),y1(:,2));grid on
hold on
plot(y2(:,1),y2(:,2));grid on
plot(y3(:,1),y3(:,2));grid on
legend('0.1','0.73','-0.7')
hold off

[t1,y1] = ode45(@fun3,[0 20],[2; 3]);
[t2,y2] = ode45(@fun3,[0 20],[2.01; 3.01]);
figure(1)
plot(t1,y1(:,2));grid on
hold on
plot(t2,y2(:,2));grid on
hold off