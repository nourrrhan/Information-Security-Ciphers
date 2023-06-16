function plain = simple_substitution_decryption(cipher, key)

plain = '';

% convert ciphertxt to lower and remove space
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');

% store all chars
chars = 'a':'z';

% decrypt
for i = 1 : length(cipher)
    idx = find(key == cipher(i));
    plain(i) = chars(idx);
end

% convert plaintxt to upper
plain = upper(plain);

end

% test
% simple_substitution_decryption('ZYFFK', 'cpqbyhvztjrfxdkogaliusmwne')
% 'HELLO'