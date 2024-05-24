function [cipher_txt] = rail_fence_encryption(plain_txt, key)
plain_txt = upper(plain_txt);
plain_txt = convertStringsToChars(plain_txt);
plain_txt = plain_txt(plain_txt ~= ' ');
len_plain = length(plain_txt);

row = 1; % track the current row in the rail fence matrix.
downward = true; %  track the direction of movement (downward or upward).
rail_fence = char(zeros(key,len_plain)); % Initialize a matrix filled with zeros

for i = 1 : len_plain
    rail_fence(row, i) = plain_txt(i);
    
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

cipher_txt = '';
for j = 1 : key
    cipher_txt = [cipher_txt, rail_fence(j, rail_fence(j,:) ~= 0)];
end

cipher_txt = cipher_txt(cipher_txt ~= ' ');
disp(cipher_txt);

end
