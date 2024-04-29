function [plaintext] = otp_decryption(ciphertext, key)
% Define the set of characters
chars = 'a':'z';

% Convert ciphertext to lowercase and remove spaces
ciphertext = lower(ciphertext);
ciphertext = ciphertext(ciphertext ~= ' ');

% Initialize plaintext
plaintext = '';

% Iterate through each character of the ciphertext
for i = 1:length(ciphertext)
    % Find the index of the current character in the character set
    cipherind = find(chars == ciphertext(i));
    keyind = find(chars == key(i));
    
    % Calculate the index of the plaintext character
    plainind = cipherind - keyind;
    
    % Ensure the index stays within the range of the character set
    plainind = mod(plainind - 1, 26) + 1;
    
    % Append the plaintext character to the result
    plaintext = [plaintext, chars(plainind)];
end

% Display the decrypted plaintext
fprintf('plaintext: %s\n', plaintext);
end
