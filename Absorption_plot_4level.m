function Absorption_plot_4level

n = 500;
opseg = 30;

dp = linspace (-opseg,opseg,n);
alpha = zeros(1,n);


for i=1 : n
%     ro = Ne_radi(dp(i));
    ro = Density_matrix_4level(dp(i));
    alpha(i) = imag(ro(2,1));
%     alpha(i) = ro(2,2)-ro(1,1);
end

plot(dp,alpha);

end