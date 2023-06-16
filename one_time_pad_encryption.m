function cipher = one_time_pad_encryption(plain, key)

cipher = '';
dec_cipher = [];

% check the length of key and plaintxt to start encryption
if length(key) == length(plain)

    for i = 1 : length(plain)

        % get plaintxt ascii & key ascii
        char1 = double(plain(i));
        char2 = double(key(i));

        % encryption -> xor between plaintxt & key
        idx = bitxor(char1, char2);
        dec_cipher(i) = double(idx);
        cipher(i) = char(idx);

    end

else
    disp('lengths are not the same')
end

% display ciphertxt in decimal
disp(dec_cipher);

end


% test
% one_time_pad_encryption('helloworld', 'MSECRETKEY')
% '%6)/=2;9)='
% [ 37    54    41    47    61    50    59    57    41    61 ]
