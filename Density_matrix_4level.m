function ro = Density_matrix_4level(dp)
% f-ja za odredjivanje matrice gustine za sistem od 4 nivoa
% ulazni parametar je detuning za probe laser


fi = 0;                                 % fazna razlika

g1 = 1;                                 % koef. spontane emisije
g2 = 1;
gp = 1;
gc = 1;

dc = 0;                                 % detuning
d1 = 0;
d2 = dp+dc-d1;

rabyc = 10;                             % Rabijeve frekvencije
rabyp = 0.05;
raby1 = 10;
raby2 = 1;


syms ro11 ro12 ro13 ro14 ro21 ro22 ro23 ro24 ro31 ro32 ro33 ro34 ro41 ro42 ro43 ro44

e1 = gp*ro22 + g2*ro44 + 1i*(ro41-ro14)*raby2 + 1i*(ro21-ro12)*rabyp == 0;
e2 = -(gp/2 - 1i*dp)*ro12 - 1i*(ro11-ro22)*rabyp + 1i*exp(-1i*fi)*raby2*ro42 - 1i*exp(-1i*fi)*rabyc*ro13 == 0;
e3 = -(1/2*(g1+gc) - 1i*(d1+d2))*ro13 - 1i*exp(1i*fi)*(rabyc*ro12 - rabyp*ro23) + 1i*(raby2*ro43 - raby1*ro14) == 0;
e4 = -(g2/2 - 1i*d2)*ro14 - 1i*raby2*(ro11 - ro44) + 1i*exp(1i*fi)*ro24*rabyp - 1i*raby1*ro13 == 0;

e5 = -(gp/2 + 1i*dp)*ro21 - 1i*exp(1i*fi)*(ro24*raby2 - ro31*rabyc) - 1i*(ro22 - ro11)*rabyp == 0;
e6 = -gp*ro22 + gc*ro33 + 1i*rabyc*(ro32-ro23) + 1i*rabyp*(ro12-ro21) == 0;
e7 = -(1/2*(g1+gc+gp) - 1i*dc)*ro23 - 1i*ro24*raby1 - 1i*rabyc*(ro22-ro33) + 1i*exp(-1i*fi)*rabyp*ro13 == 0;
e8 = -(1/2*(g2+gp) + 1i*(dp-d2))*ro24 - 1i*exp(-1i*fi)*ro21*raby2 + 1i*ro34*rabyc - 1i*raby1*ro23 + 1i*exp(-1i*fi)*rabyp*ro14 == 0;

e9 = -(1/2*(g1+gc)+1i*(d1+d2))*ro31 + 1i*ro41*raby1 - 1i*ro34*raby2 + 1i*exp(1i*fi)*(ro21*rabyc-ro32*rabyp) == 0;
e10 = -(1/2*(g1+gc+gp)+1i*dc)*ro32 - 1i*rabyc*(ro33-ro22) - 1i*exp(1i*fi)*ro31*rabyp + 1i*raby1*ro42 == 0;
e11 = -g1*ro33 - gc*ro33 + 1i*rabyc*(ro23-ro32) + 1i*raby1*(ro43-ro34) == 0;
e12 = -(1/2*(g1+g2+gc)+1i*d1)*ro34 - 1i*(ro33-ro44)*raby1 - 1i*ro31*raby2 + 1i*ro24*rabyc == 0;

e13 = -(g2/2+1i*d2)*ro41 - 1i*raby2*(ro44-ro11) + 1i*raby1*ro31 - rabyp*1i*exp(-1i*fi)*ro42 == 0;
e14 = -(1/2*(g2+gp) + 1i*(d2-dp))*ro42 + 1i*ro32*raby1 - 1i*exp(1i*fi)*ro41*rabyp + 1i*exp(1i*fi)*raby2*ro12 - 1i*rabyc*ro43 == 0;
e15 = -(1/2*(g1+g2+gc) - 1i*d1)*ro43 - 1i*(ro44-ro33)*raby1 - 1i*rabyc*ro42 + 1i*raby2*ro13 == 0;
e16 = g1*ro33 - g2*ro44 + 1i*raby1*(ro34-ro43) + 1i*raby2*(ro14-ro41) == 0;

e17 = ro11 + ro22 + ro33 + ro44 == 1;


r = solve([e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17],...
    [ro11, ro12, ro13, ro14, ro21, ro22, ro23, ro24, ro31, ro32, ro33, ro34, ro41, ro42, ro43, ro44]);

ro = zeros(4,4);

ro(1,1) = r.ro11;
ro(1,2) = r.ro12;
ro(1,3) = r.ro13;
ro(1,4) = r.ro14;
ro(2,1) = r.ro21;
ro(2,2) = r.ro22;
ro(2,3) = r.ro23;
ro(2,4) = r.ro24;
ro(3,1) = r.ro31;
ro(3,2) = r.ro32;
ro(3,3) = r.ro33;
ro(3,4) = r.ro34;
ro(4,1) = r.ro41;
ro(4,2) = r.ro42;
ro(4,3) = r.ro43;
ro(4,4) = r.ro44;


end
