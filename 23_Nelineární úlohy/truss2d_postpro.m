% funkce pro vypocet deformaci a vnitrnich sil na prvku
% In:
%   x - vektor souradnic uzlu prvku  (x1,y1,x2,y2)
%   E-  modul pruznosti
%   r - vektor uzlovych posunu prvku (u1,v1,u2,v2)
%
% Out:
%   eps deformace
%   s   napeti
%
function [eps,s] = truss2d_postpro (x,E,r) 

l=sqrt((x(3)-x(1))^2+(x(4)-x(2))^2);
x12=x(1)-x(3);
y12=x(2)-x(4);
x21=x(3)-x(1);
y21=x(4)-x(2);

u12=r(1)-r(3);
v12=r(2)-r(4);
u21=r(3)-r(1);
v21=r(4)-r(2);

eps=(1/l/l)*(x12*r(1)+y12*r(2)+x21*r(3)+y21*r(4)) + (1/(l*l*2))*(u12*r(1)+v12*r(2)+u21*r(3)+v21*r(4));
s   = E*eps;
end


