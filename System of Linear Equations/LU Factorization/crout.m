% Factorizarea Crout
% L matrice inferior triunghiulara
% U matrice superior triunghiulara

function [L U] = crout(A)
  
  [n n] = size(A);
  L = zeros(n);
  U = eye(n);
  L(1:n, 1) = A(1:n, 1);
  
  for p = 1:n
    for i = p:n
      s = L(i, 1:p-1)*U(1:p-1, p);
      L(i, p) = A(i, p) - s;
    endfor
    
    for j = p+1:n
      s = L(p, 1:p-1)*U(1:p-1, j);
      U(p, j) = (A(p, j) - s)/L(p, p);
    endfor
  endfor
endfunction
