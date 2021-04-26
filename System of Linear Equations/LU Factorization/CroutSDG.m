% Metoda Crout adaptata pentru matrice simetrica tridiagonala
function [L U] = CroutSDG(A)
  [n n] = size(A);
  L = zeros(n);
  U = zeros(n);
  
  v = A(1,1);
  u = A(2,1)/v;
  
  L(1,1) = v;
  U(1,1) = 1;
  U(1,2) = u;
  
  for i=2:n
    v = A(i,i) - A(i,i-1)*u;
    if i!=n
      u = A(i+1,i)/v;
      U(i,i+1) = u;
    endif
    
    U(i,i)=1;
    L(i,i)=v;
    L(i,i-1)=A(i,i-1);
  endfor

endfunction
