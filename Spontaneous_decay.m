function A = Spontaneous_decay (g, m1, s1, k1, m2, s2, k2)
% odredjuje koeficijent spontane emisije

% m je magnetni kvantni broj, s je za simetriju talasne f-je; trazenom
% energetskom nivou odgovara k-ti minimum energija koji vraca Energy_levels

%g = 0;                              % jacina magnetnog polja
R = 5;                              % poluprecnik kvantne tacke


c = 137;                            %konstante u atomskim jedinicama
hbar = 1;
epsilon = 1/(4*pi);

[~,e1,~] = Energy_levels (g, R, m1, s1);
[~,e2,~] = Energy_levels (g, R, m2, s2);

m = sort(sum(e1));                  %odredjivanje energija nivoa
e1 = m(k1);
m = sort(sum(e2));
e2 = m(k2);

omega = (e1-e2)/hbar;               %rezonantna frekvencija izmedju dva nivoa

[dx,dy,dz] = Transition_dipole (g,m1, s1, k1, m2, s2, k2) ;
d = dx^2+dy^2+dz^2;                 %kvadrat dipolnog momenta prelaza


A = d*omega^3/(3*pi*epsilon*hbar*c^3);

end