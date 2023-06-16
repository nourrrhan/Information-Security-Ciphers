function plain = affine_decryption(cipher, a, b)

plain = '';

% convert ciphertxt to lower and remove spaces
cipher = lower(cipher);
cipher = cipher(cipher ~= ' ');


% store all chars 
chars = 'a':'z';


% check that a has no common factors with 26
if gcd(a, 26) == 1

    % find multiplicative inverse of a (mod 26)
    for i = 1 : 26
        
        if mod(a * i, 26) == 1
            a_inv = i;
            break;
        end

    end


    for i = 1: length(cipher)

        % decryption -> plain = a_inv * (x - b) mod m
        x = find(chars == cipher(i)) - 1;
        
        idx = a_inv * (x - b);
        idx = mod(idx, 26);

        plain(i) = chars(idx + 1);

    end

else
    disp('a must has no common factors with 26');
end


% convert to upper
plain = upper(plain);


end


% test
% affine_decryption('IHHWVCSWFRCP', 5, 8)
% 'AFFINECIPHER'

