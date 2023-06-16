function cipher = rail_fence_encryption(plain, key)

% convert plaintxt to lower and remove space
plain = lower(plain);
plain = plain(plain ~= ' ');

cipher = '';

% calculate the number of rows and columns
rows = key;
cols = length(plain);


% create empty matrix to store plaintxt
for i = 1 : rows
    for j = 1 : cols
        matrix(i, j) = ' ';
    end
end


% write in zigzag matrix
i = 1;
direction = 1;
for j = 1 : cols
    matrix(i, j) = plain(j);

    % update direction
    i = i + direction;
    if i == 1 || i == rows
        direction = -direction;
    end
end


disp(matrix);


% read by row and convert to 1d
cipher = reshape(matrix', 1, []);

% remove spaces and convert ciphertxt to upper
cipher = cipher(cipher ~= ' ');
cipher = upper(cipher);


end

% test
% rail_fence_encryption('defend the east wall', 3)
% 'DNETLEEDHESWLFTAA'
% 'DNETLEEDHESWLXFTAAX'
