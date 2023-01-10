function [N]=evaln(ksi, eta)
  % pocita hodnotu interpolacnich funkci 
  % v danem integracnim dobe (ksi, eta)
  N = [0.25*(1-ksi)*(1-eta);
      0.25*(1+ksi)*(1-eta);
      0.25*(1+ksi)*(1+eta);
      0.25*(1-ksi)*(1+eta)
      ];
end
