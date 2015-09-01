function gn = normalize (g, n, R)       % normalizacija talasne funkcije

r = linspace(0,R,n+2) + R/(n+1);
teta = linspace(0,pi/2,n+2) + pi/(2*n+2);

suma = 0;

for j=1 : n
    for i=1 : n
        suma = suma + abs(g(i,j))^2 * r(i)^2*sin(teta(j));
    end
end

suma = 2*suma/n^2;

gn = g*sqrt(1/suma);

end
