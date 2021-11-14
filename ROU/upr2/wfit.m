[freq,resp_db] = ginput(20);
for i = 1:20 
    resp(i) = 10^(resp_db(i)/20); 
end 
sys = frd(resp,freq); 
W = fitmagfrd(sys,ord);

Wtf = tf(W); 