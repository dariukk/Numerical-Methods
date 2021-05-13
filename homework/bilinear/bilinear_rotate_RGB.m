function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    red = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    green = img(:, :, 2);
    
    % TODO: extrace canalul albastru al imaginii
    blue = img(:, :, 3); 

     % TODO: aplica functia nn pe cele 3 canale ale imaginii
    red_ref = bilinear_rotate(red, rotation_angle);
    green_ref = bilinear_rotate(green, rotation_angle);
    blue_ref = bilinear_rotate(blue, rotation_angle);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    
    out(:,:,1) = red_ref;
    out(:,:,2) = green_ref;
    out(:,:,3) = blue_ref;
    
endfunction
