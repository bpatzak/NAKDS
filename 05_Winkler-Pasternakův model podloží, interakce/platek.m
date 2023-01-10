function [k] = platek (E,v,h,C1,C2,xe,ye)
  % secte dilci prispevky do matice tuhosti prvku
  kmm = platekmm (E,v,h, xe, ye);
  kms = platekms (E,v,h, xe, ye);
  kss = platekss (E,v,h, xe, ye);
  kp = platepodlozi (C1, C2, xe, ye);
  k = kmm+kss+kms+kms'+kp;
  %k = kms;
  %k = kp;
end


