function [cipher_txt] = main(plain_txt, key)
plain_txt = upper(plain_txt);
key = upper(key);

plain_txt = convertStringsToChars(plain_txt);
plain_txt = plain_txt(plain_txt ~= ' ');
key = convertStringsToChars(key);
key = plain_txt(key ~= ' ');

col = length(key);
row = ceil(length(plain_txt) / col);

cipherMat = char (zeros(row,col));

% Fill with 'X' the unneeded places
num_spaces_to_add = (row * col) - length(plain_txt);



end
