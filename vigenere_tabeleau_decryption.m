function plain = vigenere_tabeleau_decryption(cipher, key)

plain = '';

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% create 26 * 26 matrix of all letters permutations
for i = 1 : 26
    mat(i, :) = [ chars(i : end)   chars(1 : i - 1) ];
end


% check the length of key and ciphertxt to start decryption
len = length(key);
if length(key) < length(cipher)
    i = 1;

    while(length(key) < length(cipher))
        c = key(i);
        key = strcat(key, c);

        % repeat key chars when it's end
        if i == len
            i = 1;
        else
            i = i + 1;
        end

    end

end


% decryption -> find ciphertxt column in key row
for i = 1: length(cipher)
    
    % key index for rows 
    idx1 = find(chars == key(i));

    % search about ciphertxt column in the row
    idx2 = find(mat(idx1, : ) == cipher(i));

    plain(i) = chars(idx2);

end

% convert to upper
plain = upper(plain);

end


% test
% vigenere_tabeleau_decryption('ZICVTWQNGRZGVTWAVZHCQYGLMGJ', 'deceptive')
% 'WEAREDISCOVEREDSAVEYOURSELF'

