
% 
% LORENC
% [t1,y1] = ode45(@f_lorenc,[0 60],[10; 10; 10]);
% figure(1)
% plot3(y1(:,1),y1(:,2),y1(:,3));grid on
% 
%Ustoichivi
% centur
% a0=1;a1=0;a2=2;

% sedlo
% a0=1;a1=0;a2=-2;

% vuzel
% a0=1;a1=3;a2=2;

% focus
% a0=1;a1=3;a2=8;



% ne Ustoichivi
% vuzel
% a0=1;a1=-3;a2=2;

% vuzel
% a0=1;a1=3;a2=2;

% focus
a0=1;a1=-2;a2=3;

mx=-1:0.01:1;
[x1, x2] = meshgrid(-1:0.1:1,-1:0.1:1);
[sx1, sx2] = meshgrid(-1:0.1:1,-1:0.1:1);
y1=x2;
y2=-a2*x1-a1*x2;

streamline(x1,x2,y1,y2,sx1,sx2);grid on




syms x
y=-x+3*x^3
r = solve(y,x)
e = 1.2

[t1,x1]=ode45(@fun5, [0 e],0.6);
[t2,x2]=ode45(@fun5, [0 e],-0.6);
[t3,x3]=ode45(@fun5, [0 e],0.2);
figure(1)
plot(t1,x1);grid on
hold on
plot(t2,x2);grid on
plot(t3,x3);grid on



