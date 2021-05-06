function x = SST(A,b)
  [n n] = size(A);
  x = zeros(n,1);

  for i = (n:-1:1)
    x(i) = (b(i) - A(i,:)*x) / A(i,i);
  endfor
endfunction