## The `row_col_encryption` function is designed to encrypt a plaintext message using a columnar transposition cipher based on a given key. Let's break down the function step by step:

### Function Breakdown

1. **Convert Inputs to Uppercase**:

   ```matlab
   plain_txt = upper(plain_txt);
   key = upper(key);
   ```

   - Both the `plain_txt` (plaintext) and `key` are converted to uppercase to standardize the inputs and make the encryption case-insensitive.

2. **Remove Spaces**:

   ```matlab
   plain_txt = convertStringsToChars(plain_txt);
   plain_txt = plain_txt(plain_txt ~= ' ');
   key = convertStringsToChars(key);
   key = key(key ~= ' ');
   ```

   - Spaces are removed from both the plaintext and the key. This ensures that the spaces do not interfere with the encryption process.

3. **Determine Matrix Dimensions**:

   ```matlab
   col = strlength(key);
   row = ceil(strlength(plain_txt) / col);
   ```

   - The number of columns (`col`) is determined by the length of the key.
   - The number of rows (`row`) is calculated based on the length of the plaintext and the number of columns. The `ceil` function ensures that if the plaintext length is not perfectly divisible by the number of columns, an extra row is added.

4. **Initialize the Matrix**:

   ```matlab
   cipherMat = char(zeros(row, col));
   ```

   - A matrix (`cipherMat`) of characters is initialized with zeros, with dimensions `row` x `col`.

5. **Pad Plaintext with 'X'**:

   ```matlab
   num_spaces_to_add = (row * col) - strlength(plain_txt);
   for i = 1 : num_spaces_to_add
       plain_txt = strcat(plain_txt, 'X');
   end
   ```

   - The plaintext is padded with 'X' characters to fill the matrix completely. This ensures every cell in the matrix is occupied.

6. **Fill the Matrix with Plaintext**:

   ```matlab
   index = 1;
   for i = 1 : row
       for j = 1 : col
           cipherMat(i, j) = plain_txt(index);
           index = index + 1;
       end
   end
   ```

   - The plaintext is filled into the matrix row by row.

7. **Sort Key and Determine Column Order**:

   ```matlab
   [~, order] = sort(key);
   ```

   - The key is sorted alphabetically, and the order of columns is determined by the sorted key. The `order` array contains the indices of the columns in the order they should be read.

8. **Extract Ciphertext Column-wise**:

   ```matlab
   cipher_txt = '';
   for i = 1 : col
       current_column = order(i);
       for j = 1 : row
           cipher_txt = [cipher_txt, cipherMat(j, current_column)];
       end
   end
   ```

   - The ciphertext is extracted by reading the matrix column by column according to the order determined by the sorted key. The characters are concatenated to form the final encrypted message.

9. **Convert to String**:
   ```matlab
   cipher_txt = convertCharsToStrings(cipher_txt);
   ```
   - The final ciphertext is converted back to a string type if necessary.

### Summary

- **Input Handling**: The plaintext and key are standardized by converting them to uppercase and removing spaces.
- **Matrix Formation**: A character matrix is formed based on the length of the plaintext and key. The plaintext is filled into the matrix row by row.
- **Padding**: If the plaintext does not perfectly fill the matrix, 'X' characters are added.
- **Columnar Reading**: The key determines the order in which columns are read to form the ciphertext.

This function ensures that the plaintext is encrypted in a structured manner using the columnar transposition method, making the resulting ciphertext dependent on the key provided.

## The `row_col_decryption` function decrypts a ciphertext that has been encrypted using a columnar transposition cipher with a given key. Let's dissect the function step by step:

### Function Breakdown

1. **Convert Inputs to Uppercase**:

   ```matlab
   cipher_txt = upper(cipher_txt);
   key = upper(key);
   ```

   - Both the `cipher_txt` (ciphertext) and `key` are converted to uppercase to standardize the inputs and make the decryption case-insensitive.

2. **Remove Spaces**:

   ```matlab
   cipher_txt = convertStringsToChars(cipher_txt);
   cipher_txt = cipher_txt(cipher_txt ~= ' ');

   key = convertStringsToChars(key);
   key = key(key ~= ' ');
   ```

   - Spaces are removed from both the ciphertext and the key. This ensures that the spaces do not interfere with the decryption process.

3. **Determine Matrix Dimensions**:

   ```matlab
   col = strlength(key);
   row = ceil(strlength(cipher_txt) / col);
   ```

   - The number of columns (`col`) is determined by the length of the key.
   - The number of rows (`row`) is calculated based on the length of the ciphertext and the number of columns. The `ceil` function ensures that if the ciphertext length is not perfectly divisible by the number of columns, an extra row is added.

4. **Initialize the Matrix**:

   ```matlab
   cipherMat = char(zeros(row, col));
   ```

   - A matrix (`cipherMat`) of characters is initialized with zeros, with dimensions `row` x `col`.

5. **Sort Key and Determine Column Order**:

   ```matlab
   [~, order] = sort(key);
   ```

   - The key is sorted alphabetically, and the order of columns is determined by the sorted key. The `order` array contains the indices of the columns in the order they should be read during decryption.

6. **Fill the Matrix with Ciphertext**:

   ```matlab
   index = 1;
   for i = 1 : col
       current_column = order(i);
       for j = 1 : row
           if index <= strlength(cipher_txt)
               cipherMat(j, current_column) = cipher_txt(index);
               index = index + 1;
           else
               cipherMat(j, current_column) = 'X'; % Padding
           end
       end
   end
   ```

   - The ciphertext is filled into the matrix column by column based on the order determined by the sorted key. If the ciphertext does not perfectly fill the matrix, 'X' characters are added as padding.

7. **Extract Plaintext from Matrix**:

   ```matlab
   plain_txt = '';
   for i = 1 : row
       for j = 1 : col
           if cipherMat(i, j) ~= 'X' % Ignore padding 'X'
               plain_txt = [plain_txt, cipherMat(i, j)];
           end
       end
   end
   ```

   - The plaintext is extracted by reading the matrix row by row. Characters are concatenated to form the final decrypted message, while ignoring the padding 'X' characters.

8. **Convert to String**:
   ```matlab
   plain_txt = convertCharsToStrings(plain_txt);
   ```
   - The final plaintext is converted back to a string type if necessary.

### Summary

- **Input Handling**: The ciphertext and key are standardized by converting them to uppercase and removing spaces.
- **Matrix Filling**: The ciphertext is filled into a matrix column by column based on the sorted order determined by the key.
- **Padding Handling**: 'X' characters are used for padding, and they are ignored during plaintext extraction.
- **Columnar Reading**: The key determines the order in which columns are read to extract the plaintext.

This function ensures that the ciphertext is decrypted correctly using the columnar transposition method, provided the correct key is used.
