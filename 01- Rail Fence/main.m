% Define your plaintext and number of rails
plainText = 'defend the east wall';
rails = 2;

% Encrypt the plaintext
cipherText = rail_fence_encryption(plainText, rails);
disp(['Encrypted Text: ', cipherText]);

% Decrypt the ciphertext
decryptedText = rail_fence_decryption(cipherText, rails);
disp(['Decrypted Text: ', decryptedText]);

% The Output:
% Encrypted Text: DFNTEATALEEDHESWL
% Decrypted Text: DEFENDTHEEASTWALL