function [k]=platekmm (E, v, h, xe, ye)
  % funkce pocita prispevek do matice tuhosti prvku (kmm1+kmm2)
  % pozn: razeni neznamych na prvku: w1, f1_x, f1_y, ....
  k = zeros(12);
  % integracni vahy a integracni body -> plna integrace
  w = [1 1 1 1]; 
  ipc = [-0.577350269189626  -0.577350269189626 ;
        0.577350269189626  -0.577350269189626 ;
       -0.577350269189626   0.577350269189626 ;
        0.577350269189626   0.577350269189626 ];
  
  d = platedm (E, v, h);
  for i=1:4
    ksi = ipc(i,1);
    eta = ipc(i,2);
    jac = jacobian (ksi, eta, xe, ye);
    dndx = evaldndx (ksi,eta,jac,xe, ye);

    b = [0 0 dndx(1,1)          0 0 dndx(1,2)          0 0 dndx(1,3)          0 0 dndx(1,4);
         0 -dndx(2,1) 0         0 -dndx(2,2) 0         0 -dndx(2,3) 0         0 -dndx(2,4) 0;
         0 -dndx(1,1) dndx(2,1) 0 -dndx(1,2) dndx(2,2) 0 -dndx(1,3) dndx(2,3) 0 -dndx(1,4) dndx(2,4)];
    k = k+det(jac)*w(i)*b'*d*b  ;
  end
  
  
  d = plateds(E,v,h);
 
  % redukovana integrace Kmm2
  w = [4];
  ipc=[0 0];
  for i=1:1
    ksi = ipc(i,1);
    eta = ipc(i,2);
    n = evaln (ksi, eta);
    jac = jacobian (ksi, eta, xe, ye);
    sn = [ 0 0 n(1)  0 0 n(2)     0 0 n(3)   0 0 n(4) ;
          0 -n(1) 0  0 -n(2) 0    0 -n(3) 0  0 -n(4) 0];
    k = k+w(i)*det(jac)*sn'*d*sn;
    end
end   
