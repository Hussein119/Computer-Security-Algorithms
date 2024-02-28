function [plain_txt] = simple_decryption(cipher_txt, key)
    cipher_txt = upper(cipher_txt);
    cipher_txt = convertStringsToChars(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    len_cipher = length(cipher_txt);

    alphabet = 'A':'Z';
    
    % create the plain_txt
    plain_txt = '';
    for i = 1 : len_cipher
        letter_index = strfind(key, cipher_txt(i));
        plain_txt = [plain_txt, alphabet(letter_index)];
    end
    
    disp(plain_txt);
end
