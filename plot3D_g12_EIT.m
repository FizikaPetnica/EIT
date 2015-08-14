function plot3D_g12_EIT

n = 100;
m = zeros(n,10);

g12 = linspace(0.00001,0.1,10);
g23 = 0.5;

for i=1 : 10
    y = Absorption_plot(g12(i),g23);
    m(:,i) = y;
end

surf(m)

end

