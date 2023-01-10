function [dn]=evaldn(ksi, eta)
  % pocita derivace interpolacnich funkci
  % vzhledem k prirozenym souradnicim ksi, eta
  dn = [-0.25*(1-eta)  0.25*(1-eta) 0.25*(1+eta) -0.25*(1+eta);
        -0.25*(1-ksi) -0.25*(1+ksi) 0.25*(1+ksi)  0.25*(1-ksi)];
end
