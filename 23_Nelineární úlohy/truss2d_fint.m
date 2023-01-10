% funkce pro vypocet vektoru vnitrnich uzlovych sil fint na prvku
% In:
%   x - vektor souradnic uzlu prvku  (x1,y1,x2,y2)
%   r - vektor uzlovych posunu prvku (u1,v1,u2,v2)
%   s - vnitrni sily = napeti
%   A - plocha
%
% Out:
%   fint
%
   function fint= truss2d_fint (x,r,s,A) 

l=sqrt((x(3)-x(1))^2+(x(4)-x(2))^2);
xu = x+r;

fint=s*(A/l)*[xu(1)-xu(3);xu(2)-xu(4);xu(3)-xu(1);xu(4)-xu(2)];
end


