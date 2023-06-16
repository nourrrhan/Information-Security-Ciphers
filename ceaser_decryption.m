function plain = ceaser_decryption(cipher, key)

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');

% store all chars 
chars = 'a':'z';

% modify the key for big numbers
key = mod(key, 26);


for i = 1 : length(cipher)
    % find the index of current char in the ciphertxt
    idx = find(chars == cipher(i)) - 1;
    
    % decrypt current char and store result
    idx = mod((idx - key + 26), 26) + 1;
    plain(i) = chars(idx);
end

% convert plain text to upper
plain = upper(plain);

end


%test
%ceaser_decryption('VSRQJHEREVTXDUHSDQWV', 3)
%'SPONGEBOBSQUAREPANTS'
