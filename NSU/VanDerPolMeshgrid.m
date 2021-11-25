a=0.5;b=0.4;

mx=-1:0.01:1;
[x1, x2] = meshgrid(-2:0.01:2,-2:0.01:2);
[sx1, sx2] = meshgrid(-2:0.2:2,-2:0.2:2);
y1=x2;
y2=-(1/a)*x1-(b/a)*(x1.^2-1).*x2;


streamline(x1,x2,y1,y2,sx1,sx2);grid on

