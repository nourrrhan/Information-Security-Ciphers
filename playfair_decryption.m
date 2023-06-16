function plain = playfair_decryption(cipher, key)

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');

% store all chars and convert j to i
chars = 'a':'z';
chars(chars == 'j') = 'i';


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');

% convert j in key to i
key(key == 'j') = 'i';


% store the key and other alphabet chars in 5*5 matrix
key_chars = strcat(key, chars);
key_chars = unique(key_chars, 'stable');
key_chars = reshape(key_chars, [5, 5])';


% decrypt ciphertxt
% if two letters are in the same row -> shift left one column
% if two letters are in the same column -> shift up one row
% neither -> (first row, second column) and (second row, first column)
for i = 1: 2 : length(cipher)
    % get index of pairs
    [r1, c1] = find(key_chars == cipher(i));
    [r2, c2] = find(key_chars == cipher(i+1));
    
    if (r1 == r2) % shift left
        plain(i) = key_chars(r1, mod(c1 - 2, 5) + 1);
        plain(i+1) = key_chars(r2, mod(c2 - 2, 5) + 1);
        
    elseif (c1 == c2) % shift up
        plain(i) = key_chars(mod(r1 - 2, 5) + 1, c1);
        plain(i+1) = key_chars(mod(r2 - 2, 5) + 1, c2);
        
    else % 1row, 2col ..... 2row, 1col
        plain(i) = key_chars(r1, c2);
        plain(i+1) = key_chars(r2, c1);
        
    end
    
end

% convert to upper
plain = upper(plain);

end


%test
%playfair_decryption('IBSUPMNA', 'monarchy')
%'BALXLOON'


