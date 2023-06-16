function cipher = double_trans_encryption(plain, key_row, key_col)


% get matrix size
r = length(key_row); 
c = length(key_col); 


% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');


% store plaintext in matrix of r*c row by row
k = 1;
for i = 1 : r
    for j = 1 : c
        Mat(i, j) = plain(k);
        k = k  + 1;
    end
end


% permute rows of matrix by key rows
for i = 1 : r
    cipher_txt1(i,:) = Mat(key_row(i),:);
end 


% permute columns of matrix by key columns
for i = 1 : c
    cipher_txt2(:,i) = cipher_txt1(:,key_col(i));
end 


% reshape the cipher text matrix into one dimensional and convert to upper
cipher = reshape(cipher_txt2', [1, r*c]);
cipher = upper(cipher);


end


%test
%double_trans_encryption('attackatdawn', [3,2,1], [4,2,1,3])
%'NADWTKCAATAT'
