% Factorizarea Cholesky
% L = matrice inferior triunghiulara

function [L] = cholesky(A)
  [n n] = size(A);
  L = zeros(n);
  
  for i = 1:n
    
    for j = 1:i-1
      s = L(i,1:j-1)*L(j,1:j-1)';
      L(i,j) = (A(i,j)-s)/L(j,j);
    endfor
      
    L(i,i) = sqrt(A(i,i) - sum(L(i,1:i-1).^2));  
  endfor
endfunction
