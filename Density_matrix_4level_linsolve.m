function ro = Density_matrix_4level_linsolve(dp,fi)

% f-ja za odredjivanje matrice gustine za sistem od 4 nivoa
% ulazni parametar je detuning za probe laser


% fi = 0;                                 % fazna razlika

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


A = zeros(17,16);
B = zeros(17,1);


A(1,:) = [0, -1i*rabyp, 0, -1i*raby2, ...
          1i*rabyp, gp, 0, 0, ...
          0, 0,  0, 0, ...
          1i*raby2, 0, 0, g2];
      
A(2,:) = [-1i*rabyp, -gp/2+1i*dp, -1i*exp(-1i*fi)*rabyc, 0, ...
          0, 1i*rabyp, 0,  0, ...
          0, 0, 0, 0, ...
          0, 1i*exp(-1i*fi)*raby2, 0, 0];
      
A(3,:) = [0, -1i*exp(1i*fi)*rabyc, -(1/2*(g1+gc)-1i*(d1+d2)), -1i*raby1, ...
          0, 0, 1i*exp(1i*fi)*rabyp, 0, ...
          0, 0, 0, 0, ...
          0, 0, 1i*raby2, 0];
      
A(4,:) = [-1i*raby2, 0, -1i*raby1, -g2/2+1i*d2, ...
          0, 0, 0, 1i*exp(1i*fi)*rabyp, ...
          0, 0, 0, 0, ...
          0, 0, 0, 1i*raby2];
      
A(5,:) = [1i*rabyp, 0, 0, 0, ...
          -(gp/2+1i*dp), -1i*rabyp, 0, -1i*exp(1i*fi)*raby2, ...
          1i*exp(1i*fi)*rabyc, 0, 0, 0, ...
          0, 0, 0, 0];
      
A(6,:) = [0, 1i*rabyp, 0, 0, ...
          -1i*rabyp, -gp, -1i*rabyc, 0, ...
          0, 1i*rabyc, gc, 0, ...
          0, 0, 0, 0];

A(7,:) = [0, 0, 1i*exp(-1i*fi)*rabyp, 0, ...
          0, -1i*rabyc, -1/2*(g1+gc+gp)+1i*dc, -1i*raby1, ...
          0, 0, 1i*rabyc, 0, ...
          0, 0, 0, 0];

A(8,:) = [0, 0, 0, 1i*exp(-1i*fi)*rabyp, ...
          -1i*exp(-1i*fi)*raby2, 0, -1i*raby1, 1/2*(g2+gp)-1i*(dp-d2), ...
          0, 0, 0, 1i*rabyc, ...
          0, 0, 0, 0];

A(9,:) = [0, 0, 0, 0, ...
          1i*exp(1i*fi)*rabyc, 0, 0, 0, ...
          -1/2*(g1+gc)-1i*(d1+d2), -1i*exp(1i*fi)*rabyp, 0, -1i*raby2, ...
          1i*raby1, 0, 0, 0];

A(10,:) = [0, 0, 0, 0, ...
          0, 1i*rabyc, 0, 0, ...
          -1i*exp(1i*fi)*rabyp, -1/2*(g1+gc+gp)-1i*dc, -1i*rabyc, 0, ...
          0, 1i*raby1, 0, 0];

A(11,:) = [0, 0, 0, 0, ...
          0, 0, 1i*rabyc, 0, ...
          0, -1i*rabyc, -g1-gc, -1i*raby1, ...
          0, 0, 1i*raby1, 0];

A(12,:) = [0, 0, 0, 0, ...
          0, 0, 0, 1i*rabyc, ...
          -1i*raby2, 0, -1i*raby1, -1/2*(g1+g2+gc)-1i*d1, ...
          0, 0, 0, 1i*raby1];

A(13,:) = [1i*raby2, 0, 0, 0, ...
          0, 0, 0, 0, ...
          1i*raby1, 0, 0, 0, ...
          -g2/2-1i*d2, -rabyp*1i*exp(-1i*fi), 0, -1i*raby2];

A(14,:) = [0, 1i*exp(1i*fi)*raby2, 0, 0, ...
          0, 0, 0, 0, ...
          0, 1i*raby1, 0, 0, ...
          -1i*exp(1i*fi)*rabyp, -1/2*(g2+gp)-1i*(d2-dp), -1i*rabyc, 0];

A(15,:) = [0, 0, 1i*raby2, 0, ...
          0, 0, 0, 0, ...
          0, 0, 1i*raby1, 0, ...
          0, -1i*rabyc, -1/2*(g1+g2+gc)+1i*d1, -1i*raby1];

A(16,:) = [0, 0, 0, 1i*raby2, ...
          0, 0, 0, 0, ...
          0, 0, g1, 1i*raby1, ...
          -1i*raby2, 0, -1i*raby1, -g2];

A(17,:) = [1, 0, 0, 0, ...
          0, 1, 0, 0, ...
          0, 0, 1, 0, ...
          0, 0, 0, 1];

B(17) = 1;

X = linsolve(A,B);

ro = vec2mat(X,4);

end