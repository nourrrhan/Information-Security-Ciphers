function plain = vigenere_decryption(cipher, key)

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% check the length of key and ciphertxt to start decryption
len = length(key);
if length(key) < length(cipher)
    % repeat the key
    i = 1;
    while(length(key) < length(cipher))
        c = key(i);
        key = strcat(key, c);
        i = mod(i + 1, len);
    end
end


% decryption => (c - k) mod 26
for i = 1 : length(cipher)
    % get ciphertxt index & key index
    idx1 = find(chars == cipher(i)) - 1;
    idx2 = find(chars == key(i)) - 1;

    % decryption -> (ciphertxt - key) % 26
    plain(i) = chars( mod( idx1 - idx2, 26 ) + 1 );
end

% convert to upper
plain = upper(plain);


end

% test
% vigenere_decryption('zincspgvnu', 'secret')
% 'HELLOWORLD'
