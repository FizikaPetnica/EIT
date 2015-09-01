function Figure3

R(1) = 0.5;
R(2) = 1;
R(3) = 3;
R(4) = 5;
R(5) = 10;

cc = hsv(5);

n = 20;

g = linspace(0,10,n);
y_plus = zeros(1,n);
y_minus = zeros(1,n);

for i=1 : 1 : 5
    
    for j=1 : 1 : n
        [~,e1,~] = Energy_levels(g(j),R(i),0,1);
        [~,e2,~] = Energy_levels(g(j),R(i),1,1);
        y_plus(j) = min(sum(e2))-min(sum(e1));
        y_minus(j) = y_plus(j)-2*g(j);
    end
    
    plot(g,y_plus,'color',cc(i,:));
    hold on;
    plot(g,y_minus,'--','color',cc(i,:));
    
end

hold off

end