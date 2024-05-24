function S = initialize_S(key)
key_length = length(key);
S = uint8(0:255);
j = 0;
for i = 0:255
    
    % This line updates the value of j based on the current index i,
    %  the current value of j, and the key. The function mod ensures
    %  that j stays within the range of 0 to 255.
    j = mod(j + S(i+1) + key(mod(i, key_length)+1), 256);
    
    % This line swaps the values of S(i+1) and S(j+1) in the S-box.
    %  It essentially shuffles the values of the S-box based on the calculated index j.
    S = swap(S, i+1, j+1);
end
end
