function Refraction_index_plot
n = 300;
opseg = 2;

d12 = linspace(-opseg,opseg,n);
nn = zeros(1,n);

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

G21 = SEmission (m2,s2,k2, m1,s1,k1);
G32 = SEmission (m3,s3,k3, m2,s2,k2);

%G32 = 0.15;
%G21 = 0.01;
g12 = 0.0001;
g23 = 0.5;


for i=1 : n
    ro = OBE(d12(i), G21, G32, g12, g23);
    ro = ro/trace(ro);
    nn(i) = d/(2*eps*hbar)*(ro(2,1)+ro(1,2));
end

plot(d12,nn,'r');

end