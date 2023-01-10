% funkce pocita matici tuhosti tazeneho-tlaceneho prutu ve 2d (truss 2d)
% In: 
%   x - vektor souradnic uzlu prvku (x1,y1, x2, y2)
%   EA- soucin modulu pruznosti a plochy
%
% Out:
%   ke - matice tuhosti prvku (4,4)
%
function ke = truss2d (x,EA) 

length=sqrt((x(3)-x(1))^2+(x(4)-x(2))^2);
c = (x(3)-x(1))/length; c2=c^2;
s = (x(4)-x(2))/length; s2=s^2;

ke=(EA/length)*[c2 c*s -c2 -c*s;
                c*s s2 -c*s -s2;
                -c2 -c*s c2 c*s;
                -c*s -s2 c*s s2];
end


