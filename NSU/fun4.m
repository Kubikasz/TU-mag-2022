
function y = fun2(t,x)
a0=1;a1=0;a2=2;

y(1)=x(2);
y(2)=-1*a2/a1*x(1)-a1/a0*x(2);

%duffing with dampering
y = [y(1);y(2)];