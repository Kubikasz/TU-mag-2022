a0= ureal('a0',0.9,'PlusMinus',[-30,30])
a1= ureal('a1',2,'PlusMinus',[-30,30])
b0= ureal('b0',0.2,'PlusMinus',[-30,30])
b1= ureal('b1',1,'PlusMinus',[-30,30])

a2=2*a1-2
int1=tf(1,[1,0]);
int2=tf(1,[1,0]);
int3=tf(1,[1,0]);
systemnames = 'int1 int2 int3 a0 a2 a1 b0 b1'
inputvar = '[u]'
outputvar = '[int2]'
input_to_int1 = '[a0]'
input_to_a2 = '[int1]'
input_to_int2 = '[int1]'
input_to_a1  = '[int2]'
input_to_int3 = '[u]'
input_to_b1 = '[int3]'
input_to_b0 = '[u]'
input_to_a0 = '[b1+b0-a2-a1]'
uss4 = sysic