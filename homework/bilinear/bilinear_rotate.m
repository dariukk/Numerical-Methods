
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicand interpolare biliniara.
    % rotation_angle este exprimat in radiani.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % TODO: calculeaza cos si sin de rotation_angle
    sinus = sin(rotation_angle);
    cosinus = cos(rotation_angle);

    % TODO: initializeaza matricea finala
    R = zeros(m,n);
        
    % TODO: calculeaza matricea de transformare
    T = [cosinus -sinus; sinus cosinus];
    
    % TODO: calculeaza inversa transformarii
    inv_T = inv(T);
    
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            b = inv_T * [x; y];
            x_p = b(1);
            y_p = b(2);

            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;

            % TODO: daca xp sau yp se afla in afara imaginii, pune un pixel
            % negru in imagine si treci mai departe
            if x_p > n || y_p > m || x_p < 1 || y_p < 1
              R(y+1, x+1) = 0;
              continue;
            endif
            
            % TODO: afla punctele ce inconjoara punctul (xp, yp)
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = ceil(x_p);
            y2 = ceil(y_p);
            
            if x1 == x2 && y1 == y2
              R(y+1, x+1) = I(y_p, x_p);
              continue;
            endif
            
            if x1 == x2
              R(y+1, x+1) = (y2 - y_p) / (y2 - y1) * I(y1, x1) + (y_p - y1) / (y2 - y1) * I(y2, x1);
              continue;
            endif
            
            if y1 == y2
              R(y+1, x+1) = (x2 - x_p) / (x2 - x1) * I(y1, x1) + (x_p - x1) / (x2 - x1) * I(y1, x2);
              continue;
            endif
            
            
            % TODO: calculeaza coeficientii de interpolare a
            a = bilinear_coef(I, x1, y1, x2, y2);

            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            R(y+1, x+1) = a(1) + a(3) * y_p + a(2) * x_p + a(4) * x_p * y_p;
        
        endfor
    endfor

   R = uint8(R);
    
endfunction
