function cipher = vigenere_encryption(plain, key)

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% check the length of key and plaintxt to start encryption
len = length(key);
if length(key) < length(plain)
    % repeat the key
    i = 1;
    while(length(key) < length(plain))
        c = key(i);
        key = strcat(key, c);
        i = mod(i + 1, len);
    end
end


% encryption => (p + k) mod 26
for i = 1 : length(plain)
    % get plaintxt index & key index
    idx1 = find(chars == plain(i)) - 1;
    idx2 = find(chars == key(i)) - 1;

    % encryption -> (plaintxt + key) % 26
    cipher(i) = chars( mod( idx1 + idx2, 26 ) + 1 );
end

% convert to upper
cipher = upper(cipher);


end

% test
% vigenere_encryption('hello world', 'secret')
% 'ZINCSPGVNU'
