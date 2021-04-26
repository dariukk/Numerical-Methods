% Metoda Crout adaptata pentru matrice simetrica tridiagonala
% forma economica pentru matricele A L U

function [u v] = CroutSDG_economic(b, a)
  [m n] = size(b);
  
  v = zeros(1,n);
  u = zeros(1,n-1);
  
  v(1) = b(1);
  u(1) = a(1)/v(1);
  
  for i=2:n
    v(i) = b(i) - a(i-1)*u(i-1);
    if i!=n
      u(i) = a(i)/v(i);
    endif
  endfor

endfunction