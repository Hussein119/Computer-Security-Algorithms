function [cipher_txt] = caesar_encryption(plain_txt, key)
    plain_txt = lower(plain_txt);
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    
    cipher_txt = '';
    
    for i = 1 : length(plain_txt)
        cipher_txt = [cipher_txt, char(mod(double(plain_txt(i)) + key - 97, 26) + 97)];
    end
    
    cipher_txt = upper(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    disp(cipher_txt);
end
