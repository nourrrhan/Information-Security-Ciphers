function cipher = affine_encryption(plain, a, b)

cipher = '';

% convert plaintext to lower and remove spaces
plain = lower(plain);
plain = plain(plain ~= ' ');


% store all chars 
chars = 'a':'z';


% check that a has no common factors with 26
if gcd(a, 26) == 1
    for i = 1: length(plain)

        % encryption -> cipher = (a * x + b) mod m
        x = find(chars == plain(i)) - 1;

        idx = (a * x) + b;
        idx = mod(idx, 26);

        cipher(i) = chars(idx + 1);

    end

else
    disp('a must has no common factors with 26');
end

% convert to upper
cipher = upper(cipher);

end


%test
%affine_encryption('affinecipher', 5, 8)
%'IHHWVCSWFRCP'

