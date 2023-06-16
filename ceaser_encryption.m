function cipher = ceaser_encryption(plain, key)

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');

% store all chars 
chars = 'a':'z';

% modify the key for big numbers
key = mod(key, 26);

% get random key for general case
%key = randsample(26,1);

for i = 1 : length(plain)
    % find the index of current char in the plain text
    idx = find(chars == plain(i)) - 1;
    
    % enrypt current char and store result
    idx = mod((idx + key), 26) + 1;
    cipher(i) = chars(idx);
end

% convert cipher text to upper
cipher = upper(cipher);

end


%test
%ceaser_encryption('fourscoreandsevenyearsago', 3)
%'IRXUVFRUHDQGVHYHQBHDUVDJR'
