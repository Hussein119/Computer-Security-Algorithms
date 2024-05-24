% Define the plaintext and key
plaintext = 'potatoes are in the nightshade family as well';
key = '425163';

disp('Original Plaintext:');
disp(plaintext);

% Encrypt the plaintext
cipherText = columnar_transposition_encryption(plaintext, key);

disp('Encrypted Text:');
disp(cipherText);

% Decrypt the ciphertext
decryptedText = columnar_transposition_decryption(cipherText, key);

disp('Decrypted Text:');
disp(decryptedText);

% The Output:
% Original Plaintext:
% potatoes are in the nightshade family as well
% Encrypted Text:
% ARESASXOSTHEYLOIIAIEXPENGDLLTAHTFAXTENHMWX
% Decrypted Text:
% POTATOESAREINTHENIGHTSHADEFAMILYASWELL