function cipher = vigenere_tabeleau_encryption(plain, key)

cipher = '';

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% create 26 * 26 matrix of all letters permutations
for i = 1 : 26
    mat(i, :) = [ chars(i : end)   chars(1 : i - 1) ];
end


% check the length of key and plaintxt to start encryption
len = length(key);
if length(key) < length(plain)
    i = 1;

    while(length(key) < length(plain))
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


% encryption -> intersection between key & plaintxt in the matrix
for i = 1: length(plain)
    
    % key index for rows, plaintxt index for columns 
    idx1 = find(chars == plain(i));
    idx2 = find(chars == key(i));

    cipher(i) = mat(idx2, idx1);

end

disp(key);

% convert to upper
cipher = upper(cipher);

end


% test
% vigenere_tabeleau_encryption('wearediscoveredsaveyourself', 'deceptive')
% 'ZICVTWQNGRZGVTWAVZHCQYGLMGJ'

