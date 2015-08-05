function plotQD (k)
R = 5;
sig = 1;

[g,e,~]=Energy_levels(0,R,-1,sig);
e=sum(e);

n = 25;

r = linspace(R/(n+2),R-R/(n+2),n);
teta = linspace(pi/2/(n+2),pi/2-pi/2/(n+2),n);

x = zeros(1,n*n);
y = zeros(1,n*n);

[~,i] = sort(e);
index = i(k);

z = g(:,index);

z = abs(z);
%z=z.*z;
%z=vec2mat(z,n);


s=size(z);
c=zeros(s(1),3);
for i=1 : s(1)
    c(i,1)=(z(i)-min(z))/(max(z)-min(z));
    c(i,2)=c(i,1);
    c(i,3)=0.4;
end


for i=1 : n
    for j=1 : n
        x((i-1)*n+j) = r(i)*cos(teta(j));
        y((i-1)*n+j) = r(i)*sin(teta(j));
        %plot3(x((i-1)*n+j),y((i-1)*n+j),z((i-1)*n+j),'.','MarkerSize',30,'color',c((i-1)*n+j,:));
        %hold on
        %plot3(-x((i-1)*n+j),y((i-1)*n+j),sig*z((i-1)*n+j),'.','MarkerSize',30,'color',c((i-1)*n+j,:));
    end
end

%hold off

xx=[x -x x -x];
yy=[y y -y -y];
zz=[z' z' z' z'];


[xq,yq] = meshgrid(-5:.01:5, -5:.01:5);
Vq = griddata(xx,yy,zz,xq,yq);
mesh(xq,yq,Vq);


end