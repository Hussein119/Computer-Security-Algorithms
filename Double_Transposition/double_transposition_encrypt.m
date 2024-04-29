function Cipher_txt = double_transposition_encrypt(Plain_txt, Row_Per, Col_Per)
% Convert plain text to lowercase and remove spaces
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');

% Initialize cipher text
Cipher_txt = Plain_txt;

% Determine the number of rows and columns for permutation
row = length(Row_Per);
col = length(Col_Per);

% Initialize a counter for iterating through the plain text
C = 1;

% Construct a matrix based on the plain text
for I = 1:row
    for J = 1:col
        % Fill the matrix with characters from the plain text
        if C <= length(Plain_txt)
            Plain_Mat(I, J) = Plain_txt(C);
        else
            % If the plain text length is exceeded, pad with 'x'
            Plain_Mat(I, J) = 'x';
        end
        C = C + 1;
    end
end

% Permute rows of the matrix based on Row_Per
for I = 1:row
    Permuted_Mat1(I, :) = Plain_Mat(Row_Per(I), :);
end

% Permute columns of the matrix based on Col_Per
for I = 1:col
    Permuted_Mat2(:, I) = Permuted_Mat1(:, Col_Per(I));
end

% Transpose the resulting matrix
Permuted_Mat2 = Permuted_Mat2';

% Construct the cipher text by reading characters row by row
for I = 1:row * col
    Cipher_txt(I) = Permuted_Mat2(I);
end

% Convert cipher text to uppercase
Cipher_txt = upper(Cipher_txt);
fprintf('ciphertext: %s\n', Cipher_txt);
end
