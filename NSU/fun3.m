function y = fun3(t,x)
x
a1=1; a2=0.15; a3=1.4; b=6;
y(1)=x(2);
y(2)=(-a2*x(2)-a3*x(1)^5+b*sin(t))

%duffing with dampering
y = [y(1); y(2)];