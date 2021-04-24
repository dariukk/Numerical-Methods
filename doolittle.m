% Factorizare Doolittle

function [L U] = doolittle(A)
  [n n] = size(A);
  L = eye(n);
  U = zeros(n);
  
  for p = 1:n
    for j = p:n
      s = L(p, 1:p-1)*U(1:p-1, j);
      U(p, j) = A(p, j) - s;
    endfor
    
    for i = p+1:n
      s = L(i, 1:p-1)*U(1:p-1, p); 
      L(i, p) = (A(i, p) - s)/U(p, p);
    endfor
  endfor
endfunction
