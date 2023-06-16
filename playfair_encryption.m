function cipher = playfair_encryption(plain, key)

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');

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


% add x in every similar pairs in plaintxt
index = 1;
while(index < length(plain))
    if(plain(index) == plain(index + 1))
        plain = strcat( plain(1 : index), 'x', plain(index + 1 : end));
    end
    index = index + 2;
end

% add x in the end of plaintxt if the length is odd
% add z if last letter is x
if mod(length(plain), 2) ~= 0
    if plain(end - 1) ~= 'x'
        plain = strcat(plain, 'x');
    else
        plain = strcat(plain, 'z');
    end
end


disp(plain);


% encrypt plaintxt
% if two letters are in the same row -> shift right one column
% if two letters are in the same column -> shift down one row
% neither -> (first row, second column) and (second row, first column)
for i = 1: 2 : length(plain)
    % get index of pairs
    [r1, c1] = find(key_chars == plain(i));
    [r2, c2] = find(key_chars == plain(i+1));
    
    if (r1 == r2) % shift right
        cipher(i) = key_chars(r1, mod(c1 + 1 -1, 5) + 1);
        cipher(i+1) = key_chars(r2, mod(c2 + 1 -1, 5) + 1);
        
    elseif (c1 == c2) % shift down
        cipher(i) = key_chars(mod(r1+1 -1, 5) + 1, c1);
        cipher(i+1) = key_chars(mod(r2+1 -1, 5) + 1, c2);
        
    else % 1row, 2col ..... 2row, 1col
        cipher(i) = key_chars(r1, c2);
        cipher(i+1) = key_chars(r2, c1);
        
    end
    
end

% convert to upper
cipher = upper(cipher);

end


%test
%playfair_encryption('balloon', 'monarchy')
%'IBSUPMNA'


