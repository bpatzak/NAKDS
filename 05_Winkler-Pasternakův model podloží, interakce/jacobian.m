function [j] = jacobian (ksi, eta, xe, ye)
  % pocita transformacni jakobian v damen integracnim bode
  % xe, ye jsou souradnice uzlu prvku
  dn = evaldn (ksi, eta);
  xeye = [xe(1) ye(1);
          xe(2) ye(2);
          xe(3) ye(3);
          xe(4) ye(4)];
  j = dn*xeye;
end
