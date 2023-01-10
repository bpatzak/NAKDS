function [k]=platepodlozi (C1, C2, xe, ye)
  k = zeros(12);
  
  d = [C2 0;
        0 C2];
 
  % matice K1+k2
  w = [1 1 1 1]; 
  ipc = [-0.577350269189626  -0.577350269189626 ;
        0.577350269189626  -0.577350269189626 ;
       -0.577350269189626   0.577350269189626 ;
        0.577350269189626   0.577350269189626 ];
  for i=1:4
    ksi = ipc(i,1);
    eta = ipc(i,2);
    n = evaln (ksi, eta);
    jac = jacobian (ksi, eta, xe, ye);
    dndx = evaldndx (ksi,eta,jac,xe, ye);
    
    nw = [n(1) 0 0 n(2) 0 0 n(3) 0 0 n(4) 0 0];
        
    b = [dndx(1,1) 0 0 dndx(1,2) 0 0 dndx(1,3) 0 0 dndx(1,4) 0 0
          dndx(2,1) 0 0 dndx(2,2) 0 0 dndx(2,3) 0 0 dndx(2,4) 0 0];    
         
    % K1     
    k = k+w(i)*det(jac)*nw'*C1*nw;
    % K2
    k = k+w(i)*det(jac)*b'*d*b;
    end
end   