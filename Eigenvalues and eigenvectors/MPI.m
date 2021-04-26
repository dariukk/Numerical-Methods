% Metoda puterii inverse
% l = lambda (valoarea proprie dominanta)
% x = vectorul propriu asociat
% ok = 1 daca s-a putut determina cu precizia tol in numarul de operatii maxiter
% y = aproximatia initiala
% maxiter = numarul maxim de iteratii
% tol = toleranta

function [l y ok k] = MPI(A, y, maxiter, tol)
  k = 0;
  l = 0;
  [n n] = size(A);
  miu = y'*A*y;
  
  while(k<=maxiter && norm(A*y-l*y)>tol)
      k = k+1;
      z = (A - miu*eye(n))\y;
      y = z/norm(z);
      l = y'*A*y;
      
      % catul Rayleigh
      miu = l;
  endwhile
  
  ok = (norm(A*y-l*y)<=tol);
  
endfunction 
