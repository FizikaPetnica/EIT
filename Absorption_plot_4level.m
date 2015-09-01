function Absorption_plot_4level

n = 100;
opseg = 30;

dp = linspace (-opseg,opseg,n);
alpha = zeros(1,n);


for i=1 : n
    ro = Density_matrix_4level(dp(i));
    alpha(i) = imag(ro(2,1));
%     alpha(i) = abs(ro(2,2))-abs(ro(1,1));
end

plot(dp,alpha);

end