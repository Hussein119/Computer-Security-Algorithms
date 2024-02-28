function [plain_txt] = row_col_decryption(cipher_txt, key)
    cipher_txt = upper(cipher_txt);
    key = upper(key);
    
    % convert string to array of chars
    cipher_txt = convertStringsToChars(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    
    key = convertStringsToChars(key);
    key = key(key ~= ' ');
    
    col = strlength(key);
    row = ceil(strlength(cipher_txt) / col);
    
    cipherMat = char(zeros(row, col));
    
    % fill the matrix with the cipher_txt
    index = 1;
    for i = 1 : col
        for j = 1 : row
            cipherMat(j, i) = cipher_txt(index);
            index = index + 1;
        end
    end
    
     % Create a mapping between characters in the key and their corresponding column indices
    [~, idx] = ismember(unique(key), key);
    
    % Rearrange the columns of cipherMat based on the mapping
    cipherMat = cipherMat(:, idx);
    
    % Concatenate the columns to form the decrypted plaintext
    plain_txt = reshape(cipherMat', 1, []);
     
    plain_txt = plain_txt(plain_txt ~= ' ');
    disp(plain_txt);
end
