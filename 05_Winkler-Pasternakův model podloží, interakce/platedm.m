function [d]=platedm (E,v,h)
  % pocita matici ohybove tuhosti desky
  tmp=E*h*h*h/(12*(1-v*v));
  d = tmp*[1 v 0;
           v 1 0
           0 0 (1-v)/2];
end
