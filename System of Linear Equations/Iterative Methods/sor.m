function [x iter] = sor(A, b, x0, w, tol, maxiter)
	% Rezolvarea sistemului Ax=b folosind metoda suprarelaxarii
	% Input:
	%   A - matricea sistemului
	%   x - aproximarea intiala a solutiei
	%   b - vectorul termenilor liberi
	%   w - parametru cu valori in (0,2)
	%		tol - precizia determinarii solutiei
	%   maxiter - numarul maxim de iteratii
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge
 
  [n n] = size(A);
	x=zeros(n,1);
 
  for iter=1:maxiter
    for i = 1 : n
 		  suma=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x0(i+1:n);
		  x(i)=(b(i)-suma)/A(i,i);
      x(i)=w*x(i)+(1-w)*x0(i);
    endfor
    
		if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction