Gn11 = tf([2],[0.015 0.8 1])
Gn12 = tf([0.02],[0.3 1])
Gn13 = tf([-0.08],[0.4 1])
Gn21 = tf([0.04],[0.1 1])
Gn22 = tf([2],[0.04 1.2 1])
Gn23 = tf([-0.03],[1 1])
Gnom = [Gn11 Gn12 Gn13; Gn21 Gn22 Gn23]

W1 = makeweight(0.06,45,5);
W2 = makeweight(0.04,50,10);
W3 = makeweight(0.05,60,8);
Delta1 = ultidyn('Delta1',[1 1]);
Delta2 = ultidyn('Delta2',[1 1]);
Delta3 = ultidyn('Delta3',[1 1]);

W = blkdiag(W1,W2,W3);
Delta = blkdiag(Delta1,Delta2,Delta3);
% a) model multipicative uncertainty
G = Gnom*(eye(3) + Delta*W)

K11 = tf([1.5 5],[0.1 1])
K12 = 0
K21 = 0
K22 = tf([5 10],[0.2 1])
K31 = tf([1 1],[0.2 1])
K32 = tf([-0.4],[0.5 1])
K = [K11 K12;K21 K22; K31 K32]

%?) robust analysis
looptransfer = loopsens(G,K);
Ti = looptransfer.Ti;

figure(1)
omega = logspace(-1,4,100);
sigma(W*Ti.Nominal,omega)
grid
% find exact value of Hinfinity norm
[PeakNorm,freq] = norm(W*Ti.Nominal,'inf')

%?) zapasi po ustoichivost
[sm,dm,mm] = loopmargin(G*K)
% sm - zapas po ustoichivost
% dm - diskov zapas po ustoichivost
% mm - mnogomeren zapas po ustoichivost

%?) worst case
[wcmargi,wcmargo] = wcmargin(G*K)

%?) prehodni procesi po zadanie

%%%%%%%%%%%%%%%% not all 3 inputs ????
To = looptransfer.To
tfin = 5;
nsample = 30;
[To30,samples] = usample(To,nsample);
time = 0:tfin/500:tfin;
nstep = size(time,2);
ref1(1:nstep) = 1.0;
ref2(1:nstep) = 0.0;
ref = [ref1' ref2'];
nsample = 30;

figure(4)
subplot(2,3,1)
hold off
for i = 1:nsample
    [y,t] = lsim(To30(1:2,1:2,i),ref,time);
    plot(t,y(:,1),'r-')
    hold on
end
grid
title('From inp 1 to outp 1') 
xlabel('Time (secs)')
ylabel('y_1')

figure(4)
subplot(2,3,2)
hold off
for i = 1:nsample
    [y,t] = lsim(To30(1:2,1:2,i),ref,time);
    plot(t,y(:,3),'r-')
    hold on
end
grid
title('From inp 2 to outp 1') 
xlabel('Time (secs)')
ylabel('y_1')

figure(4)
subplot(2,3,4)
hold off
for i = 1:nsample
    [y,t] = lsim(To30(1:2,1:2,i),ref,time);
    plot(t,y(:,2),'b-')
    hold on
end
grid
title('From inp 1 to outp 2')
xlabel('Time (secs)')
ylabel('y_2')

figure(4)
subplot(2,3,5)
hold off
for i = 1:nsample
    [y,t] = lsim(To30(1:2,1:2,i),ref,time);
    plot(t,y(:,2),'r-')
    hold on
end
grid
title('From inp 2 to outp 2') 
xlabel('Time (secs)')
ylabel('y_1')