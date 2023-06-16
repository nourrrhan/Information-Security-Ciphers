function plain = double_trans_decryption(cipher, key_row, key_col)

% get matrix size
r = length(key_row); 
c = length(key_col); 


% convert ciphertext to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% store ciphertext in matrix of r*c row by row
k = 1;
for i = 1 : r
    for j = 1 : c
        Mat(i, j) = cipher(k);
        k = k  + 1;
    end
end


% permute columns of matrix by key columns
for i = 1 : c
    x = find(key_col == i);
    plain_txt1(:,i) = Mat(:, x);
end 


% permute rows of matrix by key rows
for i = 1 : r
    plain_txt2(i,:) = plain_txt1(key_row(i), :);
end 


% reshape the plain text matrix into one dimensional and convert to upper
plain = reshape(plain_txt2', [1, r*c]);
plain = upper(plain);


end


%test
%double_trans_decryption('NADWTKCAATAT', [3,2,1], [4,2,1,3])
%'ATTACKATDAWN'
