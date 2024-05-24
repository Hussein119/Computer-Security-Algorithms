## rail_fence_encryption

The function `rail_fence_encryption` implements the Rail Fence Cipher encryption, which arranges the plain text in a zigzag pattern across multiple "rails" and then reads off each rail to form the cipher text.

Here is the code with detailed explanations:

```matlab
function [cipher_txt] = rail_fence_encryption(plain_txt, key)
```

- This defines a function named `rail_fence_encryption` that takes two inputs: `plain_txt` (the plain text to be encrypted) and `key` (the number of rails). It returns one output: `cipher_txt` (the resulting cipher text).

```matlab
plain_txt = upper(plain_txt);
```

- `plain_txt = upper(plain_txt);` converts the input plain text to uppercase to ensure uniformity.

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
rail_fence = char(zeros(key, len_plain));
```

- `rail_fence = char(zeros(key, len_plain));` initializes a 2D character array (matrix) filled with zeros. This array represents the rails of the cipher, with `key` rows and `len_plain` columns.

```matlab
downward = true;
row = 1;
```

- `downward = true;` initializes a boolean variable to track the direction of the zigzag pattern (downwards initially).
- `row = 1;` initializes the current row to the first rail.

```matlab
for i = 1 : len_plain
    rail_fence(row, i) = plain_txt(i);

    % Condition for changing the direction of the rail
    if row == 1
        downward = true; % Change direction to downward if at the top rail
    elseif row == key
        downward = false; % Change direction to upward if at the bottom rail
    end

    % Move the rail up or down based on the direction
    if downward
        row = row + 1;
    else
        row = row - 1;
    end
end
```

- This loop iterates over each character in the plain text.
- `rail_fence(row, i) = plain_txt(i);` places the current character in the appropriate position in the `rail_fence` matrix.
- The `if` statements check if the current row is the first or last rail, changing the direction of the zigzag pattern accordingly.
- Based on the direction (`downward`), the `row` variable is adjusted to move either up or down the rails.

```matlab
cipher_txt = '';
for row = 1 : key
    cipher_txt = [cipher_txt, rail_fence(row, rail_fence(row,:) ~= 0)];
end
```

- `cipher_txt = '';` initializes an empty string to store the cipher text.
- This loop concatenates all the characters from each rail (non-zero entries) into the `cipher_txt`.

```matlab
cipher_txt = cipher_txt(cipher_txt ~= ' ');
disp(cipher_txt);
```

- `cipher_txt = cipher_txt(cipher_txt ~= ' ');` removes any remaining spaces from the `cipher_txt` (although this should not be necessary as spaces were removed initially).
- `disp(cipher_txt);` displays the final cipher text.

```matlab
end
```

- `end` marks the end of the function.

### Summary

This function performs encryption using the Rail Fence Cipher. It:

1. Converts the plain text to uppercase and removes spaces.
2. Initializes a 2D matrix to represent the rails.
3. Places each character of the plain text into the matrix in a zigzag pattern based on the number of rails.
4. Reads off each rail sequentially to form the cipher text.
5. Returns and displays the cipher text.

The `cipher_txt` will be the encrypted message formed by reading the characters from the zigzag pattern rail-by-rail.

## This function implements the decryption process for the Rail Fence cipher, a form of transposition cipher where the plaintext is written in a zigzag pattern along multiple "rails." Let's break down the code step by step to understand its functionality:

### Input Handling

```matlab
cipher_txt = upper(cipher_txt);
cipher_txt = convertStringsToChars(cipher_txt);
cipher_txt = cipher_txt(cipher_txt ~= ' ');
len_cipher = length(cipher_txt);
```

1. `cipher_txt = upper(cipher_txt);`: Converts the cipher text to uppercase to maintain uniformity.
2. `convertStringsToChars(cipher_txt);`: Converts the string to a character array.
3. `cipher_txt = cipher_txt(cipher_txt ~= ' ');`: Removes any spaces from the cipher text.
4. `len_cipher = length(cipher_txt);`: Determines the length of the cipher text.

### Creating the Rail Fence Pattern

```matlab
rail_fence = char(zeros(key, len_cipher));
downward = true;
row = 1;
for i = 1 : len_cipher
    rail_fence(row, i) = '*';
    if row == 1
        downward = true;
    elseif row == key
        downward = false;
    end

    if downward
        row = row + 1;
    else
        row = row - 1;
    end
end
```

1. `rail_fence = char(zeros(key, len_cipher));`: Initializes a 2D character array (matrix) with zeros, which will hold the zigzag pattern.
2. The loop marks positions in the `rail_fence` matrix where characters from the cipher text will be placed.
3. `downward` keeps track of the direction of movement through the rows.
4. `row` keeps track of the current row being processed.
5. The pattern alternates between moving downwards and upwards in the matrix, filling positions with `'*'`.

### Filling the Rail Fence Matrix

```matlab
index = 1;
for i = 1 : key
    for j = 1 : len_cipher
        if rail_fence(i, j) == '*' && index <= len_cipher
            rail_fence(i, j) = cipher_txt(index);
            index = index + 1;
        end
    end
end
```

1. `index` tracks the position in the cipher text.
2. This nested loop fills the `rail_fence` matrix by placing characters from `cipher_txt` into positions marked by `'*'`.

### Reading the Rail Fence Matrix to Get the Plain Text

```matlab
plain_txt = '';
row = 1;
col = 1;
downward = true;
for i = 1 : len_cipher

    if rail_fence(row, col) ~= '*'
        plain_txt = [plain_txt, rail_fence(row, col)];
        col = col + 1;
    end

    if row == 1
        downward = true;
    elseif row == key
        downward = false;
    end

    if downward
        row = row + 1;
    else
        row = row - 1;
    end
end
```

1. `plain_txt` initializes as an empty string to hold the decrypted text.
2. The loop reads the `rail_fence` matrix in a zigzag manner, constructing the plain text.
3. The direction and row tracking logic are similar to the pattern creation step, ensuring the characters are read in the correct order.

Finally, `disp(plain_txt);` displays the decrypted plain text.

### Summary

- **Pattern Creation**: Marks the zigzag pattern in a matrix.
- **Filling the Matrix**: Places the cipher text characters into the matrix based on the pattern.
- **Reading the Matrix**: Constructs the plain text by reading characters from the matrix in the zigzag order.

This method effectively reverses the encryption process of the Rail Fence cipher to retrieve the original plaintext.
