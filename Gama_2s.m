function Gama_2s

n = 50;
g = linspace(0,10,n);

y1 = zeros(1,n);
y2 = zeros(1,n);
y3 = zeros(1,n);
y4 = zeros(1,n);

for i=1 : n
    y1(i) = Spontaneous_decay(g(i),-1,1,1,0,1,1);
    y2(i) = Spontaneous_decay(g(i),0,-1,1,0,1,1);
    y3(i) = Spontaneous_decay(g(i),0,1,2,0,-1,1);
    y4(i) = Spontaneous_decay(g(i),0,1,2,-1,1,1);
end

plot(g,y1,'r')
hold on
plot(g,y2,'g')
plot(g,y3,'b')
plot(g,y4,'m')

hold off

end