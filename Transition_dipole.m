function [dx,dy,dz] = Transition_dipole   % odredjuje dipolni moment prelaza 
                                          % za nivoe ciji se parametri unose rucno
                                            
k = 1;              % prvi nivo je k-ti minimum koji vraca Energy_levels
l = 1;              % drugi nivo je l-ti minimum 

g = 0;          % jacina magnetnog polja
R = 5;          % poluprecnik kvantne tacke

n = 25;         % broj podeoka, mora da bude isti i u Energy_levels da bi radilo 

m1 = 0;
m2 = 0;

s1 = 1;
s2 = -1;

[g1,e1,~] = Energy_levels (g, R, m1, s1);
[g2,e2,~] = Energy_levels (g, R, m2, s2);


[~,i1] = sort(e1);          % nalazenje talasnih f-ja za prvi i drugi nivo
index1 = i1(k);             % i njihova normalizacija
g1 = g1(:,index1);
g1 = vec2mat(g1,n);
g1 = Normalized(g1,n,R);

[~,i2] = sort(e2);
index2 = i2(l);
g2 = g2(:,index2);
g2 = vec2mat(g2,n);
g1 = Normalized(g1,n,R);


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
        
        