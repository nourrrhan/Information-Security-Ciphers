function cipher = hill_encryption(plain, key)

% convert plaintxt and key to lower and remove space
key = lower(key);
plain = lower(plain);
plain = plain(plain ~= ' ');
cipher = '';


% store all chars
chars = 'a':'z';


% convert plaintxt to double
for i = 1: length(plain)
    new_plain(i) = find(chars == plain(i)) - 1;
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
        % encryption => c = (k * p) mod 26
        for i = 1 : len : length(plain)

            % get first (len) chars from plaintxt
            Plain_Index = new_plain(i : i + len - 1);
      
            % transpose plaintxt to be column to multiply
            res = new_key * Plain_Index';
            res = mod(res, 26);

            cipher(i : i + len - 1) = chars(res + 1);
        end
    end

    % convert ciphertxt to upper
    cipher = upper(cipher);

end


end


% test
% hill_encryption('pay more money', 'identical')
% 'IXIYMDUCGEVE'
