% Metoda SOR pentru matrice tridiagonala

function [x iter] = sor_tridiag(A, B, C, b, x0, tol, w, maxiter)
	% Rezolvarea sistemului Ax=b folosind metoda SOR
	% Intrari:
  %   A - elementele de pe diagonala de deasupra B
	%		B - elementele de pe diagonala principala
  %   C - elementele de pe diagonala de dedesubtul B
	%		b - vectorul termenilor liberi
	%		x0 - aproximatia intiala a solutiei
	%		tol - precizia determinarii solutiei
	%		maxiter - numarul maxim de iteratii permis
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge

	[m n] = size(B);
	x=zeros(n,1);
  
  for iter=1:maxiter
    x(1) = (b(1) - A(1)*x0(2,1)) / B(1);
    x(1) = w*x(1) + (1-w)*x0(1);
    
    for i = 2 : n-1
      suma = C(i-1) * x(i-1,1) + A(i)*x0(i+1,1);
			x(i) = (b(i) - suma) / B(i);
      x(i) = w*x(i) + (1-w)*x0(i);
		endfor
    
    x(n) = (b(n) - C(n-1)*x(n-1,1)) /B(n);
		x(n) = w*x(n) + (1-w)*x0(n);
    
		if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction
