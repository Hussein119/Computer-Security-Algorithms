function [plain_txt] = rail_fence_decryption(cipher_txt, key)

    cipher_txt = upper(cipher_txt);
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    
    num_rows = key;
    len_cipher = length(cipher_txt);
    
    rail_fence = zeros(num_rows, len_cipher);
    
    % mark the places with '*'
    downward = true;
    row = 1;
    for i = 1 : len_cipher
        rail_fence(row, i) = '*';
        if row == 1
            downward = true;
        elseif row == num_rows
            downward = false;
        end 
       
        if downward
            row = row + 1;
        else
            row = row - 1;
        end
    end
    
    % now we can construct the fill the rail matrix
    index = 1;
    for i = 1 : num_rows 
        for j = 1 : len_cipher
            if rail_fence (i,j) == '*' && index <= len_cipher
                rail_fence (i,j) = cipher_txt(index);
                index = index + 1;
            end
        end
    end
    
    plain_txt = '';
    % read the matrix in a zig-zag manner to get the plain text
    row = 1;
    col = 1;
    downward = true;
    for i = 1 : len_cipher
        
        if rail_fence (row,col) ~= '*'
            plain_txt = [plain_txt, rail_fence(row, col)];
            col = col + 1;
        end
        
        if row == 1
            downward = true;
        elseif row == num_rows
            downward = false;
        end 

        if downward
            row = row + 1;
        else
            row = row - 1;
        end
    end
    
    disp(plain_txt);

end
