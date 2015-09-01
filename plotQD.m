function plotQD (k)

R = 5;
sig = 1;

[g,e,~] = Energy_levels(0,R,0,sig);
e = sum(e);

n = 15;

r = linspace(R/(n+2),R-R/(n+2),n);
teta = linspace(pi/2/(n+2),pi/2-pi/2/(n+2),n);

x = zeros(1,n*n);
y = zeros(1,n*n);

[~,i] = sort(e);
index = i(k);

z = g(:,index);
z = abs(z);
%z=z.*z;

for i=1 : n
    for j=1 : n
        x((i-1)*n+j) = r(i)*cos(teta(j));
        y((i-1)*n+j) = r(i)*sin(teta(j));
    end
end

xx = [x -x x -x];
yy = [y y -y -y];
zz = [z' z' z' z'];

[xq,yq] = meshgrid(-R:.01:R, -R:.01:R);
Vq = griddata(xx,yy,zz,xq,yq);
mesh(xq,yq,Vq);

end