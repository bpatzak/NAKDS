function [dndx]=evaldndx (ksi, eta, jac, xe, ye)
  % pocita derivace interpolacnich funkci 
  % dle kartezskych souradnic x,y
  dn = evaldn(ksi,eta);
  dndx = inv(jac)*dn;
end
