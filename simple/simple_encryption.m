function [cipher_txt, key] = simple_encryption(plain_txt)
    plain_txt = upper(plain_txt);
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    len_plain = length(plain_txt);

    alphabet = 'A':'Z';
    key = alphabet(randperm(26));
    
    % create the cipher_txt
    cipher_txt = '';
    for i = 1:len_plain
        letter_index = find(alphabet == plain_txt(i));
        cipher_txt = [cipher_txt, key(letter_index)];
    end
    
    disp(cipher_txt);
    disp(key);
end
