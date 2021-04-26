% Factorizarea QR cu ajutorul matricilor de rotatie Givens

function [Q R] = givens(A)
	[m n] = size(A);
	G = eye(m);
	
	for k = 1 : n-1
		for l = k + 1 : m
			r = sqrt(A(k,k)^2 + A(l,k)^2);
			cos = A(k,k)/r;
			sin = -A(l,k)/r;

			t = cos*A(k,k:n) - sin*A(l,k:n);
			A(l,k:n) = sin*A(k,k:n) + cos*A(l,k:n);
			A(k,k:n) = t;

			t = cos*G(k,1:m) - sin*G(l,1:m);
			G(l,1:m) = sin*G(k, 1:m) + cos*G(l,1:m);
			G(k,1:m) = t;
      
		end
	end
    
	Q = G';
	R = A;
end
