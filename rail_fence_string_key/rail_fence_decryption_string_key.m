function [plain_txt] = rail_fence_decryption_string_key(cipher_txt, key)
    cipher_txt = lower(cipher_txt);
    cipher_txt = convertStringsToChars(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    
    plain_txt = ''; % Initialize plain_txt
    
    chars = 'a':'z';
    
    for i = 1 : length(cipher_txt)
        key_char = key(i); % Get character from key
        key_ind = find(chars == key_char); % Find index of key character in alphabet
        plain_char = cipher_txt(i); % Get corresponding character from ciphertext
        plain_ind = find(key == plain_char); % Find index of ciphertext character in key
        plain_txt = [plain_txt chars(plain_ind)]; % Append decrypted character
    end
    
    plain_txt = upper(plain_txt)
    
    disp(plain_txt);
end
