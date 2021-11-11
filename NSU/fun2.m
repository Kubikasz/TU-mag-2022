
function y = fun2(t,y)
a=0.5; b=0.95; c=0.3;
%duffing with dampering
y = [y(2); (-c*y(2)-a*y(1)-b*y(1)^3)];