function [k]=platekss (E, v, h, xe, ye)
  k = zeros(12);
  
  d = plateds(E,v,h);
 
  % redukovana integrace Kss
  w = [4];
  ipc=[0 0];
  for i=1:1
    ksi = ipc(i,1);
    eta = ipc(i,2);
    n = evaln (ksi, eta);
    jac = jacobian (ksi, eta, xe, ye);
    dndx = evaldndx (ksi,eta,jac,xe, ye);
    
    nw = [dndx(1,1) 0 0 dndx(1,2) 0 0 dndx(1,3) 0 0 dndx(1,4) 0 0
          dndx(2,1) 0 0 dndx(2,2) 0 0 dndx(2,3) 0 0 dndx(2,4) 0 0];
          
    k = k+w(i)*det(jac)*nw'*d*nw;
    end
end   