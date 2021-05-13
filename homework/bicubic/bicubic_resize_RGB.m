function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    red = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    green = img(:, :, 2);

    % TODO: extrace canalul albastru al imaginii
    blue = img(:, :, 3); 

    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    red_ref = bicubic_resize(red, p, q);
    green_ref = bicubic_resize(green, p, q);
    blue_ref = bicubic_resize(blue, p, q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    
    out(:,:,1) = red_ref;
    out(:,:,2) = green_ref;
    out(:,:,3) = blue_ref;

endfunction