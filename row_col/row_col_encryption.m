function [cipher_txt] = row_col_encryption(plain_txt, key)
    plain_txt = upper(plain_txt);
    key = upper(key);
    
    % convert string to array of chars
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    
    key = convertStringsToChars(key);
    key = key(key ~= ' ');
    cipher_txt = ' ';
    
    col = strlength(key);
    row = ceil(strlength(plain_txt) / col);
    
    cipherMat = char(zeros(row, col));
    
    % fill with 'X' the unneeded places
    num_spaces_to_add = (row * col) - strlength(plain_txt);
    for i = 1 : num_spaces_to_add
        plain_txt = strcat(plain_txt, 'X');
    end

    % fill the matrix with the plain_txt
    index = 1;
    for i = 1 : row
        for j = 1 : col
            cipherMat(i, j) = plain_txt(index);
            index = index + 1;
        end
    end
    
    str = key;
    sorted_chars = sort(str); % Get characters and sort them alphabetically

    map = containers.Map; % Initialize an empty map

    % Assign values to each character based on their order of appearance
    for i = 1:numel(sorted_chars)
        if isKey(map, sorted_chars(i)) % Check if the key already exists
            % Handle duplicate keys
            map(sorted_chars(i)) = i; % not handled for now
        else
            map(sorted_chars(i)) = i; % Assign value of 1 if the key doesn't exist
        end
    end
    
    % Access the values using the map
     for k = 1 : length(str)
        if isKey(map, str(k)) % Check if the character is a valid key
            col_index = map(str(k)); % Get the column index based on the key
            % Read the corresponding column from cipherMat
            cipher_txt = [cipher_txt, cipherMat(:, col_index)']; % Append the column to cipher_txt
        end
     end
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    disp (cipher_txt);
end
