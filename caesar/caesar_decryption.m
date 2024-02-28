function [plain_txt] = caesar_decryption(cipher_txt, key)
    cipher_txt = lower(cipher_txt);
    cipher_txt = convertStringsToChars(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    
    plain_txt = '';
    
    for i = 1 : length(cipher_txt)
        plain_txt = [plain_txt, char(mod(double(cipher_txt(i)) - key - 97, 26) + 97)];
    end
    
    plain_txt = upper(plain_txt);
    disp(plain_txt);
end