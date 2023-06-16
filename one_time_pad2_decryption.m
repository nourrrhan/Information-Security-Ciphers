function plain = one_time_pad2_decryption(cipher, key)

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% check the length of key and ciphertxt to start decryption
if length(key) == length(cipher)

    for i = 1 : length(cipher)

        % get ciphertxt index & key index
        idx1 = find(chars == cipher(i)) - 1;
        idx2 = find(chars == key(i)) - 1;

        % decryption -> (ciphertxt - key) % 26
        plain(i) = chars( mod( idx1 - idx2, 26 ) + 1 );

    end

    % convert to upper
    plain = upper(plain);

else
    disp('lengths are not the same')
end

end


%test
%one_time_pad2_decryption('EQNVZ', 'XMCKL')
%'HELLO'
