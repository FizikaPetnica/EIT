function plot3D_g23_EIT

n = 300;
k = 100;
m = zeros(n,k);

g12 = 0.08;
g23 = linspace(0.001,3,k);

for i=1 : k
    y = Absorption_plot(g12,g23(i));
    m(:,i) = y;
end

surf(m)

end