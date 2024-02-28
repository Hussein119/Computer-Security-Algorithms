function [cipher_txt] = rail_fence_encryption(plain_txt, key)
    plain_txt = upper(plain_txt);
    plain_txt = convertStringsToChars(plain_txt);
    plain_txt = plain_txt(plain_txt ~= ' ');
    len_plain = length(plain_txt);
    
    rail_fence = char(zeros(key, len_plain));

    downward = true;
    row = 1;

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
    
    cipher_txt = '';
    for row = 1 : key
        cipher_txt = [cipher_txt, rail_fence(row, rail_fence(row,:) ~= 0)];
    end
    
    cipher_txt = cipher_txt(cipher_txt ~= ' ');
    disp(cipher_txt);

end
