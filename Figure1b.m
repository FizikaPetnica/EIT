function Figure1b

R(1) = 0.5;
R(2) = 1;
R(3) = 3;
R(4) = 5;
R(5) = 10;

cc = hsv(5);

n = 20;

g = linspace(0,10,n);
y = zeros(1,n);

for i=1 : 1 : 5
    for j=1 : 1 : 20
        e = Binding_energy(g(j),R(i),0,1);
        y(j) = e(1);
    end
    plot(g,y,'color',cc(i,:));
    hold on;
end

hold off

end