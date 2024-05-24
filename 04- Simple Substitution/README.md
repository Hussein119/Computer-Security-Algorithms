## simple_encryption

The function is designed to take a plain text string, perform a substitution cipher encryption on it, and then return the cipher text along with the key used for encryption.

Here’s the code with explanations for each part:

```matlab
function [cipher_txt, key] = simple_encryption(plain_txt)
```

- This defines a function named `simple_encryption` that takes one input `plain_txt` (the plain text to be encrypted) and returns two outputs: `cipher_txt` (the resulting cipher text) and `key` (the substitution key used for encryption).

```matlab
cipher_txt = '';
plain_txt = upper(plain_txt);
```

- `cipher_txt = '';` initializes an empty string to store the cipher text.
- `plain_txt = upper(plain_txt);` converts the input plain text to uppercase.

```matlab
plain_txt = convertStringsToChars(plain_txt);
plain_txt = plain_txt(plain_txt ~= ' ');
```

- `plain_txt = convertStringsToChars(plain_txt);` converts the string array to a character array.
- `plain_txt = plain_txt(plain_txt ~= ' ');` removes any spaces from the plain text.

```matlab
len_plain = length(plain_txt);
```

- `len_plain = length(plain_txt);` calculates the length of the cleaned plain text (i.e., without spaces).

```matlab
alphabet = 'A':'Z';
key = alphabet(randperm(26));
```

- `alphabet = 'A':'Z';` creates a string containing all uppercase letters of the alphabet.
- `key = alphabet(randperm(26));` generates a random permutation of the alphabet, which will serve as the substitution key.

```matlab
for i = 1: len_plain
    letter_index = find(alphabet == plain_txt(i));
    cipher_txt = [cipher_txt, key(letter_index)];
end
```

- `for i = 1: len_plain` starts a loop that iterates over each character of the plain text.
- `letter_index = find(alphabet == plain_txt(i));` finds the index of the current plain text character in the alphabet.
- `cipher_txt = [cipher_txt, key(letter_index)];` appends the character from the key corresponding to `letter_index` to the `cipher_txt`.

```matlab
disp(cipher_txt);
disp(key);
```

- `disp(cipher_txt);` displays the cipher text.
- `disp(key);` displays the key used for the substitution.

```matlab
end
```

- `end` marks the end of the function.

### Summary

This function performs a simple substitution cipher encryption on the given plain text. It:

1. Converts the plain text to uppercase and removes spaces.
2. Generates a random permutation of the alphabet as the key.
3. Replaces each character in the plain text with the corresponding character in the key based on its position in the alphabet.
4. Returns and displays the encrypted text (cipher text) and the key used.

The resulting `cipher_txt` will be the encrypted message, and `key` will be the randomly generated substitution alphabet.

## simple_decryption

Sure! Let's break down this MATLAB function step by step. The function `simple_decryption` takes a cipher text and a key, and returns the decrypted plain text.

Here's the code with detailed explanations for each part:

```matlab
function [plain_txt] = simple_decryption(cipher_txt, key)
```

- This defines a function named `simple_decryption` that takes two inputs: `cipher_txt` (the encrypted text) and `key` (the substitution key used for encryption). It returns one output: `plain_txt` (the decrypted plain text).

```matlab
cipher_txt = upper(cipher_txt);
```

- `cipher_txt = upper(cipher_txt);` converts the input cipher text to uppercase to ensure uniformity.

```matlab
cipher_txt = convertStringsToChars(cipher_txt);
cipher_txt = cipher_txt(cipher_txt ~= ' ');
```

- `cipher_txt = convertStringsToChars(cipher_txt);` converts the string array to a character array.
- `cipher_txt = cipher_txt(cipher_txt ~= ' ');` removes any spaces from the cipher text.

```matlab
len_cipher = length(cipher_txt);
```

- `len_cipher = length(cipher_txt);` calculates the length of the cleaned cipher text (i.e., without spaces).

```matlab
alphabet = 'A':'Z';
```

- `alphabet = 'A':'Z';` creates a string containing all uppercase letters of the alphabet.

```matlab
% create the plain_txt
plain_txt = '';
```

- `plain_txt = '';` initializes an empty string to store the decrypted plain text.

```matlab
for i = 1 : len_cipher
    letter_index = strfind(key, cipher_txt(i));
    plain_txt = [plain_txt, alphabet(letter_index)];
end
```

- `for i = 1 : len_cipher` starts a loop that iterates over each character of the cipher text.
- `letter_index = strfind(key, cipher_txt(i));` finds the index of the current cipher text character in the key.
- `plain_txt = [plain_txt, alphabet(letter_index)];` appends the character from the alphabet corresponding to `letter_index` to the `plain_txt`.

```matlab
disp(plain_txt);
```

- `disp(plain_txt);` displays the decrypted plain text.

```matlab
end
```

- `end` marks the end of the function.

### Summary

This function performs decryption of a substitution cipher. It:

1. Converts the cipher text to uppercase and removes spaces.
2. Iterates over each character of the cipher text.
3. For each character in the cipher text, finds its corresponding index in the key.
4. Maps this index back to the original alphabet to get the decrypted character.
5. Appends each decrypted character to form the plain text.
6. Returns and displays the decrypted plain text.

The resulting `plain_txt` will be the original message before encryption. The decryption process reverses the encryption by using the same key to map each cipher text character back to its original form in the alphabet.
