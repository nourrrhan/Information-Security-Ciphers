function plain = hill_decryption(cipher, key)

% convert ciphertxt and key to lower and remove space
key = lower(key);
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');
plain = '';


% store all chars
chars = 'a':'z';


% convert ciphertxt to double
for i = 1: length(cipher)
    new_cipher(i) = find(chars == cipher(i)) - 1;
end


% check if the key can be stored in n*n matrix
len = sqrt(length(key));

if len ~= int16(len)
    disp('key cant fit in square matrix');
else

    % store key in matrix
    for i = 1: length(key)
        new_key(i) = find(chars == key(i)) - 1;
    end

    % reshape to square matrix by row
    new_key = reshape(new_key, len, len)';

    
    % calculate determinate and its inverse
    d = int16(det(new_key));
    d_inv = -1;
    for i = 1 : 25
        if mod(d * i, 26) == 1
            d_inv = i;
            break;
        end
    end


    % check that the determinate of the key matrix has inverse
    if d_inv == -1
        disp('Key is not valid');
    else
        % decryption => p = (k^-1 * c) mod 26

        % calculate adjoint matrix of key
        key_adj = adjoint(new_key);

        % calculate determinate inverse * adjoint matrix
        x = int16(d_inv * key_adj);

        % calculate key inverse
        key_inv = mod(x, 26);
        disp(key_inv);

        % decrypt ciphertxt
        for i = 1 : len : length(cipher)
            % get first (len) chars from ciphertxt
            Cipher_index = new_cipher(i : i + len - 1);
            
            % transpose ciphertxt to be column to multiply
            res = double(key_inv) * Cipher_index';
            res = mod(res, 26);
            
            plain(i : i + len - 1) = chars(res + 1);
        end

    end

    % convert ciphertxt to upper
    plain = upper(plain);

end


end


% test
% hill_decryption('IXIYMDUCGEVE', 'identical')
% 'PAYMOREMONEY'
