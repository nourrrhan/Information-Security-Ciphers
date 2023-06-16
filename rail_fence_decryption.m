function plain = rail_fence_decryption(cipher, key)

% convert ciphertxt to lower and remove space
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');

plain = '';

% calculate the number of rows and columns
rows = key;
cols = length(cipher);


% create empty matrix to store ciphertxt
for i = 1 : rows
    for j = 1 : cols
        matrix(i, j) = ' ';
    end
end



% write ciphertxt by row in a zigzag way
k = 1;
for r = 1 : rows
    i = 1;
    direction = 1;

    for j = 1 : cols
        % write by row
        if i == r
            matrix(i, j) = cipher(k);
            k = k + 1;
        end

        % update direction
        i = i + direction;
        if i == 1 || i == rows
            direction = -direction;
        end
    end

end


disp(matrix);


% read by row and convert to 1d
plain = reshape(matrix, 1, []);

% remove spaces and convert plaintxt to upper
plain = plain(plain ~= ' ');
plain = upper(plain);


end

% test
% rail_fence_decryption('DNETLEEDHESWLFTAA', 3)
% 'DEFENDTHEEASTWALL'
