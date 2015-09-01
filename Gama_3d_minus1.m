function Gama_3d_minus1

n = 50;
g = linspace(0,2,n);

y1 = zeros(1,n);
y2 = zeros(1,n);
y3 = zeros(1,n);
y4 = zeros(1,n);

m1 = 0;
s1 = 1;
k1 = 1;

m2 = -1;
s2 = 1;
k2 = 1;

m3 = 0;
s3 = -1;
k3 = 1;

m4 = -1;
s4 = -1;
k4 = 1;


for i=1 : n
    y1(i) = Spontaneous_decay(g(i),m2,s2,k2,m1,s1,k1);
    y2(i) = Spontaneous_decay(g(i),m3,s3,k3,m1,s1,k1);
    y3(i) = Spontaneous_decay(g(i),m4,s4,k4,m3,s3,k3);
    y4(i) = Spontaneous_decay(g(i),m4,s4,k4,m2,s2,k2);
end

plot(g,y1,'r')
hold on
plot(g,y2,'g')
plot(g,y3,'b')
plot(g,y4,'m')

hold off

end