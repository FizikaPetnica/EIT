function [G,E,L] = Energy_levels (g, R, M, s)

m = 25;             % g je jacina magnetnog polja, R je poluprecnik, M je magnetni kvantni broj, s je za simetrinju
n = m;              % G je matrica vrednosti talasnih f-ja, E su energije, L je lambda matrica

h = R/(m+1);
k = pi/(2*n+2);

r = linspace(0,R,m+2);
teta = linspace(0,pi/2,n+2);

V = zeros(n+1, m+1);        % potencijalna energija
L = zeros(m*n, m*n);        


for i=2 : 1 : m+1
    for j=2 : 1 : n+1
        
        V(i,j) = M*g + M^2/(r(i)^2*(sin(teta(j)))^2) + g^2/4*r(i)^2*(sin(teta(j)))^2 - 2/r(i);
        
        L( index(i,j,n) , index(i,j,n) ) = 2/h^2 + 2/(k^2*r(i)^2) + V(i,j);
  
        if i>2
            L( index(i,j,n) , index(i-1,j,n) ) = -1/h^2 + 1/(h*r(i));
        end
        
        if i<m+1
            L( index(i,j,n) , index(i+1,j,n) ) = -1/h^2 - 1/(h*r(i));
        end
        
        if j>2
            L( index(i,j,n) , index(i,j-1,n) ) = -1/(k^2*r(i)^2) + cot(teta(j))/(2*k*r(i)^2);
        end
        
        if j<n+1
            L( index(i,j,n) , index(i,j+1,n) ) = -1/(k^2*r(i)^2) - cot(teta(j))/(2*k*r(i)^2);
        end
        
        if j==2 && M==0
            L( index(i,j,n) , index(i,j,n) ) = L( index(i,j,n) , index(i,j,n) ) +4/3* (-1/(k^2*r(i)^2) + cot(teta(j))/(2*k*r(i)^2));
            L( index(i,j,n) , index(i,j+1,n) ) = L( index(i,j,n) , index(i,j+1,n) ) -1/3* (-1/(k^2*r(i)^2) + cot(teta(j))/(2*k*r(i)^2));
        end
        
        if j==n+1 && s==1
            L( index(i,j,n) , index(i,j,n) ) = L( index(i,j,n) , index(i,j,n) ) +4/3* (-1/(k^2*r(i)^2) - cot(teta(j))/(2*k*r(i)^2));
            L( index(i,j,n) , index(i,j-1,n) ) = L( index(i,j,n) , index(i,j-1,n) ) -1/3* (-1/(k^2*r(i)^2) - cot(teta(j))/(2*k*r(i)^2));
        end
        
    end
end

[G,E] = eig(L);

end