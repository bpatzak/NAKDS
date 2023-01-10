% funkce pocita matici pocatecni deformace tazeneho-tlaceneho prutu ve 2d 
% In: 
%   x - vektor souradnic uzlu prvku (x1,y1, x2, y2)
%   r-  vektor posunuti uzlu prvku  (u1,v1, u2, v2)
%   EA- soucin modulu pruznosti a plochy
%
% Out:
%   ke - matice tuhosti prvku (4,4)
%
function ke = truss2d_initialdeformation (x,r, EA) 

length=sqrt((x(3)-x(1))^2+(x(4)-x(2))^2);
x12=x(1)-x(3);
y12=x(2)-x(4);
x21=x(3)-x(1);
y21=x(4)-x(2);

u12=r(1)-r(3);
v12=r(2)-r(4);
u21=r(3)-r(1);
v21=r(4)-r(2);
l3 = length*length*length;

k21=[x12*u12 x12*v12 x12*u21 x12*v21;
     y12*u12 y12*v12 y12*u21 y12*v21;
     x21*u12 x21*v12 x21*u21 x21*v21;	
	y21*u12 y21*v12 y21*u21 y21*v21];

k22=[u12*u12 u12*v12 u12*u21 u12*v21;
     v12*u12 v12*v12 v12*u21 v12*v21;
     u21*u12 u21*v12 u21*u21 u21*v21;	
	v21*u12 v21*v12 v21*u21 v21*v21];

ke=(EA/l3)*(k21+k22+k21');
end


