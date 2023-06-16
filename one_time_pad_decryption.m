function plain = one_time_pad_decryption(cipher, key)

plain = '';
dec_plain = [];

% check the length of key and ciphertxt to start encryption
if length(key) == length(cipher)

    for i = 1 : length(cipher)

        % get ciphertxt ascii & key ascii
        char1 = double(cipher(i));
        char2 = double(key(i));

        % decryption -> xor between ciphertxt & key
        idx = bitxor(char1, char2);
        dec_plain(i) = double(idx);
        plain(i) = char(idx);

    end

else
    disp('lengths are not the same')
end

% display plaintxt in decimal
disp(dec_plain);

end


% test
% one_time_pad_decryption('%6)/=2;9)=', 'MSECRETKEY')
% 'helloworld'
% [ 104   101   108   108   111   119   111   114   108   100 ]
