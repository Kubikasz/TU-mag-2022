[t,y] = ode45(@vdp1,[0 30],[3; 0]);
plot(t,y(:,1),'-o',t,y(:,2),'-o') 
title('Solution of van der Pol Equation (\mu = 1) using ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2')
%[SS,Sbs] = odeToVectorField(y)


% fazof proces
plot(y(1:2),y(:,1),'-o',y(:1),y(:,2),'-o') 
plot(y(:,1),y(:,2));
[t1,y1] = ode45(@fun3,[0 30],[2; 3]);
[t2,y2] = ode45(@fun3,[0 30],[2.01; 3.01]);
[t3,y3] = ode45(@fun3,[0 30],[1; 1]);
plot(y(:,1),y(:,2));
figure(1)
plot(y1(:,1),y1(:,2));grid on
hold on
plot(y2(:,1),y2(:,2));grid on
plot(y3(:,1),y3(:,2));grid on
hold off
 

[t1,y1] = ode45(@fun3,[0 60],[2.0; 3.0]);
[t2,y2] = ode45(@fun3,[0 60],[2.01; 3.01]);
figure(1)
plot(t1,y1);grid on
hold on
plot(t2,y2);grid on
hold off




