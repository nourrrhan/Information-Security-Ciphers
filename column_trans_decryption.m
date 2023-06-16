function plain = column_trans_decryption(cipher, key)

plain = '';

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% calculate the number of rows and columns based on the key length
cols = length(key);
rows = ceil(length(cipher) / cols);


% calculate number of blanks in the string
missing = (cols * rows) - length(cipher);


% add 'X' to the end of ciphertxt if need
for i = 1 : missing
    cipher = strcat(cipher, 'x');
end


% decrypt: reshape the ciphertxt to matrix, rearrange columns
matrix = reshape(cipher, rows, cols);


% rearrange the columns based on the key
[~, order] = sort(key);


% assign the ciphertxt to the matrix column by column based on rearranged key
idx = 1;
for col = 1 : cols
    matrix(:, order(col)) = cipher(idx : idx + rows - 1);
    idx = idx + rows;
end


% convert plain text to 1d
plain = reshape(matrix', 1, []);


% convert plain text to upper
plain = upper(plain);


end

% test
% column_trans_decryption('ARESA SXOST HEYLO IIAIE XPENG DLLTA HTFAX TENHM WX', 'potato')
% 'POTATOESAREINTHENIGHTSHADEFAMILYASWELLXXXX'