function [cipher_txt] = caesar_encryption(plain_txt)
    plain_txt = lower(plain_txt);
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    
    cipher_txt=' ';
    
    chars = 'a':'z';
    key = chars(randperm(26));
    
    for i = 1 : length(plain_txt)
        cipher_index = find(chars == plain_txt(i));
        cipher_txt(i) = key(cipher_index);
    end
    
    cipher_txt = upper(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    disp ("Key: ");
    disp (key);
    disp("Cipher Text: ",cipher_txt);
    disp(cipher_txt);
end
