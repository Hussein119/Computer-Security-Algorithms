function [plain_txt] = caesar_decryption(cipher_txt, key)
    cipher_txt = lower(cipher_txt);
    cipher_txt = convertStringsToChars(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    
    plain_txt = blanks(length(cipher_txt));
    
    chars = 'a':'z';
    
    for i = 1 : length(cipher_txt)
        if ismember(cipher_txt(i), chars)
            plain_index = find(key == cipher_txt(i));
            plain_txt(i) = chars(plain_index);
        else
            plain_txt(i) = cipher_txt(i);
        end
    end
    
    plain_txt = upper(plain_txt);
    
    disp(plain_txt);
end
