function [cipher_txt] = columnar_transposition_encryption(plain_txt, key)
plain_txt = upper(plain_txt);
key = upper(key);

% Convert string to array of chars
plain_txt = convertStringsToChars(plain_txt);
plain_txt = plain_txt(plain_txt ~= ' ');

key = convertStringsToChars(key);
key = key(key ~= ' ');

col = strlength(key);
row = ceil(strlength(plain_txt) / col);

cipherMat = char(zeros(row, col));

% Fill with 'X' the unneeded places
num_spaces_to_add = (row * col) - strlength(plain_txt);
for i = 1 : num_spaces_to_add
    plain_txt = strcat(plain_txt, 'X');
end

% Fill the matrix with the plain_txt
index = 1;
for i = 1 : row
    for j = 1 : col
        cipherMat(i, j) = plain_txt(index);
        index = index + 1;
    end
end

% Sort key and get order of columns
[~, order] = sort(key);

cipher_txt = '';
% Extracting the cipher_txt
for i = 1 : col
    current_column = order(i);
    for j = 1 : row
        cipher_txt = [cipher_txt, cipherMat(j, current_column)];
    end
end

cipher_txt = convertCharsToStrings(cipher_txt);
end
