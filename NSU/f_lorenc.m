function y = f_lorenc(t,x)
sigma=10;beta=2.66;pfi = 25;

y(1)=sigma*(x(2)-x(1));
y(2)=pfi*x(1) - x(2) - x(1)*x(3);
y(3) = x(1)*x(2) - beta*x(3);

%duffing with dampering
y = [y(1);y(2);y(3)];