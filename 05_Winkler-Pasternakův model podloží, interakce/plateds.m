function [d]=plateds (E,v,h)
  % pocita matici smykove tuhosti desky
  k=5/6;
  G=E/(2*(1+v));
  d = [k*G*h 0;
       0 k*G*h];
end
