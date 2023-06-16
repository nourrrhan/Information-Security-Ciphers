function cipher = column_trans_encryption(plain, key)

cipher = '';

% convert plaintxt to lower and remove space
plain = lower(plain);
plain = plain(plain ~= ' ');

% calculate the number of rows and columns based on the key length
cols = length(key);
rows = ceil(length(plain) / cols);

% calculate number of blanks in the string
missing = (cols * rows) - length(plain);

% add 'X' to the end of plaintxt if need
for i = 1 : missing
    plain = strcat(plain, 'x');
end

% encrypt: reshape the plaintxt to matrix, rearrange columns
matrix = reshape(plain, cols, rows)';

% rearrange the columns of the matrix based on the key order
[~, order] = sort(key);
disp(order);
matrix = matrix(:, order);

% read the matrix by columns
cipher = matrix';

% convert cipher text to 1d
cipher = reshape(cipher', 1, []);

% convert cipher text to upper
cipher = upper(cipher);

end

% test
% column_trans_encryption('The tomato is a plant in the nightshade family', 'tomato')
% 'TINESAXEOAHTFXHTLTHEYMAIIAIXTAPNGDLOSTNHMX'

