
[t1,y1] = ode45(@f_lorenc,[0 60],[10; 10; 10]);
figure(1)
plot3(y1(:,1),y1(:,2),y1(:,3));grid on



a0=1;a1=0;a2=2;
mx=-1:0.01:1;
[x1, x2] = meshgrid(mx,mx);
[sx1, sx2] = meshgrid(mx,mx);
y1=x2;
y2=-1*a2/a1.*x1-a1/a0.*x2;

streamline(x1,x2,y1,y2,sx1,sx2)