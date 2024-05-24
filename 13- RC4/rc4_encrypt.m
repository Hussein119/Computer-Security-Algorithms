function ciphertext = rc4_encrypt(plaintext, key)
% Accept numeric and string values

% Convert string to ASCII values
plaintext_ascii = double(plaintext);
% Convert ASCII values to uint8
plaintext_ascii = uint8(plaintext_ascii);

S = initialize_S(key);
ciphertext = zeros(size(plaintext_ascii), 'uint8');
i = 0;
j = 0;

for k = 1:length(plaintext_ascii)
    i = mod(i + 1, 256);
    j = mod(j + S(i+1), 256);
    S = swap(S, i+1, j+1);
    K = S(mod(S(i+1) + S(j+1), 256) + 1);
    % Perform XOR operation on ASCII values
    ciphertext(k) = bitxor(plaintext_ascii(k), K);
end

% Convert each byte of the ciphertext to binary representation
binary_array = '';
for k = 1:length(ciphertext)
    binary_byte = dec2bin(ciphertext(k), 8);
    binary_array = strcat(binary_array, binary_byte);
end

% Display ciphertext
fprintf('ciphertext: %s\n', binary_array);

end