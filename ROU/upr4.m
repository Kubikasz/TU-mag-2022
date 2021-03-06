%zad 2
k1 = ureal('k1',7.2,'Percentage',45);
k2 = ureal('k2',-3,'Percentage',45);
k3 = ureal('k3',2,'Percentage',45);
k4 = ureal('k4',5,'Percentage',45);

T1 = ureal('T1',0.9,'Percentage',45);
T2 = ureal('T2',1.2,'Percentage',45);
T3 = ureal('T3',3,'Percentage',45);
T4 = ureal('T4',0.7,'Percentage',45);

Gn11 = tf([k1],[T1 1])
Gn12 = tf([k2],[T2 1])
Gn21 = tf([k3],[T3 1])
Gn22 = tf([k4],[T4 -1])
Gnom = [Gn11 Gn12; Gn21 Gn22]

K11 = tf([10 10],[0.3 1])
K22 = tf([15 30],[1 1])
K = blkdiag(K11,K22)

%a)
looptransfer = loopsens(Gnom,K);
Ti = looptransfer.Ti;

[stabmarg,destabunc,report,info] = robuststab(Ti)

% b)

Gnom1 = blkdiag(Gn11,Gn22)

looptransfer = loopsens(Gnom1,K);
Ti1 = looptransfer.Ti;

[stabmarg,destabunc,report,info] = robuststab(Ti1)

Gnom2 = blkdiag(Gn12,Gn21)

looptransfer = loopsens(Gnom2,K);
Ti2 = looptransfer.Ti;

[stabmarg,destabunc,report,info] = robuststab(Ti2)

%zad 3
Gn11 = tf([-1 2],[1 2 4])
Gn12 = tf([2 1],[1 2 4])
Gn21 = tf([-3],[1 2 4])
Gn22 = tf([-1 2],[1 2 4])
Gnom = [Gn11 Gn12;Gn21 Gn22]

W1 = makeweight(0.02,10,2);
W2 = makeweight(0.02,10,2);
Delta1 = ultidyn('Delta1',[1 1]);
Delta2 = ultidyn('Delta2',[1 1]);

W = blkdiag(W1,W2);
Delta = blkdiag(Delta1,Delta2);

G = Gnom*(eye(2) + Delta*W)

%Km = tf([conv(2,conv([1 2],[1 2 4]))],[conv([1 0],conv([1 1],[1 2 7]))])
%K = Km*[[-1 2] [-2 -1];3 [-1 2]]
chis = conv(2,conv([1 2],[1 2 4]))
znam = conv([1 0],conv([1 1],[1 2 7]))
K11 = tf([conv([-1 2],chis)],znam)
K12 = tf([conv([-2 -1],chis)],znam)
K21 = tf([conv(3,chis)],znam)
K22 = tf([conv([-1 2],chis)],znam)
K= [K11 K12;K21 K22]

looptransfer = loopsens(G,K);
Ti = looptransfer.Ti;

[stabmarg,destabunc,report,info] = robuststab(Ti)