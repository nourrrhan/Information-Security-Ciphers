function [cipher, key] = simple_substitution_encryption(plain)

cipher = '';

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');

% store all chars 
chars = 'a':'z';

% generate a random key
key = chars(randperm(length(chars)));

disp(key);

% encrypt
for i = 1 : length(plain)
    idx = find(chars == plain(i));
    cipher(i) = key(idx);
end

% convert cipher to upper
cipher = upper(cipher);

end

% test
% [cipher, key] = simple_substitution_encryption('hello')
% 'ZYFFK', 'cpqbyhvztjrfxdkogaliusmwne'
