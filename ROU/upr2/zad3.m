Gn11 = tf([10],[1 0.4 16])
Gn12 = tf([1],[1 1])
Gn21 = tf([1],[1 2])
Gn22 = tf([5],conv([1 2],[1 3]))
Gnom = [Gn11 Gn12; Gn21 Gn22]

omega = logspace(-1,3,200)
figure()
hold on
j = sqrt(-1);

for tau = 0:0.01:0.2;
    for i = 1:200
        om = omega(i);
        pert(i) = sqrt((cos(om*tau)-1)^2 + sin(om*tau)^2);
    end
    magg = frd(pert,omega);
    bodemag(magg,'c--')
    hold on
end
grid
temp1 = 'Approximation of uncertain time delay';
temp2 = ' by multiplicative uncertainty';
title([temp1 temp2])
legend('|Wm(j\omega)|', ...
'|(G(j\omega)-G_{nom}(j\omega))/G_{nom}(j\omega)|',2)

ord = 1;
wfit
Wm = Wtf
bodemag(Wm)

Gnom_frd = frd(Gnom,omega)

%delti
D1 = ultidyn('D1',[1 1])
D2 = ultidyn('D2',[1 1])

% v tozi sluchai W1 = W2 = Wm
G =[Gn11*(1+Wm*D1), Gn12*(1+Wm*D2);Gn21*(1+Wm*D1),Gn22*(1+Wm*D2)]


