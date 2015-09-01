function [dx,dy,dz] = Transition_dipole (g, m1, s1, k1, m2, s2, k2) 
% odredjuje dipolni moment prelaza 1->2
                                            
% m je magnetni kvantni broj, s je za simetriju talasne f-je; trazenom
% energetskom nivou odgovara k-ti minimum energija koji vraca Energy_levels

%g = 0;          % jacina magnetnog polja
R = 5;          % poluprecnik kvantne tacke

n = 15;         % broj podeoka, mora da bude isti i u Energy_levels da bi radilo 


[g1,e1,~] = Energy_levels (g, R, m1, s1);
[g2,e2,~] = Energy_levels (g, R, m2, s2);


[~,i] = sort(sum(e1));          % nalazenje talasnih f-ja za prvi i drugi nivo
g1 = g1(:,i(k1));               % i njihova normalizacija
g1 = vec2mat(g1,n);
g1 = normalize(g1,n,R);

[~,i] = sort(sum(e2));
g2 = g2(:,i(k2));
g2 = vec2mat(g2,n);
g2 = normalize(g2,n,R);


r = linspace(0,R,n+2) + R/(n+1);
teta = linspace(0,pi/2,n+2) + pi/(2*n+2);

sumax = 0;
sumay = 0;
sumaz = 0;

for j=1 : n
    for i=1 : n
        sumax = sumax + conj(g1(i,j))*g2(i,j) * (r(i))^3 * (sin(teta(j)))^2;
        sumay = sumay + conj(g1(i,j))*g2(i,j) * (r(i))^3 * (sin(teta(j)))^2;
        sumaz = sumaz + conj(g1(i,j))*g2(i,j) * (r(i))^3 * sin(teta(j))*cos(teta(j));
    end
end

dx = sumax*(1+s1*s2)*(abs(m2-m1)==1)*pi/n^2;
dy = sumay*(1+s1*s2)*(abs(m2-m1)==1)*(m2-m1)*i*pi/n^2;
dz = sumaz*(1-s1*s2)*(m2-m1==0)/n^2;

end
