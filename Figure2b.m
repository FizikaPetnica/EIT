function Figure2b

g(1) = 0;
g(2) = 1;
g(3) = 3;
g(4) = 5;
g(5) = 10;

cc = hsv(5);

n = 30;

R = linspace(0.1,10,n);
y = zeros(1,n);

for i=1 : 1 : 5
    for j=1 : 1 : n
        [~,e1,~] = Energy_levels(g(i),R(j),0,1);
        [~,e2,~] = Energy_levels(g(i),R(j),1,1);
        y(j) = min(sum(e2))-2*g(i)-min(sum(e1));
    end
    plot(R,y,'color',cc(i,:));
    hold on;
end

hold off

end