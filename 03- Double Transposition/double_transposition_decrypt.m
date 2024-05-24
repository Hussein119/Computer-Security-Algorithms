function Plain_txt = double_transposition_decrypt(Cipher_txt, Row_Per, Col_Per)
% Convert cipher text to lowercase and remove spaces
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');

% Initialize plain text
Plain_txt = Cipher_txt;

% Determine the number of rows and columns for permutation
row = length(Row_Per);
col = length(Col_Per);

% Initialize a counter for iterating through the cipher text
C = 1;

% Construct a matrix based on the cipher text
for I = 1:row
    for J = 1:col
        % Fill the matrix with characters from the cipher text
        if C <= length(Cipher_txt)
            Cipher_Mat(I, J) = Cipher_txt(C);
        else
            % If the cipher text length is exceeded, pad with 'x'
            Cipher_Mat(I, J) = 'x';
        end
        C = C + 1;
    end
end

% Permute columns of the matrix based on Col_Per
for I = 1:col
    Permuted_Mat1(:, Col_Per(I)) = Cipher_Mat(:, I);
end

% Permute rows of the matrix based on Row_Per
for I = 1:row
    Permuted_Mat2(Row_Per(I), :) = Permuted_Mat1(I, :);
end

% Transpose the resulting matrix
Permuted_Mat2 = Permuted_Mat2';

% Construct the plain text by reading characters row by row
for I = 1:row * col
    Plain_txt(I) = Permuted_Mat2(I);
end

fprintf('plaintext: %s\n', Plain_txt);
end
