
[t1,y1] = ode45(@f_lorenc,[0 60],[10; 10; 10]);
figure(1)
plot3(y1(:,1),y1(:,2),y1(:,3));grid on



