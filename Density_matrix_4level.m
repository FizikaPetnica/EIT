function  r = Density_matrix_4level 


% syms ro11 ro21 ro22 ro31 ro32 ro33 ro41 ro42 ro43 ro44

dp = 0;

g1 = 1;
g2 = 1;
gp = 1;
gc = 1;

dc = 0;
d1 = 0;
d2 = 0;

G32 = (g1+gc+gp)/2+1i*dc;
G34 = (g1+gc+g2)/2+1i*d1;
G31 = (g1+gc)/2+1i*(dp+dc);
G24 = (g2+gp)/2+1i*(dp-d2);
G21 = gp/2+1i*dp;
G41 = g2/2+1i*d2;

fi = 0;

rabyc = 10;
rabyp = 0.05;
raby1 = 10;
raby2 = 1;


syms ro11 ro21r ro21i ro22 ro31r ro31i ro32r ro32i ro33 ro41r ro41i ro42r ro42i ro43r ro43i ro44


e1 = -(g1+gc)*ro33 - 1i*rabyc*(ro32r+ro32i) - 1i*raby1*(ro43r-ro43i) + 1i*rabyc*(ro32r-ro32i) + 1i*raby1*(ro43r+ro43i) == 0;
e2 = gc*ro33 - gp*ro22 + 1i*rabyc*(ro32r+ro32i) - 1i*rabyp*(ro21r+ro21i) - 1i*rabyc*(ro32r-ro32i) + 1i*rabyp*(ro21r-ro21i) == 0;
e3 = g1*ro33 - g2*ro44 + 1i*raby1*(ro43r-ro43i) - 1i*raby2*(ro41r+ro41i) - 1i*raby1*(ro43r+ro43i) + 1i*raby2*(ro41r-ro41i) == 0;
e4 = -G32*(ro32r+ro32i) - 1i*rabyc*(ro33-ro22) - 1i*rabyp*(ro31r+ro31i)*exp(-1i*fi) + 1i*raby1*(ro42r+ro42i) == 0;
e5 = -G34*(ro43r-ro43i) - 1i*raby1*(ro33-ro44) - 1i*raby2*(ro31r+ro31i) + 1i*rabyc*(ro42r-ro42i) + 1i*rabyp*(ro21r-ro21i) == 0;
e6 = -G31*(ro31r+ro31i) - 1i*rabyp*(ro32r+ro32i)*exp(-1i*fi) - 1i*raby2*(ro43r-ro43i) + 1i*rabyc*(ro21r+ro21i)*exp(-1i*fi) + 1i*raby1*(ro41r+ro41i) == 0;
e7 = -G24*(ro42r-ro42i) + 1i*rabyc*(ro43r-ro43i) - 1i*raby2*(ro21r+ro21i)*exp(-1i*fi) - 1i*raby1*(ro32r-ro32i) + 1i*rabyp*(ro41r-ro41i)*exp(-1i*fi) == 0;
e8 = -G21*(ro21r+ro21i) - 1i*rabyp*(ro22-ro11) + 1i*rabyc*(ro31r+ro31i)*exp(1i*fi) - 1i*raby2*(ro42r-ro42i)*exp(1i*fi) == 0;
e9 = -G41*(ro41r+ro41i) - 1i*raby2*(ro44-ro11) + 1i*raby1*(ro31r+ro31i) - 1i*rabyp*(ro42r+ro42i)*exp(-1i*fi) == 0;
e10 = ro11 + ro22 + ro33 + ro44 == 1;
% e11 = ro12 == conj(ro21);
% e12 = ro13 == conj(ro31);
% e13 = ro14 == conj(ro41);
% e14 = ro23 == conj(ro32);
% e15 = ro24 == conj(ro42);
% e16 = ro34 == conj(ro43);

r = solve([e1, e2, e3, e4, e5, e6, e7, e8, e9, e10] ,...
    [ro11 ro21r ro21i ro22 ro31r ro31i ro32r ro32i ro33 ro41r ro41i ro42r ro42i ro43r ro43i ro44]);



% e1 = -(g1+gc)*ro33 - 1i*rabyc*ro32 - 1i*raby1*conj(ro43) + 1i*rabyc*conj(ro32) + 1i*raby1*ro43 == 0;
% e2 = gc*ro33 - gp*ro22 + 1i*rabyc*ro32 - 1i*rabyp*ro21 - 1i*rabyc*conj(ro32) + 1i*rabyp*conj(ro21) == 0;
% e3 = g1*ro33 - g2*ro44 + 1i*raby1*conj(ro43) - 1i*raby2*ro41 - 1i*raby1*ro43 + 1i*raby2*conj(ro41) == 0;
% e4 = -G32*ro32 - 1i*rabyc*(ro33-ro22) - 1i*rabyp*ro31*exp(-1i*fi) + 1i*raby1*ro42 == 0;
% e5 = -G34*conj(ro43) - 1i*raby1*(ro33-ro44) - 1i*raby2*ro31 + 1i*rabyc*conj(ro42) + 1i*rabyp*conj(ro21) == 0;
% e6 = -G31*ro31 - 1i*rabyp*ro32*exp(-1i*fi) - 1i*raby2*conj(ro43) + 1i*rabyc*ro21*exp(-1i*fi) + 1i*raby1*ro41 == 0;
% e7 = -G24*conj(ro42) + 1i*rabyc*conj(ro43) - 1i*raby2*ro21*exp(-1i*fi) - 1i*raby1*conj(ro32) + 1i*rabyp*conj(ro41)*exp(-1i*fi) == 0;
% e8 = -G21*ro21 - 1i*rabyp*(ro22-ro11) + 1i*rabyc*ro31*exp(1i*fi) - 1i*raby2*conj(ro42)*exp(1i*fi) == 0;
% e9 = -G41*ro41 - 1i*raby2*(ro44-ro11) + 1i*raby1*ro31 - 1i*rabyp*ro42*exp(-1i*fi) == 0;
% e10 = ro11 + ro22 + ro33 + ro44 == 1;
% 
% r = solve([e1, e2, e3, e4, e5, e6, e7, e8, e9, e10] , [ro11, ro21, ro22, ro31, ro32, ro33, ro41, ro42, ro43, ro44]);

% ro(1,2) = conj(ro(2,1));
% ro(1,3) = conj(ro(3,1));
% ro(1,4) = conj(ro(4,1));
% ro(2,3) = conj(ro(3,2));
% ro(2,4) = conj(ro(4,2));
% ro(3,4) = conj(ro(4,3));


end