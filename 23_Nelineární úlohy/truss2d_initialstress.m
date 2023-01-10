% funkce pocita matici pocatecnich napeti tazeneho-tlaceneho prutu ve 2d 
% In: 
%   x - vektor souradnic uzlu prvku (x1,y1, x2, y2)
%   A-  plochy
%   S-  napeti (tahove)
%
% Out:
%   ke - matice tuhosti prvku (4,4)
%
function ke = truss2d_initialstress (x,A,S) 

length=sqrt((x(3)-x(1))^2+(x(4)-x(2))^2);
c = (x(3)-x(1))/length; c2=c^2;
s = (x(4)-x(2))/length; s2=s^2;

ke=(S*A/length)*[1  0 -1  0;
		 0  1  0 -1;
		-1  0  1  0;
		    0 -1  0  1];
                
end


