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
    
    [~, order] = sort(key);
    
    % fill the matrix with the cipher_txt
    index = 1;
    for i = 1 : col
        current_column = order(i);
        for j = 1 : row 
            cipherMat(j,current_column) = cipher_txt(index);
            index = index + 1;
        end
    end
    
    % extracting the plain_text
     for i = 1 : row 
        for j = 1 : col
            plain_txt(index) = cipherMat(i,j);
            index = index + 1;
        end
     end
     
    plain_txt = plain_txt(plain_txt ~= ' ');
    disp(plain_txt);
end
