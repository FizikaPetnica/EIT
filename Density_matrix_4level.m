function ro = Density_matrix_4level(dp)
% f-ja za odredjivanje matrice gustine za sistem od 4 nivoa
% ulazni parametar je detuning za probe laser


fi = 0;                     % fazna razlika

g1 = 1;                     % koef. spontane emisije
g2 = 1;
gp = 1;
gc = 1;

dc = 0;                     % detuning
d1 = 0;
d2 = dp+dc-d1;

G32 = (g1+gc+gp)/2 + 1i*dc;
G34 = (g1+gc+g2)/2 + 1i*d1;
G31 = (g1+gc)/2 + 1i*(dp+dc);
G24 = (g2+gp)/2 + 1i*(dp-d2);
G21 = gp/2 + 1i*dp;
G41 = g2/2 + 1i*d2;

rabyc = 10;                 % Rabijeve frekvencije
rabyp = 0.05;
raby1 = 10;
raby2 = 1;


syms ro11 ro21real ro21imag ro22 ro31real ro31imag ro32real ro32imag ro33 ro41real ro41imag ro42real ro42imag ro43real ro43imag ro44

e1 = -(g1 + gc)*ro33 - 1i*rabyc*(ro32real+1i*ro32imag) - 1i*raby1*(ro43real-1i*ro43imag) + 1i*rabyc*(ro32real-1i*ro32imag) + 1i*raby1*(ro43real+1i*ro43imag) == 0; 
e2 = gc*ro33 - gp*ro22 + 1i*rabyc*(ro32real+1i*ro32imag) - 1i*rabyp*(ro21real+1i*ro21imag) - 1i*rabyc*(ro32real-1i*ro32imag) + 1i*rabyp*(ro21real-1i*ro21imag) == 0; 
e3 = g1*ro33 - g2*ro44 + 1i*raby1*(ro43real-1i*ro43imag) - 1i*raby2*(ro41real+1i*ro41imag) - 1i*raby1*(ro43real+1i*ro43imag) + 1i*raby2*(ro41real-1i*ro41imag) == 0;
e4 = -G32*(ro32real+1i*ro32imag) - 1i*rabyc*(ro33 - ro22) - 1i*rabyp*(ro31real+1i*ro31imag)*exp(-1i*fi) + 1i*raby1*(ro42real+1i*ro42imag) == 0;
e5 = -G34*(ro43real-1i*ro43imag) - 1i*raby1*(ro33 - ro44) - 1i*raby2*(ro31real+1i*ro31imag) + 1i*rabyc*(ro42real-1i*ro42imag) + 1i*rabyp*(ro21real-1i*ro21imag) == 0;
e6 = -G31*(ro31real+1i*ro31imag) - 1i*rabyp*(ro32real+1i*ro32imag)*exp(-1i*fi) - 1i*raby2*(ro43real-1i*ro43imag) + 1i*rabyc*(ro21real+1i*ro21imag)*exp(-1i*fi) + 1i*raby1*(ro41real+1i*ro41imag) == 0;
e7 = -G24*(ro42real-1i*ro42imag) + 1i*rabyc*(ro43real-1i*ro43imag) - 1i*raby2*(ro21real+1i*ro21imag)*exp(-1i*fi) - 1i*raby1*(ro32real-1i*ro32imag) + 1i*rabyp*(ro41real-1i*ro41imag)*exp(-1i*fi) == 0;
e8 = -G21*(ro21real+1i*ro21imag) - 1i*rabyp*(ro22 - ro11) + 1i*rabyc*(ro31real+1i*ro31imag)*exp(1i*fi) - 1i*raby2*(ro42real-1i*ro42imag)*exp(1i*fi) == 0;
e9 = -G41*(ro41real+1i*ro41imag) - 1i*raby2*(ro44 - ro11) + 1i*raby1*(ro31real+1i*ro31imag) - 1i*rabyp*(ro42real+1i*ro42imag)*exp(-1i*fi) == 0;
e10 = ro11 + ro22 + ro33 + ro44 == 1;


r = solve([e1,e2,e3,e4,e5,e6,e7,e8,e9,e10],...
    [ro11, ro21real, ro21imag, ro22 ro31real ro31imag ro32real ro32imag ro33 ro41real ro41imag ro42real ro42imag ro43real ro43imag ro44]);

ro = zeros(4,4);                                        % density matrix

ro(1,1) = r.ro11;
ro(2,1) = r.ro21real + 1i*r.ro21imag;
ro(2,2) = r.ro22;
ro(3,1) = r.ro31real + 1i*r.ro31imag;
ro(3,2) = r.ro32real + 1i*r.ro32imag;
ro(3,3) = r.ro33;
ro(4,1) = r.ro41real + 1i*r.ro41imag;
ro(4,2) = r.ro42real + 1i*r.ro42imag;
ro(4,3) = r.ro43real + 1i*r.ro43imag;
ro(4,4) = r.ro44;

ro(1,2) = conj(ro(2,1));
ro(1,3) = conj(ro(3,1));
ro(1,4) = conj(ro(4,1));
ro(2,3) = conj(ro(3,2));
ro(2,4) = conj(ro(4,2));
ro(3,4) = conj(ro(4,3));

end
