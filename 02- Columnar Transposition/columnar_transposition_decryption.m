function [plain_txt] = columnar_transposition_decryption(cipher_txt, key)
cipher_txt = upper(cipher_txt);
key = upper(key);

% Convert string to array of chars
cipher_txt = convertStringsToChars(cipher_txt);
cipher_txt = cipher_txt(cipher_txt ~= ' ');

key = convertStringsToChars(key);
key = key(key ~= ' ');

col = strlength(key);
row = ceil(strlength(cipher_txt) / col);

cipherMat = char(zeros(row, col));

% Sort key and get order of columns
[~, order] = sort(key);

% Fill the matrix with the cipher_txt
index = 1;
for i = 1 : col
    current_column = order(i);
    for j = 1 : row
        if index <= strlength(cipher_txt)
            cipherMat(j, current_column) = cipher_txt(index);
            index = index + 1;
        else
            cipherMat(j, current_column) = 'X'; % Padding
        end
    end
end

% Extracting the plain_text
plain_txt = '';
for i = 1 : row
    for j = 1 : col
        if cipherMat(i, j) ~= 'X' % Ignore padding 'X'
            plain_txt = [plain_txt, cipherMat(i, j)];
        end
    end
end

plain_txt = convertCharsToStrings(plain_txt);
end
