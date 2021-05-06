
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare biliniara
    % Transforma imaginea I alb-negru din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);

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


    % TODO: calculeaza factorii de scalare
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = q ./ (n-1);
    s_y = p ./ (m-1);

    % TODO: defineste matricea de transformare pentru redimensionare
    trans_matrix = [s_x, 0; 0 s_y];

    % TODO: calculeaza inversa transformarii
    inv_matrix = [1/s_x, 0; 0 1/s_y];

    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            b = [x, y];
            b = b * inv_matrix;

            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            b = b + [1,1];

            % TODO: afla punctele ce inconjoara punctul (xp, yp)
            x1 = floor(b(1));
            y1 = floor(b(2));
            x2 = ceil(b(1));
            y2 = ceil(b(2));
            
            if x1 == x2
              x2 =  x2 + 1;
            endif
            
            if y1 == y2
              y2 = y2 + 1;
            endif
            
            % TODO: calculeaza coeficientii de interplare a
            a = bilinear_coef(I, x1, y1, x2, y2);
            
            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
            R(y+1,x+1) = a(1) + a(3) * (y+1) + a(2) * (x+1) + a(4) * (y+1) * (x+1);
       
        endfor
    endfor

    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
    
endfunction
