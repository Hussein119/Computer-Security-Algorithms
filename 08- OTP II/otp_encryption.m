function [ciphertext] = otp_encryption(plaintext, key)
% Define the set of characters
chars = 'a':'z';

% Initialize ciphertext
ciphertext = '';

% Check if the length of plaintext and key are the same
if(length(plaintext) == length(key))
    % Iterate through each character of the plaintext
    for i = 1:length(plaintext)
        % Find the index of the current character in the character set
        plainind = find(chars == plaintext(i));
        keyind = find(chars == key(i));
        
        % Calculate the index of the ciphertext character
        cipherind = plainind + keyind;
        
        % Ensure the index stays within the range of the character set
        cipherind = mod(cipherind - 1, 26) + 1;
        
        % Append the ciphertext character to the result
        ciphertext = [ciphertext, chars(cipherind)];
    end
    fprintf('ciphertext: %s\n', ciphertext);
else
    % Display an error message if lengths don't match
    disp('Lengths of plaintext and key must be the same.');
end
end

