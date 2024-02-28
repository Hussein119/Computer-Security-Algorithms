function [cipher_txt] = rail_fence_encryption_string_key(plain_txt)
    plain_txt = lower(plain_txt);
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    
    cipher_txt=' ';
    
    chars = 'a':'z';
    key = chars(randperm(26));
    
    for i = 1 : length(plain_txt)
        cipher_ind = find(chars == plain_txt(i));
        cipher_txt(i) = key(cipher_ind);
    end
    
    cipher_txt = upper(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    disp ("Key: ");
    disp (key);
    disp("Cipher Text: ",cipher_txt);
    disp(cipher_txt);
end
