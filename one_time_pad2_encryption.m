function cipher = one_time_pad2_encryption(plain, key)

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');


% convert key to lower and remove spaces
key = lower(key);
key = key(key ~= ' ');


% store all chars 
chars = 'a':'z';


% check the length of key and plaintxt to start encryption
if length(key) == length(plain)

    for i = 1 : length(plain)

        % get plaintxt index & key index
        idx1 = find(chars == plain(i)) - 1;
        idx2 = find(chars == key(i)) - 1;

        % encryption -> (key + plaintxt) % 26
        cipher(i) = chars( mod( idx1 + idx2, 26 ) + 1 );

    end

    % convert to upper
    cipher = upper(cipher);

else
    disp('lengths are not the same')
end

end


%test
%one_time_pad2_encryption('hello', 'XMCKL')
%'EQNVZ'
