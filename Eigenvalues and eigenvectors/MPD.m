% Metoda puterii directe
% pentru determinarea valorii proprii dominante
% si a vectorului propriu asociat
% l = lambda (valoarea proprie dominanta)
% x = vectorul propriu asociat
% ok = 1 daca s-a putut determina cu precizia tol in numarul de operatii maxiter
% y = aproximatia initiala
% maxiter = numarul maxim de iteratii
% tol = toleranta


function [l y ok] = MPD(A, y, maxiter, tol)
  k = 0;
  l = 0;
  
  while(k<=maxiter&&norm(A*y-l*y)>tol)
      k = k+1;
      z = A*y;
      y = z/norm(z);
      l = y'*A*y;
  endwhile
  
  ok = (norm(A*y-l*y)<=tol);
  
endfunction 
