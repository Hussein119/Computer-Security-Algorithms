function plaintext = rc4_decrypt(ciphertext, key)
% Accept numeric and string values

% Initialize S array with the given key
S = initialize_S(key);

% Convert ciphertext from binary string to uint8 array
ciphertext_binary = reshape(ciphertext, 8, []).';
ciphertext_uint8 = uint8(bin2dec(ciphertext_binary));

% Perform RC4 decryption
plaintext_uint8 = zeros(size(ciphertext_uint8), 'uint8');
i = 0;
j = 0;
for k = 1:length(ciphertext_uint8)
    i = mod(i + 1, 256);
    j = mod(j + S(i+1), 256);
    S = swap(S, i+1, j+1);
    K = S(mod(S(i+1) + S(j+1), 256) + 1);
    plaintext_uint8(k) = bitxor(ciphertext_uint8(k), K);
end

% Convert uint8 plaintext to character string
plaintext = char(plaintext_uint8);
% Display plaintext
fprintf('plaintext: %s\n', plaintext);
end
