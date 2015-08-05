function Figure5

R = 5;

n = 20;

g = linspace(0,0.5,n);

y2s = zeros(1,n);

y2p = zeros(1,n);
y2p_plus1 = zeros(1,n);
y2p_minus1 = zeros(1,n);

y3p = zeros(1,n);
y3p_plus1 = zeros(1,n);
y3p_minus1 = zeros(1,n);

y3d = zeros(1,n);
y3d_plus1 = zeros(1,n);
y3d_minus1 = zeros(1,n);
y3d_plus2 = zeros(1,n);
y3d_minus2 = zeros(1,n);

y4f = zeros(1,n);
y4f_plus1 = zeros(1,n);
y4f_minus1 = zeros(1,n);
y4f_plus2 = zeros(1,n);
y4f_minus2 = zeros(1,n);
y4f_plus3 = zeros(1,n);
y4f_minus3 = zeros(1,n);


for j=1 : 1 : n
    
    [~,e01,~] = Energy_levels(g(j),R,0,1);
    e01 = sort(sum(e01));
                                            % m = 0   s = 1
    y2s(j) = e01(2)-e01(1);
    y3d(j) = e01(3)-e01(1);
        
    %----------------------------------------
    
    [~,e0_1,~] = Energy_levels(g(j),R,0,-1);
    e0_1 = sort(sum(e0_1));
                                            % m = 0   s = -1
    y2p(j) = e0_1(1)-e01(1);
    y3p(j) = e0_1(3)-e01(1);
    y4f(j) = e0_1(2)-e01(1);
        
    %----------------------------------------
    
    [~,e11,~] = Energy_levels(g(j),R,1,1);
    e11 = sort(sum(e11));
                                            % m = 1   s = 1
    y2p_plus1(j) = e11(1)-e01(1);
    y2p_minus1(j) = y2p_plus1(j)-2*g(j);
    
    y3p_plus1(j) = e11(3)-e01(1);
    y3p_minus1(j) = y3p_plus1(j)-2*g(j);
    
    y4f_plus1(j) = e11(2)-e01(1);
    y4f_minus1(j) = y4f_plus1(j)-2*g(j);
        
    %----------------------------------------
    
    [~,e1_1,~] = Energy_levels(g(j),R,1,-1);
    e1_1 = sort(sum(e1_1));
                                            % m = 1   s = -1
    y3d_plus1(j) = e1_1(1)-e01(1);
    y3d_minus1(j) = y3d_plus1(j)-2*g(j);
        
    %----------------------------------------
    
    [~,e21,~] = Energy_levels(g(j),R,2,1);
    e21 = sort(sum(e21));
                                            % m = 2   s = 1
    y3d_plus2(j) = e21(1)-e01(1);
    y3d_minus2(j) = y3d_plus2(j)-4*g(j);
        
    %----------------------------------------
    
    [~,e2_1,~] = Energy_levels(g(j),R,2,-1);
    e2_1 = sort(sum(e2_1));
                                            % m = 2   s = -1
    y4f_plus2(j) = e2_1(1)-e01(1);
    y4f_minus2(j) = y4f_plus2(j)-4*g(j);
        
    %----------------------------------------
    
    [~,e31,~] = Energy_levels(g(j),R,3,1);
    e31 = sort(sum(e31));
                                            % m = 3   s = 1
    y4f_plus3(j) = e31(1)-e01(1);
    y4f_minus3(j) = y4f_plus3(j)-6*g(j);
        
end
    
plot(y2s,g,'-m');
hold on;
    
plot(y2p,g,'-r');
plot(y2p_plus1,g,'--r');
plot(y2p_minus1,g,'--r');
    
plot(y3p,g,'-g');
plot(y3p_plus1,g,'--g');
plot(y3p_minus1,g,'--g');
    
plot(y3d,g,'-b');
plot(y3d_plus1,g,'--b');
plot(y3d_minus1,g,'--b');
plot(y3d_plus2,g,'-.b');
plot(y3d_minus2,g,'-.b');
    
plot(y4f,g,'-k');
plot(y4f_plus1,g,'--k');
plot(y4f_minus1,g,'--k');
plot(y4f_plus2,g,'-.k');
plot(y4f_minus2,g,'-.k');
plot(y4f_plus3,g,'.k');
plot(y4f_minus3,g,'.k');

hold off

end