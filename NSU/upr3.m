
[t1,y1] = ode45(@fun3,[0 60],[2.0; 3.0]);
[t2,y2] = ode45(@fun3,[0 60],[2.01; 3.01]);
figure(1)
plot(t1,y1(:,1));grid on
hold on
plot(t2,y2(:,1));grid on
hold off


figure(2)
plot(t1,y1(:,2));grid on
hold on
plot(t2,y2(:,2));grid on
hold off


