function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red = img(:,:,1);

    % TODO: extrage canalul verde al imaginii
    green = img(:,:,2);
    
    % TODO: extrace canalul albastru al imaginii
    blue = img(:,:,3);
    
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    red_resize = nn_resize(red, p, q);
    blue_resize = nn_resize(blue, p, q);
    green_resize = nn_resize(green, p, q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out(:,:,1) = red_resize;
    out(:,:,2) = green_resize;
    out(:,:,3) = blue_resize;

endfunction
