% Metoda Doolittle adaptata pentru matrice simetrica tridiagonala
% forma economica pentru matricele A L U

function [l v] = DoolittleSDG_economic(b, a)
  [m n] = size(b);
  
  v = zeros(1,n);
  l = zeros(1,n-1);
  
  v(1) = b(1);
  l(1) = a(1)/v(1);
  
  for i=2:n
    v(i) = b(i) - a(i-1)*l(i-1);
    if i!=n
      l(i) = a(i)/v(i);
    endif
  endfor

endfunction