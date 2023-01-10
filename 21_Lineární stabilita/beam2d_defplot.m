% plots beam2d deformed geometry
%
% In: 
%   xz pole souradnic uzlu prutu (x1 z1 x2 z2)
%   n1 cislo prvniho uzlu
%   n2 cislo druheho uzlu
%   i  cislo prvku
%   r  globalni vektor posunuti 
%
% Globals
%   lm pole kodovych cisel prvku
%
% (c) B. Patzak, 2008
function beam2d_defplot (xz, r, i, fmt)

global lm;
l=sqrt((xz(3)-xz(1))^2+(xz(4)-xz(2))^2);
c = (xz(3)-xz(1))/l; 
s = (xz(4)-xz(2))/l; 

t = beam2d_t(xz);
re = zeros(6,1);

for j=1:6
  if lm(i,j) == 0
    re(j)=0.0;
  else 
    re(j)=r(lm(i,j));
  end;
end;

#local end displacement vector       
rel = t*re;
# for plotting divide element into np pieces
np=10;
dd = zeros(np+1,2);
for j=1:np+1
    x=-1.0+2.0*(j-1)/np;
    w =  0.25*((1-x)^2)*(2+x) * rel(2) - (l/8.)*(1+x)*(1-x)^2*rel(3) + (0.25*(2-x)*(1+x)^2)*rel(5) - ((l/8.)*(x-1)*(1+x)^2)*rel(6);
    u = 0.5*(1-x)*rel(1)+0.5*(1+x)*rel(4);
    
    ug = u*c-w*s;
    wg = u*s+w*c;
    dd(j,1) = 0.5*(1-x)*xz(1)+0.5*(1+x)*xz(3) + ug;
    dd(j,2) = 0.5*(1-x)*xz(2)+0.5*(1+x)*xz(4) + wg;
end

    
for j=1:np
  plot ([dd(j,1) dd(j+1,1)],[dd(j,2) dd(j+1,2)], fmt);
end;
end;
