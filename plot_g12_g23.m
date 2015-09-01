function plot_g12_g23


m1 = 0;
s1 = 1;
k1 = 1;

m2 = 1;
s2 = 1;
k2 = 1;

m3 = 2;
s3 = 1;
k3 = 1;

[dx,dy,dz] = Transition_dipole (m1,s1,k1,m2,s2,k2);
d = dx^2+dy^2+dz^2;

hbar = 1;
eps = 1/(4*pi);

G21 = Spontaneous_decay (m2,s2,k2, m1,s1,k1);
G32 = Spontaneous_decay (m3,s3,k3, m2,s2,k2);

k = 100;
alpha = zeros(k,k);

g12 = linspace(0.00001,0.5,k);
g23 = linspace(5,15,k);

n = 500;
opseg = 3.1;

d12 = linspace(-opseg,opseg,n);
aps = zeros(1,n);

for i=1 : k
    for j=1 : k
        for l=1 : n
            ro = OBE(d12(l), G21, G32, g12(i), g23(j));
            ro = ro/trace(ro);
            aps(l) = d/(2*eps*hbar)*1i*(ro(2,1)-ro(1,2));
        end
        alpha(i,j) = max(aps);
    end
end

surf(g12,g23,alpha)

end

